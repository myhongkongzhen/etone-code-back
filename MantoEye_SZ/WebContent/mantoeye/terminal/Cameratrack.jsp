<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<%@ page contentType="text/html;charset=utf-8"%>
	<%@ include file="/include/session.jsp"%>
	<%@ include file="/include/setcache.jsp"%>
	<head>
		<title>通用拍照跟踪</title>
		<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
		<link rel="stylesheet" type="text/css"
			href="/tools/gt-grid/gt_grid.css" />
		<link type="text/css" rel="stylesheet"
			href="/skin/Default/css/maincontent.css" />
		<script src="/js/nav.js">
</script>
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
									<tr valign="top" style="font-size: 1px;">
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
												cellpadding="0px;boder="0">
												<tr valign="middle">
													<td class="condition_name">
														任务名称：
													</td>
													<td class="condition_value">
														<input type="text" name="taskName_search"
															id="taskName_search" style="height: 18px" />
													</td>
													<td class="condition_name">
														定制人：
													</td>
													<td class="condition_value">
														<input type="text" name="taskMan_sarch" id="taskMan_sarch"
															style="height: 18px" />
													</td>
													<td class="condition_name">
														任务状态：
													</td>
													<td class="condition_value">
														<select name="taskStatus_search" id="taskStatus_search"
															style="height: 21px; width: 125px">
															<option value="-1">
																全部
															</option>
															<option value="0">
																未开始
															</option>
															<option value="1">
																进行中
															</option>
															<option value="2">
																已结束（自动）
															</option>
															<option value="3">
																已结束（手动）
															</option>
															<option value="4">
																停止中
															</option>
														</select>
													</td>
													<td id="spaceTd" width="*"></td>
													<td width="200px">
														<div id="mainbtn">
															<ul>
																<li>
																	<a href="javascript:query();" 　title="查询"><span>查询</span>
																	</a>
																</li>
																<!--  
																<li>
																	<a href="javascript:reset();" title="重置"><span>重置</span>
																	</a>
																</li>
																-->
															</ul>
														</div>
													</td>
												</tr>
												<tr valign="middle">
													<td class="condition_name">
														定制时间：
													</td>
													<td class="condition_value">
														<input type="text" class="Wdate"
															style="display: block; height: 17px;"
															onclick="new WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d %H:%m:%s',maxDate:'#F{$dp.$D(\'orderTime_end\')}'});"
															name="orderTime_search" id="orderTime_search" />
													</td>
													<td class="condition_name">
														到
													</td>
													<td class="condition_value">
														<input type="text" class="Wdate"
															style="display: block; height: 17px;"
															onclick="new WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'orderTime_search\')||\'%y-%M-%d %H:%m:%s\'}'});"
															name="orderTime_end" id="orderTime_end" />
													</td>
												 <!--
													<td class="condition_name">
														定制时间：
													</td>
													<td class="condition_value">
														<input type="text" class="Wdate"
															style="display: block; height: 17px;"
															onclick="new WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'orderTime_end\')}'});"
															name="orderTime_search" id="orderTime_search" />
													</td>
													<td class="condition_name">
														到
													</td>
													<td class="condition_value">
														<input type="text" class="Wdate"
															style="display: block; height: 17px;"
															onclick="new WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'orderTime_search\')}'});"
															name="orderTime_end" id="orderTime_end" />
													</td>
													 -->
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
												通用拍照跟踪列表
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
var taskName = "";
var taskMan = "";
var taskStatus = "";
var orderTime_search = "";
var orderTime_end = "";

var dsConfig = {
	//data : data1 ,
	uniqueField : 'nmDataOutPutTaskId',
	fields : [ {
		name : 'nmDataOutPutTaskId'
	}, {
		name : 'intTaskType'
	}, {
		name : 'vcTaskName'
	}, {
		name : 'vcTaskOrder'
	}, {
		name : 'dtOrderTime'
	}, {
		name : 'dtStartTime'
	}, {
		name : 'dtEndTime'
	}, {
		name : 'bitTaskActiveFlag'
	}, {
		name : 'intTaskStatus'
	} ]
};

