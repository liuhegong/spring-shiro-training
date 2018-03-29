package com.wangzhixuan.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.wangzhixuan.model.Order;

/**
 *
 * Order 表数据库控制层接口
 *
 */
public interface OrderMapper extends BaseMapper<Order> {
	/**
	 * <b>方法描述：</b>获取最后一条记录的订单号<br/>
	 * <b>参数描述：</b><br/>
	 * @return<br/>
	 * @return String<br/>
	 * @version<b>版本：</b>V1<br/>
	 * @author<b>创建人：</b>hugo<br/>
	 */
	String selectLastRecordOrderNo();

}