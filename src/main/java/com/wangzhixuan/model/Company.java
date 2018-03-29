package com.wangzhixuan.model;

import java.io.Serializable;

import org.hibernate.validator.constraints.NotBlank;

import com.wangzhixuan.commons.utils.JsonUtils;

/**
 *
 * 公司信息
 *
 */
public class Company implements Serializable {

	private static final long serialVersionUID = 1L;

	/** 主键id */
	private Long id;

	/** 组织名 */
	@NotBlank
	private String name;

	/** 负责人 */
	private String principal;

	/** 电话 */
	private String telephone;

	/** 手机 */
	private String mobile;

	/** 地址 */
	private String address;

	/** 状态 0正常 1停用 */
	private int status;

	/** 备注 */
	private String description;



	@Override
	public String toString() {
		return JsonUtils.toJson(this);
	}



	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}

	public String getPrincipal() {
		return principal;
	}

	public void setPrincipal(String principal) {
		this.principal = principal;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getMobile() {
		return mobile;
	}


	public void setMobile(String mobile) {
		this.mobile = mobile;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
