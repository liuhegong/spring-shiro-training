package com.wangzhixuan.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.wangzhixuan.commons.utils.JsonUtils;

/**
 *
 * 订单（送货单）信息
 *
 */
@TableName("tb_order")
public class Order implements Serializable {

	private static final long serialVersionUID = 1L;

	/** 主键id */
	private Long id;
	/**
	 * 单号：年月日+四位流水号
	 */
	private String orderNo;

	/**
	 * 订单日期
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date orderDate;
	/**
	 * 创建时间
	 */
	private Date createTime;
	/**
	 * 客户ID
	 */
	private Long customerId;

	/**
	 * 客户信息
	 */
	@TableField(exist = false)
	private Customer customer;

	/**
	 * 备注
	 */
	private String description;
	/**
	 * 地址
	 */
	private String address;
	/**
	 * 电话
	 */
	private String telephone;
	/**
	 * 手机
	 */
	private String mobile;
	/**
	 * 业务员
	 */
	private String salesman;
	/**
	 * 制单
	 */
	private String prepareDocument;
	/**
	 * 审核员
	 */
	private String audit;
	/**
	 * 签收
	 */
	private String signfor;

	@TableField(exist = false)
	private String itemJSONStr;

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

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public Long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public String getSalesman() {
		return salesman;
	}

	public void setSalesman(String salesman) {
		this.salesman = salesman;
	}

	public String getPrepareDocument() {
		return prepareDocument;
	}

	public void setPrepareDocument(String prepareDocument) {
		this.prepareDocument = prepareDocument;
	}

	public String getAudit() {
		return audit;
	}

	public void setAudit(String audit) {
		this.audit = audit;
	}

	public String getSignfor() {
		return signfor;
	}

	public void setSignfor(String signfor) {
		this.signfor = signfor;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getItemJSONStr() {
		return itemJSONStr;
	}

	public void setItemJSONStr(String itemJSONStr) {
		this.itemJSONStr = itemJSONStr;
	}

}
