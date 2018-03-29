package com.wangzhixuan.service;

import com.baomidou.mybatisplus.service.IService;
import com.wangzhixuan.commons.result.PageInfo;
import com.wangzhixuan.model.OrderItem;

/**
 *
 * IOrderItem 表数据服务层接口
 *
 */
public interface IOrderItemService extends IService<OrderItem> {
	void selectDataGrid(PageInfo pageInfo);

}