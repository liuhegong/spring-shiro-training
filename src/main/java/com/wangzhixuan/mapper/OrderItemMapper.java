package com.wangzhixuan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.wangzhixuan.model.OrderItem;

/**
 *
 * OrderItem 表数据库控制层接口
 *
 */
public interface OrderItemMapper extends BaseMapper<OrderItem> {
	/**
	 * <b>方法描述：</b>根据订单号查询<br/>
	 * <b>参数描述：</b><br/>
	 * 
	 * @param orderId
	 * @return<br/>
	 * @return List<OrderItem><br/>
	 * @version<b>版本：</b>V1<br/>
	 * @author<b>创建人：</b>hugo<br/>
	 */
	List<OrderItem> selectItemByOrderId(@Param("orderId") Long orderId);

}