package com.wangzhixuan.service;

import com.baomidou.mybatisplus.service.IService;
import com.wangzhixuan.commons.result.PageInfo;
import com.wangzhixuan.model.Customer;

/**
 *
 * Company 表数据服务层接口
 *
 */
public interface ICustomerService extends IService<Customer> {
	void selectDataGrid(PageInfo pageInfo);

}