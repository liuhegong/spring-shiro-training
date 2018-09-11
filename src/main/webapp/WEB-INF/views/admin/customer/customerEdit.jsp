<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#customerEditForm').form({
            url : '${path }/customer/edit',
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
                    var form = $('#customerEditForm');
                    parent.$.messager.alert('错误', eval(result.msg), 'error');
                }
            }
        });
        
        $("#roleEditStatus").val('${role.status}');
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="customerEditForm" method="post">
       		 <input name="id" type="hidden"  value="${customer.id}">
            <table class="grid">
                <tr>
                    <td>客户名称</td>
                    <td><input name="name" type="text" placeholder="请输入公司名称" class="easyui-validatebox span2" data-options="required:true" value="${customer.name}"></td>
                </tr>
                <tr>
                    <td>联系人</td>
                    <td><input name="linkman" type="text" placeholder="请输入公司负责人姓名" class="easyui-validatebox span2" data-options="required:true" value="${customer.linkman}"></td>
                </tr>
                <tr>
                    <td>电话</td>
                    <td><input name="telephone" type="text" placeholder="请输入公司座机号码" class="easyui-validatebox span2" data-options="required:true" value="${customer.telephone}"></td>
                </tr>

                <tr>
                    <td>地址</td>
                    <td><input name="address" type="text" placeholder="请输入公司地址" class="easyui-validatebox span2" data-options="required:true" value="${customer.address }"></td>
                </tr>

                <tr>
                    <td>备注</td>
                    <td colspan="3"><textarea name="description">${customer.description }</textarea></td>
                </tr>
            </table>
        </form>
    </div>
</div>