package com.wangzhixuan.model;

import java.io.Serializable;
import java.math.BigDecimal;

import com.baomidou.mybatisplus.annotations.TableName;
import com.wangzhixuan.commons.utils.JsonUtils;

/**
 *
 * 订单详细信息(货物信息)
 *
 */
@TableName("order_item")
public class OrderItem implements Serializable {

	private static final long serialVersionUID = 1L;

	/** 主键id */
	private Long id;

	/** 订单id */
	private Long orderId;

	/** 商品id */
	private Long itemId;

	/** 货号 */
	private String itemNo;

	/** 商品标题 */
	private String title;

	/** 单位 */
	private String itemUnit;

	/** 商品数量 */
	private int num;

	/** 商品单价 */
	private BigDecimal price;

	/** 总金额 */
	private BigDecimal totalFee;

	/** 商品图片地址 */
	private String picPath;

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

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public Long getItemId() {
		return itemId;
	}

	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public BigDecimal getTotalFee() {
		return totalFee;
	}

	public void setTotalFee(BigDecimal totalFee) {
		this.totalFee = totalFee;
	}

	public String getPicPath() {
		return picPath;
	}

	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}

	public String getItemNo() {
		return itemNo;
	}

	public void setItemNo(String itemNo) {
		this.itemNo = itemNo;
	}


	public String getItemUnit() {
		return itemUnit;
	}

	public void setItemUnit(String itemUnit) {
		this.itemUnit = itemUnit;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
