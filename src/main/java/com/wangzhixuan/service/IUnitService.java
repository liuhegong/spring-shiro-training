package com.wangzhixuan.service;

import com.baomidou.mybatisplus.service.IService;
import com.wangzhixuan.commons.result.PageInfo;
import com.wangzhixuan.model.Unit;

/**
 *
 * unit 表数据服务层接口
 *
 */
public interface IUnitService extends IService<Unit> {
	void selectDataGrid(PageInfo pageInfo);

}