function renderConditions(value, record, columnObj, grid, colNo, rowNo) {
	var intTaskStatus = record.intTaskStatus;
	var taskId = record.nmDataOutPutTaskId;
	var taskType = record.intTaskType;
 
	return '<table><tr>'
			+ '<td><img style="cursor: hand" src="/skin/Default/images/MantoEye/icon/info.png" alt="条件定制" onclick="showDetail(\''
			+ taskId + '\',\'' + intTaskStatus + '\',\'' + taskType
			+ '\');" /></td>' + '</tr></table>'
}
var w = "1000px";
var h = "600px";
if (width == 1024) {
	w = "815px";
	h = "600px";
}
function showDetail(taskId, intTaskStatus, taskType) {
	var obj = new Object();
	obj.taskId = taskId;
	obj.intTaskStatus=intTaskStatus;
	obj.width = w; 

		if (taskType == 6)
			showMMDialog("/cameratrack_taskApn.do?taskId=" + taskId, obj,
					'680px', '500px');
		if (taskType == 5)
			showMMDialog("/cameratrack_taskBusiness.do?taskId=" + taskId, obj,
					'680px', '500px');
		if (taskType == 2) {
			showMMDialog("/cameratrack_taskTerminalIndex.do?taskId=" + taskId,
					obj, '680px', '500px');
			$.ajax( {
				type : "post",
				url : 'cameratrack_cleanTerminalSession.do',
				data : {},
				success : function() {
				},
				error : function() {
				}
			})
		}
		if (taskType == 7)
			showMMDialog("/cameratrack_taskUser.do?taskId=" + taskId, obj,
					'680px', '500px');
		if (taskType == 1)
			window
					.showModalDialog(
							"/mantoeye/terminal/CameratrackTask_num.jsp",
							obj,
							"dialogWidth="
									+ w
									+ ";dialogHeight="
									+ h
									+ ";location=no;resizable=no;status=no;toolbar:no;scroll=yes;center=yes");
		if (taskType == 4) {
			showMMDialog("/cameratrack_taskAreaIndex.do?taskId=" + taskId, obj,
					'680px', '500px');
			$.ajax( {
				type : "post",
				url : 'cameratrack_cleanCgiSession.do',
				data : {},
				success : function() {
				},
				error : function() {
				}
			})
		}
	
}
function renderTaskActiveFlag(value, record, columnObj, grid, colNo, rowNo) {
	if (value == 1) {
		return '是';
	} else {
		return '否';
	}
}

function renderTaskType(value, record, columnObj, grid, colNo, rowNo) {
	if (value == 1) {
		return '通用拍照指定号码';
	} else if(value==2) {
		return '通用拍照指定终端';
	}
	 else if(value==4) {
		return '通用拍照指定区域';
	}
	 else if(value==5) {
		return '通用拍照指定业务';
	}
	 else if(value==6) {
		return '通用拍照指定APN';
	}
	 else if(value==7) {
		return '通用拍照用户归属';
	}
}


function renderTaskStatus(value ,record,columnObj,grid,colNo,rowNo){
	/**
	0.未开始
	1.进行中
	2.任务自然结束
	3.任务手工结束
	4.停止中
	*/
	if(value==0){
		return '未开始';
	}else if(value==1){
		return '进行中';
	}else if(value==2){
		return '已结束（自动）';
	}else if(value==3){
		return '已结束（手动）';
	}else if(value==4){
		return '停止中';
	}else if(value==5){
		return '异常终止';
	}else{
		return '异常终止';
	}
}

