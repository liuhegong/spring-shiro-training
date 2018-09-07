<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
    	var unitList = new Array();
    	$.ajax({
   		   type: "POST",
   		   url: "${path }/unit/list",
   		   async:false,//同步
   		   dataType:"json",
   		   success: function(data){
   			 unitList = data;
   		   }
   		});
    	
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
        
        //客户下拉选择
        $('#customerSelect').combogrid({    
            delay: 500, 
            panelWidth:'600px',
            panelHeight:'380px',
            mode: 'remote',    
            url: '${path }/customer/dataGrid',    
            striped : true,
            rownumbers : true,
            required:true,
            pagination : true,
            singleSelect : true,
            idField: 'id',    
            textField: 'name', 
            sortName : 'create_time',
            sortOrder : 'asc',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns: [[    
                {field:'name',title:'客户名称 ',width:200,sortable:true},    
                {field:'linkman',title:'联系人',width:100,sortable:true},
                {field:'telephone',title:'联系电话',width:100,sortable:true},
                {field:'address',title:'地址',width:200,sortable:true}
            ]],
            onSelect:function(rowIndex, rowData){
            	$("#customerId").val(rowData.id);
            	$("#linkman").val(rowData.linkman);
            	$("#address").val(rowData.address);
            	$("#telephone").val(rowData.telephone);
            	
            }
        });  
        
        
        //货物表格
        $('#goodsTable').datagrid({    
        	url:'${path }/order/getOrderItemDatagrid?orderId=${order.id}',    
        	title:'货物列表',
			iconCls:'icon-edit',
			width:'100%',
			//height:250,
			singleSelect:true,
			idField:'id',
			striped : true,
	        //rownumbers : true,
	        pagination : false,
			sortName : 'id',
            sortOrder : 'asc',
            //pageSize : 20,
            //pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns:[[    
                {field:'id',title:'id',hidden:true},    
                {field:'itemNo',title:'货号',width:100,align:'center', 
                	editor:{
                		type:'validatebox',
                		options:{
                			required:true,
                			missingMessage:'请输入货号',
                			invalidMessage:'货号不能为空'
                		}
                	}
                },    
                {field:'title',title:'名称及规格',width:300,align:'center',
                	editor:{
                		type:'validatebox',
                		options:{
                			required:true,
                			missingMessage:'请输入名称及规格',
                			invalidMessage:'名称及规格不能为空'
                		}
                }},    
                {field:'itemUnit',title:'单位',width:50,align:'center',
                	formatter:function(value){
						for(var i=0; i<unitList.length; i++){
							if (unitList[i].unitCode == value) return unitList[i].unitName;
						}
						return value;
					},
					editor:{
						type:'combobox',
						options:{
							valueField:'unitCode',
							textField:'unitName',
							data:unitList,
							required:true
						}
					}
                },    
                {field:'num',title:'数量',width:50,align:'center',
                	editor:{
                		type:'numberbox',
                		options:{
                			required:true,
                			precision:0,
                			onChange:function(newValue,oldValue){
                				var priceEd = $('#goodsTable').datagrid('getEditor', {index:index,field:'price'});
                				var price = $(priceEd.target).numberbox('getValue');
                				if(price==null || price==""){
                					price = 0;
                				}
                				var totalFeeEd = $('#goodsTable').datagrid('getEditor', {index:index,field:'totalFee'});
                				$(totalFeeEd.target).numberbox('setValue', newValue*price);

                			}
                		}
                }},    
                {field:'price',title:'单价',width:100,align:'center',
                	editor:{
                		type:'numberbox',
                		options:{
                			required:true,
                			precision:2,
                			onChange:function(newValue,oldValue){
                				var numEd = $('#goodsTable').datagrid('getEditor', {index:index,field:'num'});
                				var num = $(numEd.target).numberbox('getValue');
                				if(num==null || num==""){
                					alert("请填写数量");
                					return ;
                				}
                				var totalFeeEd = $('#goodsTable').datagrid('getEditor', {index:index,field:'totalFee'});
                				$(totalFeeEd.target).numberbox('setValue', newValue*num);

                			}
                		}
                	}
                	
                },    
                {field:'totalFee',title:'金额',width:100,align:'center',
                	editor:{
                		type:'numberbox',
                		options:{
                			precision:2,
                			disabled:true	
                		}
                	}
                },    
                {field:'description',title:'备注',width:200,align:'center',editor:'text'}
            ]],
            onBeforeEdit:function(index,row){
				row.editing = true;
				updateActions(index);
			},
			onAfterEdit:function(index,row){
				row.editing = false;
				updateActions(index);
			},
			onCancelEdit:function(index,row){
				row.editing = false;
				updateActions(index);
			},
			onClickCell:function(rowIndex, rowData){
				
			},
			onClickRow:function(rowIndex, rowData){
				
			},
            toolbar : '#addGoodsToolbar'
        });  
        
        $("#roleEditStatus").val('${role.status}');
        
        
    });
    
    function updateActions(index){
		$('#goodsTable').datagrid('updateRow',{
			index: index,
			row:{}
		});
	}
    
    function getRowIndex(target){
		var tr = $(target).closest('tr.datagrid-row');
		return parseInt(tr.attr('datagrid-row-index'));
	}
	function editrow(target){
		$('#goodsTable').datagrid('beginEdit', getRowIndex(target));
	}
	function deleterow(target){
		$.messager.confirm('Confirm','确定要删除该行吗?',function(r){
			if (r){
				$('#goodsTable').datagrid('deleteRow', getRowIndex(target));
			}
		});
	}
	function saverow(target){
		var currentIndex = getRowIndex(target);
		
		var numEd = $('#goodsTable').datagrid('getEditor', {index:currentIndex,field:'num'});
		var num = $(numEd.target).numberbox('getValue');
		if(num==null || num==""){
			num = 0;
		}
		
		var priceEd = $('#goodsTable').datagrid('getEditor', {index:currentIndex,field:'price'});
		var price = $(priceEd.target).numberbox('getValue');
		if(price==null || price==""){
			price = 0;
		}
		
		var totalFeeEd = $('#goodsTable').datagrid('getEditor', {index:currentIndex,field:'totalFee'});
		$(totalFeeEd.target).numberbox('setValue', num*price);
		
		$('#goodsTable').datagrid('endEdit',currentIndex);
		
	}
	function cancelrow(target){
		//$('#goodsTable').datagrid('cancelEdit', getRowIndex(target));
		$('#goodsTable').datagrid('deleteRow', getRowIndex(target));
	}
	
	//插入送货单
	function insert(){
		//var row = $('#goodsTable').datagrid('getSelected');
		var allrows = $('#goodsTable').datagrid('getRows');
		//debugger;
		if (allrows.length>0){
			//var index = $('#goodsTable').datagrid('getRowIndex', row);
			index = allrows.length;
		} else {
			index = 0;
		}
		$('#goodsTable').datagrid('insertRow', {
			index: index,
			row:{
				status:'P'
			}
		});
		$('#goodsTable').datagrid('selectRow',index);
		$('#goodsTable').datagrid('beginEdit',index);
	}
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
            <table width="100%">
                <tr>
                    <td>送货日期：</td>
                    <td align="left">${order.orderDate }</td>
                	<td>单号：</td>
                	<td align="left">${order.orderNo }</td>
                </tr>
                <tr>
                    <td>客户单位：</td>
                    <td align="left">
                   		 ${order.customer.name }
                   	 	<input id="customerId"  name="customerId" type="hidden" value="${order.customer.id }">
                    </td>
                    <td>联系人：</td>
                    <td align="left">${order.customer.linkman }</td>
                </tr>
                <tr>
                    <td>联系地址：</td>
                    <td align="left">${order.customer.address }</td>
                    <td>联系电话：</td>
                    <td align="left">${order.customer.telephone }</td>
                </tr>
               </table>
               
                <table id="goodsTable"  style="border: 0;margin-top: 2px;"></table>
             
	             <table class="grid" style="border: 0;margin-top: 2px;">
	                <tr>
	                    <td colspan="6">备注：<input name="description" type="text"  class="span2" style="width: 93%;margin-left: 10px;"  value="${order.description }" readonly="readonly" disabled="disabled"></td>
	                </tr>
	                <tr>
	                    <td>地址：</td>
	                    <td><input name="address" type="text"  class="span2" style="width: 400px;"  value="${order.address }" readonly="readonly" disabled="disabled"></td>
	                    <td>电话：</td>
	                    <td><input name="telephone" type="text"  class="span2"  value="${order.telephone }" readonly="readonly" disabled="disabled"></td>
	                    <td>手机：</td>
	                    <td><input name="mobile" type="text"  class="span2"  value="${order.mobile }" readonly="readonly" disabled="disabled"></td>
	                </tr>
	            </table>
         
            
            
	               <table class="grid" style="border: 0;margin-top: 2px;">
	                <tr>
	                    <td>业务：</td>
	                    <td>${order.salesman }</td>
	                      <td>制单：</td>
	                    <td>${order.prepareDocument }</td>
	                      <td>审核：</td>
	                    <td>${order.audit }></td>
	                      <td>客户签收：</td>
	                    <td>${order.signfor }</td>
	                </tr>
	            </table>
            	
        </form>
    </div>
</div>

<div id="addGoodsToolbar" style="display: none;">
     <a onclick="insert();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">添加货物</a>
</div>