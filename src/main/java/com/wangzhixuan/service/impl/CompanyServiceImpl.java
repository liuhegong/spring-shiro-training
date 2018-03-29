package com.wangzhixuan.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.wangzhixuan.commons.result.PageInfo;
import com.wangzhixuan.mapper.CompanyMapper;
import com.wangzhixuan.model.Company;
import com.wangzhixuan.service.ICompanyService;

/**
 *
 * Company 表数据服务层接口实现类
 *
 */
@Service
public class CompanyServiceImpl extends ServiceImpl<CompanyMapper, Company> implements ICompanyService {

    @Autowired
	private CompanyMapper companyMapper;

	@Override
	public void selectDataGrid(PageInfo pageInfo) {
		Page<Company> page = new Page<Company>(pageInfo.getNowpage(), pageInfo.getSize());

		EntityWrapper<Company> wrapper = new EntityWrapper<Company>();
		wrapper.orderBy(pageInfo.getSort(), pageInfo.getOrder().equalsIgnoreCase("ASC"));
		selectPage(page, wrapper);

		pageInfo.setRows(page.getRecords());
		pageInfo.setTotal(page.getTotal());
	}


}