var colsConfig = [
		{id: 'chk' ,isCheckColumn : true, checkType:'checkbox', checkValue:false,frozen : false , filterable : true, header: "", title: "全选" },
		{ id : 'vcTaskName'      , header : '任务名称'   },
		{ id : 'intTaskType'      , header : '任务类型'  ,  renderer:renderTaskType },
		{ id : 'vcTaskOrder'      , header : '定制人', width:80  },
		{ id : 'dtOrderTime'      , header : '定制时间'   },
		{ id : 'dtStartTime'    , header : '开始时间'  },
		{ id : 'dtEndTime'     , header : '结束时间'  },
		{ id : 'bitTaskActiveFlag'  , header : '是否激活' ,width:80,renderer:renderTaskActiveFlag },
		{ id : 'intTaskStatus'  , header : '状态',width:100,renderer:renderTaskStatus  },
		{ id : 'conditions'   , header : "条件" , sortable:false,width:50,
			renderer:renderConditions
		},
		{ id : 'result'   , header : "结果" , sortable:false,width:100,
			renderer:renderCondition2
		}
			
];


function renderCondition2(value, record, columnObj, grid, colNo, rowNo) {
	var taskId = record.nmDataOutPutTaskId;
	var taskType = record.intTaskType;
	var intTaskStatus = record.intTaskStatus;
	var startTime = record.dtStartTime;
	var endTime = record.dtEndTime;
	var tableStart= '<table><tr>';
	var tableEnd= '</tr></table>';
	var table='';
	//flag  1是区域分析    2是业务分析  3是终端分析 
	var areaAnalyse='<td><img style="cursor: hand"  src="/skin/Default/images/MantoEye/icon/map.png" alt="区域分析" onclick="showDetail2(1,\''
			+ taskId + '\',\''+ intTaskStatus + '\',\''+ startTime + '\',\''+ endTime + '\');" /></td>';
	var bisAnalyse='<td><img style="cursor: hand" src="/skin/Default/images/MantoEye/icon/business.png"  alt="业务分析 " onclick="showDetail2(2,\''
			+ taskId + '\',\''+ intTaskStatus + '\',\''+ startTime + '\',\''+ endTime + '\');" /></td>';
		var terminalAnalyse='<td><img style="cursor: hand" src="/skin/Default/images/MantoEye/icon/apn.png" alt="终端分析 " onclick="showDetail2(3,\''
			+ taskId + '\',\''+ intTaskStatus + '\',\''+ startTime + '\',\''+ endTime + '\');" /></td>';
if (taskType == 1) {
		 table=tableStart+areaAnalyse+bisAnalyse+ terminalAnalyse+tableEnd;
	} else if(taskType==2) {
	 table=tableStart+areaAnalyse+bisAnalyse+tableEnd;
	}
	 else if(taskType==4) {
		 table=tableStart+bisAnalyse+ terminalAnalyse+tableEnd;
	}
	 else if(taskType==5) {
		 table=tableStart+areaAnalyse+ terminalAnalyse+tableEnd;
	}
	 else if(taskType==6) {
		 table=tableStart+areaAnalyse+bisAnalyse+ terminalAnalyse+tableEnd;
	}
	 else if(taskType==7) {
		 table=tableStart+areaAnalyse+bisAnalyse+ terminalAnalyse+tableEnd;
	}
			
			
			
			return table;
		
}


function showDetail2(flag,taskId,intTaskStatus, startTime, endTime) { 
	var obj = new Object(); 
	obj.taskId = taskId;	//任务ID
	obj.width = w;		
	obj.startTime = startTime;	//任务开始时间
	obj.endTime = endTime;	//任务结束时间
	obj.intTaskStatus = intTaskStatus;	//任务状态(2 已完成標誌，1 執行中，0 未開始，5 異常)
	
     if(flag==1)	
		window.showModalDialog("/mantoeye/terminal/Cameratrack_areaanalyse.jsp",obj,"dialogWidth="+w+";dialogHeight="+h+";location=no;resizable=no;status=no;toolbar:no;scroll=yes;center=yes");
	if(flag==2)	
		window.showModalDialog("/mantoeye/terminal/Cameratrack_bisanalyse.jsp",obj,"dialogWidth="+w+";dialogHeight="+h+";location=no;resizable=no;status=no;toolbar:no;scroll=yes;center=yes");
	if(flag==3)	
		window.showModalDialog("/mantoeye/terminal/Cameratrack_terminalanalyse.jsp",obj,"dialogWidth="+w+";dialogHeight="+h+";location=no;resizable=no;status=no;toolbar:no;scroll=yes;center=yes");
	
}



