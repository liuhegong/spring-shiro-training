package com.wangzhixuan.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.wangzhixuan.commons.result.PageInfo;
import com.wangzhixuan.mapper.UnitMapper;
import com.wangzhixuan.model.Unit;
import com.wangzhixuan.service.IUnitService;

/**
 *
 * Company 表数据服务层接口实现类
 *
 */
@Service
public class UnitServiceImpl extends ServiceImpl<UnitMapper, Unit> implements IUnitService {

    @Autowired
	private UnitMapper unitMapper;

	@Override
	public void selectDataGrid(PageInfo pageInfo) {
		Page<Unit> page = new Page<Unit>(pageInfo.getNowpage(), pageInfo.getSize());

		EntityWrapper<Unit> wrapper = new EntityWrapper<Unit>();
		wrapper.orderBy(pageInfo.getSort(), pageInfo.getOrder().equalsIgnoreCase("ASC"));
		selectPage(page, wrapper);

		pageInfo.setRows(page.getRecords());
		pageInfo.setTotal(page.getTotal());
	}


}