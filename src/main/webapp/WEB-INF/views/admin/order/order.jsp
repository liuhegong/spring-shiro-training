<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script src='http://127.0.0.1:8000/CLodopfuncs.js'></script>
<script type="text/javascript">
    var orderDataGrid;
    $(function() {
        orderDataGrid = $('#orderDataGrid').datagrid({
            url : '${path }/order/dataGrid',
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : true,
            idField : 'id',
            sortName : 'order_date',
            sortOrder : 'DESC',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            frozenColumns : [ [ {
                width : '100',
                title : 'id',
                field : 'id',
                sortable : true
            }, {
                width : '200',
                title : '单号',
                field : 'orderNo',
                sortable : true
            }
            , {
                width : '200',
                title : '送货日期',
                field : 'orderDate',
                sortable : true,
                formatter: function(value,row,index){
                    return value.substring(0,10);
                }
                }, {
                width : '200',
                title : '创建日期',
                field : 'createTime',
                sortable : true
            }
            , {
                width : '200',
                title : '客户单位',
                field : 'customer.name',
                sortable : true,
                formatter:function(value,rec){
                    return rec.customer.name;
                 }
            }, {
                width : '200',
                title : '联系人',
                field : 'customer.linkman',
                sortable : true,
                formatter:function(value,rec){
                    return rec.customer.linkman;
                 }
            }, {
                width : '200',
                title : '联系电话',
                field : 'telephone'
            } 
            , {
                field : 'action',
                title : '操作',
                width : 300,
                formatter : function(value, row, index) {
                    var str = '';
                        <shiro:hasPermission name="/order/edit">
                            str += $.formatString('<a href="javascript:void(0)" class="role-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="editOrderFun(\'{0}\');" >编辑</a>', row.id);
                        </shiro:hasPermission>
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="role-easyui-linkbutton-show" data-options="plain:true" onclick="showOrderFun(\'{0}\');" >查看</a>', row.id);
                    <shiro:hasPermission name="/order/delete">
                            str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                            str += $.formatString('<a href="javascript:void(0)" class="role-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deleteOrderFun(\'{0}\');" >删除</a>', row.id);
                        </shiro:hasPermission>
                    return str;
                }
            } ] ],
            onLoadSuccess:function(data){
                $('.role-easyui-linkbutton-edit').linkbutton({text:'编辑'});
                $('.role-easyui-linkbutton-show').linkbutton({text:'查看'});
                $('.role-easyui-linkbutton-del').linkbutton({text:'删除'});
            },
            toolbar : '#orderToolbar'
        });
    });

    function addOrderFun() {
        parent.$.modalDialog({
            title : '添加送货单',
            width : 1000,
            height : 600,
            href : '${path }/order/addPage',
            buttons : [ {
                text : '确定',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = orderDataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                    var submitFlag = true;
                    debugger;
                    var goodsTable = parent.$.modalDialog.handler.find('#goodsTable');
                    var allRows = goodsTable.datagrid('getRows');
                   if(allRows==null || allRows.length==0){
                	   $.messager.alert('警告','请添加送货信息','error'); 
                	   return ;
                   }else{
                	   for (var i = 0; i < allRows.length; i++) {
                		   var row = allRows[i];
							if(row.editing){
								submitFlag = false;
							}
                	   }
                   }
                   if(submitFlag){
                	   
                	   var rowData = new Array();
                	   for (var i = 0; i < allRows.length; i++) {
                		   var row = allRows[i];
                		   rowData.push({
                			   itemNo:row.itemNo,
                			   title:row.title,
                			   itemUnit:row.itemUnit,
                			   num:row.num,
                			   price:row.price,
                			   totalFee:row.totalFee,
                			   description:row.description
                		   });
                	   }
                	   
                	   
                	   var itemJSONStrInput = parent.$.modalDialog.handler.find('#itemJSONStr');
                	   itemJSONStrInput.val(JSON.stringify(rowData));
	                    var f = parent.$.modalDialog.handler.find('#orderAddForm');
	                    f.submit();
                   }else{
                	   $.messager.confirm('温馨提示：','存在未保存的送货记录，是否忽略该记录?',function(r){
							if (r){
								 var rowData = new Array();
			                	   for (var i = 0; i < allRows.length; i++) {
			                		   var row = allRows[i];
			                		   rowData.push({
			                			   itemNo:row.itemNo,
			                			   title:row.title,
			                			   itemUnit:row.itemUnit,
			                			   num:row.num,
			                			   price:row.price,
			                			   totalFee:row.totalFee,
			                			   description:row.description
			                		   });
			                	   }
			                	   
			                	   
			                	   var itemJSONStrInput = parent.$.modalDialog.handler.find('#itemJSONStr');
			                	   itemJSONStrInput.val(JSON.stringify(rowData));
								 var f = parent.$.modalDialog.handler.find('#orderAddForm');
				                  f.submit();
							}

						});
                   }
                }
            } ]
        });
    }

    function editOrderFun(id) {
        if (id == undefined) {
            var rows = orderDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
            orderDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title : '编辑',
            width : 1000,
            height : 600,
            href : '${path }/order/editPage?id=' + id,
            buttons : [ {
                text : '确定',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = orderDataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                    var submitFlag = true;
                    debugger;
                    var goodsTable = parent.$.modalDialog.handler.find('#goodsTable');
                    var allRows = goodsTable.datagrid('getRows');
                    if(allRows==null || allRows.length==0){
                        $.messager.alert('警告','请添加送货信息','error');
                        return ;
                    }else{
                        for (var i = 0; i < allRows.length; i++) {
                            var row = allRows[i];
                            if(row.editing){
                                submitFlag = false;
                            }
                        }
                    }
                    if(submitFlag){

                        var rowData = new Array();
                        for (var i = 0; i < allRows.length; i++) {
                            var row = allRows[i];
                            rowData.push({
                                itemNo:row.itemNo,
                                title:row.title,
                                itemUnit:row.itemUnit,
                                num:row.num,
                                price:row.price,
                                totalFee:row.totalFee,
                                description:row.description
                            });
                        }


                        var itemJSONStrInput = parent.$.modalDialog.handler.find('#itemJSONStr');
                        itemJSONStrInput.val(JSON.stringify(rowData));
                        var f = parent.$.modalDialog.handler.find('#orderEditForm');
                        f.submit();
                    }else{
                        $.messager.confirm('温馨提示：','存在未保存的送货记录，是否忽略该记录?',function(r){
                            if (r){
                                var rowData = new Array();
                                for (var i = 0; i < allRows.length; i++) {
                                    var row = allRows[i];
                                    rowData.push({
                                        itemNo:row.itemNo,
                                        title:row.title,
                                        itemUnit:row.itemUnit,
                                        num:row.num,
                                        price:row.price,
                                        totalFee:row.totalFee,
                                        description:row.description
                                    });
                                }


                                var itemJSONStrInput = parent.$.modalDialog.handler.find('#itemJSONStr');
                                itemJSONStrInput.val(JSON.stringify(rowData));
                                var f = parent.$.modalDialog.handler.find('#orderEditForm');
                                f.submit();
                            }

                        });
                    }
                }
            } ]
        });
    }

    //查看
    function showOrderFun(id) {
        if (id == undefined) {
            var rows = orderDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
            orderDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title : '查看详情',
            width : 750,
            height : 600,
            href : '${path }/order/showPage?id=' + id,
            buttons : [
                {
                    text : '打印',
                    handler : function() {
                        if(typeof LODOP === "undefined"){
                           var html =  "<font color=\"#FF00FF\">Web打印服务CLodop未安装启动，点击这里<a href=\"${path}/static/CLodop_Setup_for_Win32NT.exe\" target=\"_self\">下载执行安装</a><br>（若此前已安装过，可<a href=\"CLodop.protocol:setup\" target=\"_self\">点这里直接再次启动</a>），成功后请刷新本页面。</font>";
                            parent.$.modalDialog.handler.html(html);
                        }else{
                            var strHTML =  parent.$.modalDialog.handler.html();
                            LODOP.SET_PRINT_PAGESIZE(1, 0, 0,"A4");
                            LODOP.ADD_PRINT_HTM(30,1,"100%","100%",strHTML);
                            LODOP.PREVIEW();
                        }

                    }
                },
                {
                text : '关闭',
                handler : function() {
                    $.modalDialog.handler.dialog('destroy');
                    $.modalDialog.handler = undefined;
                }
            }

            ]
        });
    }

    function deleteOrderFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = orderDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
            orderDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.messager.confirm('询问', '您是否要删除当前角色？', function(b) {
            if (b) {
                progressLoad();
                $.post('${path }/order/delete', {
                    id : id
                }, function(result) {
                    if (result.success) {
                        parent.$.messager.alert('提示', result.msg, 'info');
                        orderDataGrid.datagrid('reload');
                    }
                    progressClose();
                }, 'JSON');
            }
        });
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',fit:true,border:false">
        <table id="orderDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="orderToolbar" style="display: none;">
    <shiro:hasPermission name="/order/add">
        <a onclick="addOrderFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">添加送货单</a>
    </shiro:hasPermission>
</div>