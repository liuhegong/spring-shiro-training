<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#orderEditForm').form({
            url : '${path }/order/edit',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                return isValid;
            },
            success : function(result) {
                progressClose();
                result = $.parseJSON(result);
                if (result.success) {
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    var form = $('#orderEditForm');
                    parent.$.messager.alert('错误', eval(result.msg), 'error');
                }
            }
        });
        
        $("#roleEditStatus").val('${role.status}');
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="orderEditForm" method="post">
       		 <input name="id" type="hidden"  value="${order.id}">
       		 <input type="hidden" id="itemJSONStr" name="itemJSONStr">
            <table class="grid">
                <tr>
                    <td>日期：</td>
                    <td><input id="orderDate" name="orderDate" type="text" placeholder="请输入送货日期" class="easyui-datebox" data-options="required:true" value=""></td>
                	<td>单号：</td>
                	<td><input name="orderNo" type="text" placeholder="保存后系统自动生成" class="span2" readonly="readonly" disabled="disabled"></td>
                </tr>
                <tr>
                    <td>客户单位：</td>
                    <td>
                   	 <input id="customerSelect" name="customerName" type="text" placeholder="请输入联系人" class="span2" value="">
                   	 <input id="customerId"  name="customerId" type="hidden" value="">
                    </td>
                    <td>联系人：</td>
                    <td><input id="linkman" name="customer.linkman" type="text" placeholder="请输入联系人" class="span2"   value="" readonly="readonly" disabled="disabled"></td>
                </tr>
                <tr>
                    <td>联系地址：</td>
                    <td><input id="address" name="customer.address" type="text" placeholder="请输入联系地址" class="span2"  value="" readonly="readonly" disabled="disabled"></td>
                    <td>联系电话：</td>
                    <td><input id="telephone" name="customer.telephone" type="text" placeholder="请输入联系电话" class="span2"  value="" readonly="readonly" disabled="disabled"></td>
                </tr>
               </table>
               
                <table id="goodsTable"  style="border: 0;margin-top: 2px;"></table>
             
	             <table class="grid" style="border: 0;margin-top: 2px;">
	                <tr>
	                    <td colspan="6">备注：<input name="description" type="text"  class="span2" style="width: 93%;margin-left: 10px;"  value="请仔细核对货物型号和数量，如果有误请于3日内提出，并出具证明，协商解决。"></td>
	                </tr>
	                <tr>
	                    <td>地址：</td>
	                    <td><input name="address" type="text"  class="span2" style="width: 400px;"  value="${company.address }"></td>
	                    <td>电话：</td>
	                    <td><input name="telephone" type="text"  class="span2"  value="${company.telephone }"></td>
	                    <td>手机：</td>
	                    <td><input name="mobile" type="text"  class="span2"  value="${company.mobile }"></td>
	                </tr>
	            </table>
         
            
            
	               <table class="grid" style="border: 0;margin-top: 2px;">
	                <tr>
	                    <td>业务：</td>
	                    <td><input name="salesman" type="text"  class="span2"  value=""></td>
	                      <td>制单：</td>
	                    <td><input name="prepareDocument" type="text"  class="\span2"  value=""></td>
	                      <td>审核：</td>
	                    <td><input name="audit" type="text"  class="span2" value=""></td>
	                      <td>客户签收：</td>
	                    <td><input name="signfor" type="text"  class="span2"  value="" readonly="readonly" disabled="disabled"></td>
	                </tr>
	            </table>
            	
        </form>
    </div>
</div>