var gridConfig={
	id : "datagrid",
	loadURL :'/cameratrack_query.do?1=1',
	//exportURL :'/dataOutput_export.do?1=1' ,             
	dataset : dsConfig ,
	columns : colsConfig ,
	width:780,
	height:500,
	resizable : false,
	showGridMenu : false,
	allowCustomSkin : false,
	allowFreeze : false,
	allowGroup : false,
	allowHide : false,
	container : 'data_container', 
	toolbarContent :'nav | goto | pagesize | state' ,
	pageSize : getLongPageSize(),
	remoteSort : false ,
	pageSizeList : [10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,45,50,100],
	onComplete:loadComplate
};

function getLongPageSize() {
	var size = getDispalyPageSize(1, 1);
	if (size < 20) {
		size = 20;
	}
	return size;
}

var datagrid=new GT.Grid( gridConfig );
GT.Utils.onLoad( function(){
	datagrid.render();
});

var firstInit=true;

//grid回调方法
function loadComplate(){
	//grid列表初始化信息
	var obj = new Object ();//使用对象传参,以防以后修改
	obj.datagrid = datagrid;
	obj.hideColumn = 0;//隐藏的列数目
	obj.isCheckbox = true;//是否可选择
	obj.otherHeight = 0 ; //必须定义,因为有些页面不同，所以此处指定预留高度
	//判断是否查询到数据
	judgeData(datagrid);
	//初始化grid
	columninit=true;
	initGridInfo(obj);
	
		if(firstInit==true){
		var pageSize = 20;
		var index = 0;
		$(".gt-pagesize-select option").each(function(i){
			if(this.text==pageSize){
				index=i;
			}
		})
		firstInit=false;
		$(".gt-pagesize-select").get(0).selectedIndex=index;
	}
}

//查询
function query() {
	//重置分页数据
	var pageinfo = datagrid.getPageInfo();
	pageinfo.pageNum = 1;
	datagrid.setPageInfo(pageinfo);
	  taskStatus = $("#taskStatus_search option:selected").val();
	  orderTime_search = $('#orderTime_search').attr('value');
	  orderTime_end = $('#orderTime_end').attr('value');
	taskName = $('#taskName_search').attr('value');
		taskMan= $('#taskMan_sarch').attr('value');
	var param={
		taskStatus:taskStatus,
		orderTime_search:orderTime_search,
		orderTime_end:orderTime_end,
		taskName:taskName,
		taskMan:taskMan
	};
	GT.$grid('datagrid').query( param );
}

function reset(){
	$('#taskName_search').attr('value','');
	$('#taskMan_sarch').attr('value','');
	$("#taskStatus_search").get(0).selectedIndex=0;
	$('#orderTime_search').attr('value','');
	$('#orderTime_end').attr('value','');
	$('#msis_search').attr('value','');
}

//任务状态更改


