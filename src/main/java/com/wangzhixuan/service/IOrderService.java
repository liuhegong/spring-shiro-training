package com.wangzhixuan.service;

import com.baomidou.mybatisplus.service.IService;
import com.wangzhixuan.commons.result.PageInfo;
import com.wangzhixuan.model.Order;

/**
 *
 * Order 表数据服务层接口
 *
 */
public interface IOrderService extends IService<Order> {
	void selectDataGrid(PageInfo pageInfo);

	/**
	 * <b>方法描述：</b>添加订单<br/>
	 * <b>参数描述：</b><br/>
	 * 
	 * @param order<br/>
	 * @return void<br/>
	 * @version<b>版本：</b>V1<br/>
	 * @author<b>创建人：</b>hugo<br/>
	 */
	void addOrder(Order order);

}