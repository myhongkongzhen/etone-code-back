<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<%@ page contentType="text/html;charset=utf-8"%>
	<%@ include file="/include/session.jsp"%>
	<%@ include file="/include/setcache.jsp"%>
	<head>
		<title>任务定制号码</title>
		<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
		<link rel="stylesheet" type="text/css"
			href="/tools/gt-grid/gt_grid.css" />
		<link type="text/css" rel="stylesheet"
			href="/skin/Default/css/maincontent.css" />
		<script type="text/javascript" src="/tools/gt-grid/gt_msg_cn.js">
</script>
		<script type="text/javascript" src="/tools/gt-grid/gt_grid_all.js">
</script>
		<script language="javascript" type="text/javascript"
			src="/tools/datepicker/WdatePicker.js">
</script>
		<!-- 列表工具栏 -->
		<link rel="stylesheet" href="/js/jquery/extend.tab/css/Toolbar.css"
			type="text/css"></link>
		<script type="text/javascript"
			src="/js/jquery/extend.tab/js/Toolbar.js">
</script>
		<script type="text/javascript" src="/js/common_grid.js">
</script>
		

		<script src="/js/nav.js">
</script>

	</head>
	<body>
		<table id="maincontent" cellspacing="0" cellpadding="0" border="0"
			bgcolor="#D3E0F2" width="100%" height="100%">
			<tr>
				<td colspan="2" height="5px"></td>
			</tr>
			<tr>
				<td>
					<table cellspacing="0" cellpadding="0" border="0" bgcolor="#ffffff"
						style="width: 100%;">
						<tr valign="top">
							<td>
								<table cellspacing="0" cellpadding="0" border="0" width="100%">
									<tr valign="top" style="font-size:1px;">
										<table cellspacing="0" cellpadding="0" border="0" width="100%">
											<tr>
												<td style="font-size: 1px; width: 4px;">
													<div class="leftcircle"></div>
												</td>
												<td width="100%">
													<div class="middlecircle"></div>
												</td>
												<td width="4px">
													<div class="rightcircle"></div>
												</td>
											</tr>
										</table>
									</tr>
									<tr valign="top">
										<td width="100%" class="condition_down">
											<table id="query_condition" cellspacing="0px"
												cellpadding="0px" boder="0">
												<tr valign="middle">
													
													<td class="condition_name">
														用户号码：
													</td>
													<td class="condition_value">
														<input type="text" name="nmMsisdn" id="nmMsisdn" value=""
															style="height: 17px; width: 115px" />
													</td>
													
													
													<td width="300px">
														<div id="mainbtn" style="width:300px">
															<ul>
																<li>
																	<a href="javascript:query();" 　title="查询"><span>查询</span>
																	</a>
																</li>
								
															</ul>
														</div>
													</td>
												</tr>
											</table>							
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="5px" bgcolor="#D3E0F2" width="100%"></td>
						</tr>

						<tr>
							<td>
								<table cellspacing="0" cellpadding="0" border="0" width="100%"
									class="menubar">
									<tr valign="top">
										<td width="4px" height="24px">
											<div class="lefttitle"></div>
										</td>
										<td width="100%" height="24px">
											<div class="middletitle">
												号码列表
											</div>
										</td>
										<td width="4px">
											<div class="righttitle"></div>
										</td>
									</tr>
								</table>
							</td>
						</tr>

						<tr>
							<td>
								<div id="toolbar" style="height: 25px"></div>
								<div class="gt-panel"
									style="width: 100%; margin: 0px; margin-bottom: 2px;">
									<div id="data_container"></div>
								</div>
							</td>
						</tr>

					</table>
				</td>
				<td width="2px"></td>
			</tr>
			<tr>
				<td colspan="2" height="5px"></td>
			</tr>
		</table>
	</body>
</html>

<script type="text/javascript">
var obj = window.dialogArguments;
var taskId = obj.taskId;
var width =  parseInt(obj.width);
var nmMsisdn='';	
var dsConfig= {
	//data : data1 ,
	uniqueField : 'id' ,
	fields :[
		{name : 'id'        },
		{name : 'nmMsisdn'      }
		
	]
};

var colsConfig = [
		{id: 'chk' ,isCheckColumn : true, checkType:'checkbox', checkValue:false,frozen : false , filterable : true, header: "", title: "全选",exportable:false },
		{ id : 'nmMsisdn' , header : "用户号码" ,exportnumber:true,headAlign:'right' ,align:'right'}
		
];