//grid工具栏
$(document).ready(function(){
		displayOrHiddenTd();
	  //按钮权限设置	  
	  var permflag = '<%=btnperm%>';
	  var bflags = initBtnPerm('_BTN_ADD,_BTN_EDIT,_BTN_DEL,_BTN_PAUSE',permflag);
      var toolbar = new Toolbar({
        renderTo : 'toolbar',
        items : [{
          type : 'button',
          text : '添加任务',
          bodyStyle : 'new',
       //   useable : bflags[0],
          handler : function(){
          		var width = '720px';
          		var height = (checkIE()=='IE6')?'540px':'480px';
          		var v = showMMDialog('/cameratrack_add.do?permId=${permId}','添加任务',width,height);
          		reloadData(v);
          }
        },'-',{
          type : 'button',
          text : '编辑任务',
          bodyStyle : 'edit',
       //   useable : bflags[1],
          handler : function(){
          	var count = getSelectedCount('datagrid');
          	if(count>1){
          		alert("只能选择一条记录！");
          	}else if(count<1){
          		alert("请选择一条记录！");
          	}else{
          		var id=getSelectedId('datagrid');
          		var state = getColumnValueByName('datagrid','intTaskStatus');
          		if(state==null){
          			return ;
          		}
          		if(state!='未开始'){//非未开始状态不能编辑
          			alert('只有未开始状态任务才可以编辑!');
          			return ;
          		}
          		var width = '720px';
          		var height = (checkIE()=='IE6')?'540px':'500px';
          		var v = showMMDialog('/cameratrack_edit.do?keyid='+id,"编辑任务",width,height);
          		reloadData(v);
          	}
          }
        },'-',{
          type : 'button',
          text : '停止任务',
          bodyStyle : 'stop',
     //     useable : bflags[3],
          handler : stopTask
        },'-',{
          type : 'button',
          text : '删除任务',
          bodyStyle : 'delete',
       //   useable : bflags[2],
          handler : deleteTask
        },'-',{
          type : 'button',
          text : '激活任务',
        //  bodyStyle : 'stop',
          useable : 'T',
          handler : activeTask
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
//激活
function activeTask(){
		var count = getSelectedCount('datagrid');
	if(count>1){
		alert("只能选择一条记录！");
	}else if(count<1){
		alert("请选择一条记录！");
	}else{
		var taskId=getSelectedId('datagrid');
		var state = getColumnValueByName('datagrid','intTaskStatus');
		var intTaskType=getColumnValueByName('datagrid','intTaskType');
	
		if(state==null){
			return ;
		}
		if(state!='未开始'){
			alert('只有未开始状态的任务才可以激活!');
			return ;
		}
		$.ajax({
			type : "post",
			url : "cameratrack_activeTask.do",
			data : {
				taskId:taskId,
				intTaskType:intTaskType
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

//删除任务 
function deleteTask(){
	if( getSelectedCount('datagrid')<1){
		alert('请选择需要删除的任务!');
		return ;
	}
	var taskIds = getSelectedKeys('datagrid');
	var states = getColumnValuesByName('datagrid','intTaskStatus');
	var TaskTypes = getColumnValuesByName('datagrid','intTaskType');	
		if(states.indexOf('进行中')!=-1){
		 	alert("状态为'进行中'的任务不能删除!");
		}else{
	var flag = window.confirm("你确定要删除所选的数据?");
	if(flag){
		$.ajax({
			type : "post",
			url : "cameratrack_deleteTask.do",
			data : {
				taskIds:taskIds,
				TaskTypes:TaskTypes
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
}
function stopTask(){
	var count = getSelectedCount('datagrid');
	if(count>1){
		alert("只能选择一条记录！");
	}else if(count<1){
		alert("请选择一条记录！");
	}else{
		var taskId=getSelectedId('datagrid');
		var state = getColumnValueByName('datagrid','intTaskStatus');
		if(state==null){
			return ;
		}
		if(state!='进行中'){
			alert('只有进行中状态的任务才可以停止!');
			return ;
		}
		$.ajax({
			type : "post",
			url : "cameratrack_stopTask.do",
			data : {
				taskId:taskId
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

/**
脚本不出错

$(document).ready(function(){
	window.onerror = killErrors;
})
function killErrors() {
	return true;
}
*/
</script>



