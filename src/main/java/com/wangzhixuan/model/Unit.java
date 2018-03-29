package com.wangzhixuan.model;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableName;

/**
 *
 * 单位信息
 *
 */
@TableName("tb_unit")
public class Unit implements Serializable {
	private static final long serialVersionUID = 1L;

	/** 主键id */
	private Long id;
	/** 单位编码 */
	private String unitCode;
	/** 单位名称 */
	private String unitName;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUnitCode() {
		return unitCode;
	}

	public void setUnitCode(String unitCode) {
		this.unitCode = unitCode;
	}

	public String getUnitName() {
		return unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}


}