var gridConfig={
	id : "datagrid",
	loadURL :'/dataOutput_queryNmMsisdn.do?taskId='+taskId,
	exportURL :'/dataOutput_exportNmMsisdn.do?taskId='+taskId,
	dataset : dsConfig ,
	columns : colsConfig ,
	width:780,
	height:500,
	resizable : false,
	beforeLoad:checkLogon,
	container : 'data_container', 
	beforeLoad:checkLogon,
	toolbarContent : 'nav | goto | pagesize | state' ,
	pageSize :  getLongPageSize(),
	remoteSort : true ,
	remotePaging:true,
	pageSizeList :   [10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,45,50,100],
	onComplete:loadComplate
};
function getLongPageSize(){
	var size = getDispalyPageSize(1,1);
	if(size<25){
		size = 25;
	}
	return size;
}
var datagrid=new GT.Grid( gridConfig );
GT.Utils.onLoad( function(){
	datagrid.render();
});


//初始化grid高宽等信息,使高宽满屏
function initGridInfo1(obj) {
	var datagrid = obj.datagrid;
	var hideColumn = obj.hideColumn;//隐藏列
	var isCheckbox = obj.isCheckbox;//是否可选择
	var otherHeight = obj.otherHeight;//预留高度
	var otherWidth = obj.otherWidth;//预留高度
	var realWidth = obj.width;
	//初始化高度满屏
	//var parentHeight = parent.document.getElementById("container_content").offsetHeight;//整个编辑区的高度
	var yy = window.screen.availHeight;
	var yyy = window.screenTop;
	var parentHeight = yy - yyy;
	var $toolbarObj = $("#toolbar");//toolbar对象
	var tHeight = $toolbarObj.offset().top + 25;//toolbar相对位置
	var IEHeight = 23;
	if (otherHeight != undefined) {
		IEHeight = IEHeight - otherHeight;
	}
	var totalRecords = datagrid.getAllRows().length;
	var dWidth = (totalRecords) * 22 + 55;
	if (checkIE() == "IE8") {
		dWidth = (totalRecords) * 22 + 70;
	}
	
	var width_1280 = parentHeight - tHeight - IEHeight-8;//满屏高度
	datagrid.setSize(width-25, dWidth > width_1280 ? dWidth : width_1280);
	$toolbarObj.css("width", "1056px");
	if (columninit) {//如果已经初始化宽度，则不再执行
		return;
	}
	//初始化宽度满屏
	var cs = datagrid.columns.length - hideColumn;//如有隐藏列,则减去隐藏列
	if (typeof (otherWidth) != "undefined") {
		realWidth = realWidth - otherWidth;
		cs = cs - 1;
	}
	if (isCheckbox) {
		realWidth = realWidth - 55;//为checkbox预留空间
		cs = cs - 1;
	}
	if (checkIE() == "IE8") {
		realWidth = realWidth - 35;
	} else {
		realWidth = realWidth - 10;
	}
	var w = realWidth / cs;
	var isCheck = false;
	for (var j in datagrid.columnMap) {
		if (isCheckbox && !isCheck) {
			//datagrid.getColumn(j).setWidth(10);//checkbox宽度为默认值, 并且必须定义在第一列
			isCheck = true;
		} else {
			if ((j == "detail" && typeof (otherWidth) != "undefined") || (j == "top" && typeof (otherWidth) != "undefined")) {
			} else {
				datagrid.getColumn(j).setWidth(w);
			}
		}
	}
	columninit = true;
}

var firstInit=true;
//gird回调函数
function loadComplate(){
	//grid列表初始化信息
	var obj = new Object ();//使用对象传参,以防以后修改
	obj.datagrid = datagrid;
	obj.hideColumn = 0 ;//隐藏的列数目
	obj.isCheckbox = true;//是否可选择
	obj.otherHeight = 0 ; //必须定义,因为有些页面不同，所以此处指定预留高度
	obj.width = width;
	//判断是否查询到数据
	judgeData(datagrid);
	//初始化grid
	initGridInfo1(obj);
	
	if(firstInit==true){
		var pageSize=getDispalyPageSize(0,1);
		var index=0;
		$(".gt-pagesize-select option").each(function(i){
			if(this.text==pageSize){
				index=i;
			}
		})
		firstInit=false;
		$(".gt-pagesize-select").get(0).selectedIndex=index;
	}
}

