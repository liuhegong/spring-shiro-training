package com.wangzhixuan.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.alibaba.fastjson.JSONArray;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.wangzhixuan.commons.result.PageInfo;
import com.wangzhixuan.mapper.CustomerMapper;
import com.wangzhixuan.mapper.OrderItemMapper;
import com.wangzhixuan.mapper.OrderMapper;
import com.wangzhixuan.model.Customer;
import com.wangzhixuan.model.Order;
import com.wangzhixuan.model.OrderItem;
import com.wangzhixuan.service.IOrderService;

/**
 *
 * Order 表数据服务层接口实现类
 *
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements IOrderService {

	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private OrderItemMapper orderItemMapper;
    @Autowired
	private CustomerMapper customerMapper;

	@Override
	public void selectDataGrid(PageInfo pageInfo) {
		Page<Order> page = new Page<Order>(pageInfo.getNowpage(), pageInfo.getSize());

		EntityWrapper<Order> wrapper = new EntityWrapper<Order>();
		wrapper.orderBy(pageInfo.getSort(), pageInfo.getOrder().equalsIgnoreCase("ASC"));
		selectPage(page, wrapper);

		List<Order> records = page.getRecords();
		if (records != null) {
			for (Order order : records) {
				Customer customer = customerMapper.selectById(order.getCustomerId());
				order.setCustomer(customer);
			}
		}
		pageInfo.setRows(records);
		pageInfo.setTotal(page.getTotal());
	}

	@Override
	public void addOrder(Order order) {
		Date now = new Date();
		String orderNo = getOrderNo(now);
		order.setOrderNo(orderNo);
		order.setCreateTime(now);
		this.insert(order);
		String itemJSONStr = order.getItemJSONStr();
		itemJSONStr = itemJSONStr.replaceAll("&quot;", "\"");
		List<OrderItem> orderItems = JSONArray.parseArray(itemJSONStr, OrderItem.class);
		if (orderItems != null) {
			for (OrderItem orderItem : orderItems) {
				orderItem.setOrderId(order.getId());
				orderItemMapper.insert(orderItem);
			}
		}

	}

	/**
	 * <b>方法描述：</b>获取订单号<br/>
	 * <b>参数描述：</b><br/>
	 * 
	 * @param now
	 * @return<br/>
	 * @return String<br/>
	 * @version<b>版本：</b>V1<br/>
	 * @author<b>创建人：</b>hugo<br/>
	 */
	private String getOrderNo(Date now) {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		String orderNo = orderMapper.selectLastRecordOrderNo();
		if (StringUtils.isEmpty(orderNo)) {
			return format.format(now) + "0001";
		} else {
			String noStr = orderNo.substring(8, orderNo.length());
			Integer noInteger = Integer.parseInt(noStr);
			noInteger++;
			if (noInteger.toString().length() == 1) {
				noStr = "000" + noInteger;
			} else if (noInteger.toString().length() == 2) {
				noStr = "00" + noInteger;
			} else if (noInteger.toString().length() == 3) {
				noStr = "0" + noInteger;
			} else {
				noStr = noInteger.toString();
			}

			return format.format(now) + noStr;
		}
	}

}