package com.wangzhixuan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.wangzhixuan.commons.result.PageInfo;
import com.wangzhixuan.mapper.OrderItemMapper;
import com.wangzhixuan.model.OrderItem;
import com.wangzhixuan.service.IOrderItemService;

/**
 *
 * OrderItem 表数据服务层接口实现类
 *
 */
@Service
public class OrderItemServiceImpl extends ServiceImpl<OrderItemMapper, OrderItem> implements IOrderItemService {

	@Autowired
	private OrderItemMapper orderItemMapper;

	@Override
	public void selectDataGrid(PageInfo pageInfo) {
		Page<OrderItem> page = new Page<OrderItem>(pageInfo.getNowpage(), pageInfo.getSize());

		EntityWrapper<OrderItem> wrapper = new EntityWrapper<OrderItem>();
		wrapper.orderBy(pageInfo.getSort(), pageInfo.getOrder().equalsIgnoreCase("ASC"));
		selectPage(page, wrapper);

		List<OrderItem> records = page.getRecords();
		pageInfo.setRows(records);
		pageInfo.setTotal(page.getTotal());
	}


}