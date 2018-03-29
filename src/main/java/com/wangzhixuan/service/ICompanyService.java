package com.wangzhixuan.service;

import com.baomidou.mybatisplus.service.IService;
import com.wangzhixuan.commons.result.PageInfo;
import com.wangzhixuan.model.Company;

/**
 *
 * Company 表数据服务层接口
 *
 */
public interface ICompanyService extends IService<Company> {
	void selectDataGrid(PageInfo pageInfo);

}