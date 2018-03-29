package com.wangzhixuan.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.wangzhixuan.commons.result.PageInfo;
import com.wangzhixuan.mapper.CustomerMapper;
import com.wangzhixuan.model.Customer;
import com.wangzhixuan.service.ICustomerService;

/**
 *
 * Company 表数据服务层接口实现类
 *
 */
@Service
public class CustomerServiceImpl extends ServiceImpl<CustomerMapper, Customer> implements ICustomerService {

    @Autowired
	private CustomerMapper customerMapper;

	@Override
	public void selectDataGrid(PageInfo pageInfo) {
		Page<Customer> page = new Page<Customer>(pageInfo.getNowpage(), pageInfo.getSize());

		EntityWrapper<Customer> wrapper = new EntityWrapper<Customer>();
		wrapper.orderBy(pageInfo.getSort(), pageInfo.getOrder().equalsIgnoreCase("ASC"));
		selectPage(page, wrapper);

		pageInfo.setRows(page.getRecords());
		pageInfo.setTotal(page.getTotal());
	}


}