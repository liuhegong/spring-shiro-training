<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#unitEditForm').form({
            url : '${path }/unit/edit',
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
                    var form = $('#unitEditForm');
                    parent.$.messager.alert('错误', eval(result.msg), 'error');
                }
            }
        });
        
        $("#roleEditStatus").val('${role.status}');
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="unitEditForm" method="post">
       		 <input name="id" type="hidden"  value="${unit.id}">
            <table class="grid">
             <tr>
                    <td>单位编码</td>
                    <td><input name="unitCode" type="text" placeholder="请输入单位编码" class="easyui-validatebox span2" data-options="required:true" value="${unit.unitCode }"></td>
                </tr>
                <tr>
                    <td>单位名称</td>
                    <td><input name="unitName" type="text" placeholder="请输入单位名称" class="easyui-validatebox span2" data-options="required:true" value="${unit.unitName }"></td>
                </tr>
            </table>
        </form>
    </div>
</div>