//grid查询
function query() {
	//重置分页数据
	var pageinfo = datagrid.getPageInfo();
	pageinfo.pageNum = 1;
	datagrid.setPageInfo(pageinfo);
	//查询条件
	nmMsisdn = $('#nmMsisdn').attr("value");
	//传递给后台参数
	var param={
		nmMsisdn:nmMsisdn
	};
	GT.$grid('datagrid').query( param );
}




/***************初始化toolbar***************************/
$(document).ready(function(){
      var toolbar = new Toolbar({
        renderTo : 'toolbar',
		//border: 'top',
        items : [{
          type : 'button',
          text : '添加号码',
          bodyStyle : 'new',
          useable : 'T',
          handler : function(){
          			var obj = new Object();
					obj.taskId = taskId;
					var v = showMMDialog('/dataOutput_addNumber.do?taskId='+taskId,obj,'600px','380px');
          			reloadData(v);
          	/*$.ajax({
				type : "post",
				url : 'dataOutput_checkMsisdnStatus.do',
				data : {
					taskId:taskId
				},
				success : function(status) {
					
				},
				error : function() {
					alert('服务器出错,请联系管理员!');
					}
				})*/
          }
        },'-',{
          type : 'button',
          text : '编辑号码',
          bodyStyle : 'edit',
          useable :  'T',
          handler : function(){
          	var count = getSelectedCount('datagrid');
          	if(count>1){
          		alert("只能选择一条记录！");
          	}else if(count<1){
          		alert("请选择一条记录！");
          	}else{
          		var id=getSelectedId('datagrid');
          		var obj = new Object();
          		var record = getRightRecord('datagrid',datagrid);;
          		obj.nmMsisdn = record.nmMsisdn+'';
				obj.id = record.id;
				obj.taskId = taskId;
          		var v = showMMDialog('/mantoeye/data_catch/task_number_edit.jsp',obj,'600px','380px');
          		reloadData(v);
          	}
          }
        },'-',{
          type : 'button',
          text : '删除号码',
          bodyStyle : 'delete',
          useable : 'T',
          handler : deleteNmMsisdn
        },'-',{
          type : 'button',
          text : '导入号码',
          bodyStyle : 'xls',
          useable : 'T',
          handler : function(){
          			var obj = new Object();
					obj.taskId = taskId;
					var mm=showMMDialog('dataOutput_updateNumber.do?taskId='+taskId,obj,'540px','300px');
					if (typeof (mm) != "undefined") {
						alert(mm);
						query();
					}	
          		/*$.ajax({
				type : "post",
				url : 'dataOutput_checkMsisdnStatus.do',
				data : {
					taskId:taskId
				},
				success : function(status) {
					var obj = new Object();
					obj.taskId = taskId;
					obj.status = status;
					var mm=showMMDialog('/mantoeye/data_catch/task_number_up.jsp',obj,'540px','300px');
					if (typeof (mm) != "undefined") {
						alert(mm);
						query();
					}	
					
				},
				error : function() {
					alert('服务器出错,请联系管理员!');
					}
				})*/
          }
        },'-',{
          type : 'button',
          text : '导出号码',
          bodyStyle : 'xls',
          useable : 'T',
          handler : function(){
           //参数
			var params={
				nmMsisdn : nmMsisdn
			};
			//导出
			var fileObj = new Object();
			fileObj.fileName='用户号码';//文件名称
			fileObj.fileFormat = 'xls';//文件格式,后台暂支持xls格式
			fileObj.gridObj = datagrid;//当前grid对象
			fileObj.params = params;
			exportFile(fileObj);
          }
        }]
      }); 
	  toolbar.render();
    });

//重新加载数据
function reloadData(v){
	if(v=='add' || v=='edit'){
       query();
    }
}
//删除事件
function deleteNmMsisdn(){
    if(getSelectedCount('datagrid')<1){
       alert('请选择需要删除的号码!');
       return;
    }
	var ids = getSelectedKeys('datagrid');
	var flag = window.confirm("确定删除吗?");
	if(flag){
		$.ajax({
			type : "post",
			url : "dataOutput_deleteNmMsisdn.do",
			data : {
				taskId:taskId,
				nmIds:ids
			},
			success : function(msg) {
				alert(msg);//打印删除是否成功信息
				query();//刷新grid数据
			},
			error : function() {
				alert('服务器出错,请联系管理员!');
			}
		});
	}
}
$(document).ready(function(){
	window.onerror = killErrors;
})
function killErrors() {
	return true;
}


</script>


