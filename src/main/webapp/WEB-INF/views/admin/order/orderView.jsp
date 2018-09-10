<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">

</script>
<style>
	.showViewTable{
		margin:0 auto;
		border:0px solid;
		border-style:groove;
		display: table;
		border-collapse: separate;
		border-spacing: 2px;
		width:100%;
		font-size: 16px;
	}
	.showViewTable td{
		font-size: 16px;
		text-align: left;
	}
	.itemTable{
		display: table;
		border-collapse: separate;
		border-spacing: 0px;
		margin:0 auto;
		border-style:solid;
		width:100%;
		margin-top: 2px;
		padding:0px;
		border: solid 1px rgb(82,118,243);
		border-width: 1px 0px 1px 1px;
		font-size: 16px;
	}
	.itemTable td{
		border:solid 1px rgb(82,118,243);
		border-width:1px 1px 0px 0px;
		display: table-cell;
		vertical-align: inherit;
		text-align: center;
		font-size: 16px;
	}

	.itemTable th{
		border:solid 1px rgb(82,118,243);
		border-width:0px 1px 0px 0px;
		display: table-cell;
		vertical-align: inherit;
		text-align: center;
		font-size: 16px;
	}


</style>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;color: rgb(82,118,243);">
            <table  class="showViewTable">
				<thead>
					<th colspan="2" align="center" style="font-size: 30px;">阳江市江城区建泓五金制品厂送货单</th>
				</thead>
                <tr>
                    <td width="80%">送货日期：<fmt:formatDate pattern="yyyy-MM-dd"  value="${order.orderDate }" /></td>
                	<td>单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：${order.orderNo }</td>
                </tr>
                <tr>
                    <td width="80%">客户单位：${order.customer.name }</td>
                    <td >联&nbsp;&nbsp;系&nbsp;人：${order.customer.linkman }</td>
                </tr>
                <tr>
                    <td width="80%">联系地址：${order.customer.address }</td>
                    <td>联系电话：${order.customer.telephone }</td>
                </tr>
               </table>
               
                <table class="itemTable">
					<tr>
						<th align="center" >货号：</th>
						<th align="center" >名称及规格</th>
						<th  align="center" >单位</th>
						<th align="center" >数量</th>
						<th align="center" >单价</th>
						<th align="center" >金额</th>
						<th align="center">备注</th>
					</tr>
					<c:forEach var="item" items="${orderItemList}">
						<tr>
							<td align="center" >${item.itemNo}</td>
							<td align="center" >${item.title}</td>
							<td  align="center" >${item.itemUnit}</td>
							<td align="center" >${item.num}</td>
							<td align="center" >${item.price}</td>
							<td align="center" >${item.totalFee}</td>
							<td align="center" >${item.description}</td>
						</tr>
					</c:forEach>
				</table>

	             <table class="showViewTable">
	                <tr>
	                    <td colspan="4" align="left">备注：${order.description }</td>
	                </tr>
	                <tr>
	                    <td align="left">地址：${order.address }</td>
	                    <td align="left">电话：${order.telephone }</td>
	                    <td align="left" colspan="2">手机：${order.mobile }</td>
	                </tr>
					 <tr>
						 <td align="left">业务：${order.salesman }</td>
						 <td align="left">制单：${order.prepareDocument }</td>
						 <td align="left">审核：${order.audit }</td>
						 <td align="left">客户签收：${order.signfor }</td>
					 </tr>
	            </table>
            	
        </form>
    </div>
</div>