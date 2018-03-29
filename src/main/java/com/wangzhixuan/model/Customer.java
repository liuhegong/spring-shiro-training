package com.wangzhixuan.model;

import java.io.Serializable;
import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;

import com.wangzhixuan.commons.utils.JsonUtils;

/**
 *
 * 客户信息
 *
 */
public class Customer implements Serializable {

	private static final long serialVersionUID = 1L;

	/** 主键id */
	private Long id;

	/** 名称 */
	@NotBlank
	private String name;

	/** 联系人人 */
	private String linkman;

	/** 电话 */
	private String telephone;

	/** 手机 */
	private String mobile;

	/** 地址 */
	private String address;

	/** 备注 */
	private String description;

	/** 创建日期 */
	private Date createTime;



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

	public String getLinkman() {
		return linkman;
	}

	public void setLinkman(String linkman) {
		this.linkman = linkman;
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



	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}
