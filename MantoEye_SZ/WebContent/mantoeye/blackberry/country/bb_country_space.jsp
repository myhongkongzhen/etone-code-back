<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<%@ page contentType="text/html;charset=utf-8"%>
	<%@ include file="/include/session.jsp"%>
	<%@ include file="/include/setcache.jsp"%>
	<head>
		<title>用户归属地空间分布</title><meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
		<link rel="stylesheet" type="text/css"
			href="/tools/gt-grid/gt_grid.css" />
		<link type="text/css" rel="stylesheet"
			href="/skin/Default/css/maincontent.css" />
		<script type="text/javascript" src="/tools/gt-grid/gt_msg_cn.js"></script>
		<script type="text/javascript" src="/tools/gt-grid/gt_grid_all.js"></script>
		<script language="javascript" type="text/javascript"
			src="/tools/datepicker/WdatePicker.js"></script>
		<!-- 列表工具栏 -->
		<link rel="stylesheet" href="/js/jquery/extend.tab/css/Toolbar.css"
			type="text/css"></link>
		<script type="text/javascript"
			src="/js/jquery/extend.tab/js/Toolbar.js"></script>
		<script type="text/javascript" src="/js/common.js"></script>
		<script type="text/javascript" src="/js/common_grid.js"></script>
		
		<script type='text/javascript' src='/tools/autocomplete/lib/jquery.bgiframe.min.js'></script>
		<script type='text/javascript' src='/tools/autocomplete/lib/thickbox-compressed.js'></script>
		<script type='text/javascript' src='/tools/autocomplete/jquery.autocomplete.js'></script>
		<link rel="stylesheet" type="text/css" href="/tools/autocomplete/jquery.autocomplete.css" />
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
												cellpadding="0px;boder="0">
												<tr valign="middle">													
													<td class="condition_name">
														时间粒度：
													</td>
													<td class="condition_value">
														<select name="timeLevel_search" id="timeLevel_search"
															onchange="changeTimeLevel()" style="height: 20px">
															<!-- <option value="1">
																时
															</option> -->
															<option value="2">
																天
															</option>
															<option value="3">
																周（周日~周六）
															</option>
															<option value="4">
																月
															</option>

														</select>
													</td>
													<td class="condition_name">
														时间：
													</td>
													<td class="condition_value">
														<input type="text" class="Wdate"
															style="display: block; height: 15px;"
															onclick="selectTime();" id="time_search" />
													</td>
													<td class="condition_name">
														区域维度：
													</td>
													<td>
														<select class="condition_value" name="spaceLevel_search"
															style="height: 20px" id="spaceLevel_search"
															onchange="showAreaType()">
															<option value="1">
																BSC
															</option>
															<option value="2">
																SGSN
															</option>
															<option value="3">
																街道办
															</option>
															<option value="4">
																营销片区
															</option>
															<option value="5">
																分公司
															</option>
														</select>
													</td>
													<!--<td id="spaceTd" width="*"></td>
													--><td width="200px">
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
												<tr>
													<td class="condition_name">
														归属地：
													</td>
													<td>
														<select name="countryId" id="countryId"
																 style="height: 21px"  onchange="">
																<option value ='-1'>--全部--</option> 
														</select>
															<div id="div_country1" style="float:left;display:none;">
																<select name="countryId1" id="countryId1" 
																 style="height: 21px;width:120px;"  onchange="">
																</select>
														</div>												
													</td>
													<td colspan="2">
															<input type="text" style="font-size:11px;width:150px;height:16px;" value="输入以快速查找" 
																name="tttt" id="tttt"
															size="25" onblur="checkBlur('tttt');"
															onclick="checkFocus('tttt');"/> 
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
												黑莓用户归属空间分布图形
											</div>
											<input type="hidden" value="" id="chartxmldata" />
										</td>
										<td width="4px">
											<div class="righttitle"></div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="100%" width="100%"
								style="padding-left: 5px; background: #ffffff">
								<input type="checkbox" id="total_flush" class="checkboxclass"
									onclick='changeChartType()' checked />
								总流量
								<input type="checkbox" id="imsis_count" class="checkboxclass"
									onclick='changeChartType()' />
								用户数
								<div id="total_flush_image" style="width: 100%; height: 100%;margin-left:-13px;overflow:hidden;">
									<iframe name="frm"
										src="/flash/MantoEye_Main.html?mapflag=bsc&dataflag=total&dataname=总流量"
										scrolling="no" id="frm"
										style="HEIGHT: 350px; VISIBILITY: inherit; width: 1038px; Z-INDEX: 1"
										marginwidth="1" marginheight="1"  frameborder="0"
										align="middle"></iframe>
								</div>
								
								<div id="imsis_count_image" style="width: 0; height: 0;margin-left:-13px;overflow:hidden;">
									<iframe name="frm1"
										src="/flash/MantoEye_Main.html?mapflag=bsc&dataflag=imsis&dataname=用户数"
										scrolling="no" id="frm1"
										style="HEIGHT: 350px; VISIBILITY: inherit; width: 1038px; Z-INDEX: 1"
										marginwidth="1" marginheight="1"  frameborder="0"
										align="middle"></iframe>
								</div>
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
												黑莓用户归属空间分布列表
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


//初始化查询时间
var date=new Date();
date=date.valueOf();
date=date-24*60*60*1000;
date=new Date(date); 
var hasinit = false;//第一次初始化图形数据标识
var datachange = false;//第N次查询初始化数据标识
var dataType_search = 1 ; //页面显示数据类型
var timeLevel_search ='2';//查询时间粒度
var time_search =date.getYear()+'-'+''+((date.getMonth()+1)>9?(date.getMonth()+1):("0"+(date.getMonth()+1)))+'-'+''+(date.getDate()>9?date.getDate():("0"+date.getDate())); //查询开始时间
var spaceLevel_search = '1';//区域维度(BSC:1 SGSN:2 街道办:3 营销片区:4 分公司:5	)
var chartFlag = 'bsc';//地图显示标识
var country_Id = '101';//归属地
var chartFlagName = 'BSC';
var dsConfig= {
	//data : data1 ,
	uniqueField : 'no' ,
	fields :[
		{name : 'spaceName'        },
		{name : 'totalFlushMb'         },
		{name : 'countryName'      },
		{name : 'averageFlushMb'       },
		{name : 'averageFlushKb'       },
		{name : 'imsis'     },
		{name : 'fullDate'    }
	]
};

var colsConfig = [
		{ id : 'fullDate'      , header : "时间"    ,sortable:false  },	
		{ id : 'countryName'      , header : "归属地"    ,sortable:false  },	
		{ id : 'spaceName'      , header : "区域"   ,sortable:false   },
		{ id : 'totalFlushMb'    , header : "总流量(MB)"   ,headAlign:'right' ,align:'right',exportnumber:true ,renderer:renderFormatDataInit2  },
		{ id : 'imsis'     , header : "用户数"  ,headAlign:'right' ,align:'right'   ,exportnumber:true },
		{ id : 'averageFlushKb'      , header : "平均流量(KB/人)"   ,headAlign:'right' ,align:'right'  ,exportnumber:true ,renderer:renderFormatDataInit2 }
		
];

var gridConfig={
	id : "datagrid",
	/* loadURL 支持函数, 该函数返回值是response对象 */
	loadURL :'/countrySpace_query.do',
	exportURL :'/countrySpace_export.do?1=1' ,
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
	beforeLoad:checkLogon,
	toolbarContent : 'nav | goto | pagesize | state' ,
	pageSize : getDispalyPageSize(2,2) ,
	remoteSort : false ,
	remotePaging:false,
	pageSizeList :  [10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,45,50,100],
	onComplete:loadComplate,
	onCellClick : showMapArea
};
//点击区域时，在地图上加亮显示该区域
function showMapArea(value, record , cell,row, colNO, rowNO,column,event){
	if(value==record.spaceName){
		//alert(record.businessName);
		document.frm.MantoEye_Main.areaActive(value);
		document.frm1.MantoEye_Main.areaActive(value);
	}else{
		document.frm.MantoEye_Main.areaActive("-");
		document.frm1.MantoEye_Main.areaActive("-");
	}
}
var datagrid=new GT.Grid( gridConfig );
GT.Utils.onLoad( function(){
	datagrid.render();
} );

function loadComplate(){
	//grid列表初始化信息
	var obj = new Object ();//使用对象传参,以防以后修改
	obj.datagrid = datagrid;
	obj.hideColumn = 0 ;//隐藏的列数目
	obj.isCheckbox = false;//是否可选择
	obj.otherHeight = 0 ; //必须定义,因为有些页面不同，所以此处指定预留高度
	//判断是否查询到数据
	judgeData(datagrid);
	//初始化grid
	initGridInfo(obj);
	//图形数据
	if(!hasinit){
		getAjaxChartXmlData();
	}
}


/*****************地图定义******************/
function flashAreaDbClick(areaName){
	//openDistributeBusiness(1,'BSC','2009-08-20 20:00:00');
}

var hasgetdata = false;
//加载图形数据入口
function loadDataString(){	
	var xml =document.getElementById("chartxmldata").value;	
	if(xml!=null&&xml!=''){
		hasgetdata = true;
	}
	//alert(xml);
	return xml;
}
//改变地图事件
function changeChartType(){
	var mapflag = 'bsc';
	var vnum = 0;
	$('.checkboxclass"').each(function(){
		if(this.checked==true){
			$('#'+this.id+"_image").get(0).style["width"]="100%"	
			$('#'+this.id+"_image").get(0).style["height"]="100%"	
				vnum++			
		}else{
			$('#'+this.id+"_image").get(0).style["width"]="0"	
			$('#'+this.id+"_image").get(0).style["height"]="0"	
		}
	})

	if(vnum==0){
		$("#areaimage").get(0).style["height"]="30px"			
	}else{
		$("#areaimage").get(0).style["height"]="350px"
		getDispalyPageSize(2,1);
	}	
	
}

//获取服务器端图形数据
function getAjaxChartXmlData(){
	$.ajax({
		type : "post",
		url : "/countrySpace_getAjaxChartXmlData.do",
		data : {
			raittype:dataType_search,
			stattype:timeLevel_search,
			searchdate:time_search,
			spaceLevel:spaceLevel_search,
			countryId:country_Id
		},
		success : function(xml) {
			document.getElementById("chartxmldata").value=xml;
			if(!hasinit && datachange){
				frm.MantoEye_Main.changeData(chartFlag);
				frm1.MantoEye_Main.changeData(chartFlag);
				datachange = false;
			}else if(!hasgetdata){
				document.frm.MantoEye_Main.changeData(chartFlag);
				document.frm1.MantoEye_Main.changeData(chartFlag);
			}
			hasinit = true;
		},
		error : function() {
			//alert('服务器出错,请联系管理员!');
		}
	});
}
//显示的区域维度
function showAreaType(){
	var sls=$("#spaceLevel_search option:selected").val(); 
	switch(sls)
	   {
	   case '1':
	   	 chartFlag = 'bsc';
	   	 chartFlagName = 'BSC';
	     break;
	   case '2':
	   	 chartFlag = 'sgsn';
	   	  chartFlagName = 'SGSN';
	     break;
	   case '3':
	   	 chartFlag = 'street';
	   	  chartFlagName = '街道办';
	     break;
	   case '4':
	   	 chartFlag = 'sale';
	   	  chartFlagName = '营销片区';
	     break;
	  case '5':
	   	 chartFlag = 'company';
	   	  chartFlagName = '分公司';
	     break;   
	 }
}
/**************************地图定义结束***********/

//grid查询
function query() {
//重置分页数据
	var pageinfo = datagrid.getPageInfo();
	pageinfo.pageNum = 1;
	datagrid.setPageInfo(pageinfo);
	//查询条件
	timeLevel_search = $("#timeLevel_search option:selected").val();
	time_search = $('#time_search').attr("value");
	spaceLevel_search = $('#spaceLevel_search').attr("value");
	country_Id =$('#countryId').attr("value"); 
	if(time_search=='' ){
		alert('请选择时间!');
		return ;
	}
	hasinit = false;
	datachange = true;
	var param={
		hasinit:hasinit,
		raittype:dataType_search,
		stattype:timeLevel_search,
		searchdate:time_search,
		spaceLevel:spaceLevel_search,
		countryId:country_Id
	};
	GT.$grid('datagrid').query( param );
}

//设置页面显示的数据类型
function showDataType(type){
	dataType_search = type ;
}
//重置查询条件
function reset(){
	$('#time_search').attr("value","");
	$("#timeLevel_search").get(0).selectedIndex=0;
	$('#dataType_search_td_id input:first').attr("checked","true");//设置radio默认值
	$("#spaceLevel_search").get(0).selectedIndex=0;//区域维度
	$("#countryId").attr("value",'101');
}

var countrys = [];
$(document).ready(function(){
	//初始化查询时间
	$('#time_search').attr('value',time_search);
	//初始化国家选择框
	getAllCountry();
	
	resetautocomplete(countrys,'tttt','countryId');
});

//时间选择事件
function selectTime(){
	var tls = $("#timeLevel_search option:selected").val();
	switch(tls)
	   {
	   case '1':
	   	 new WdatePicker({dateFmt:'yyyy-MM-dd HH:00:00'});
	     break;
	   case '2':
	   	 new WdatePicker({dateFmt:'yyyy-MM-dd'});
	     break;
	   case '3':
	   	 //new WdatePicker({isShowWeek:true,onpicked:function(){$dp.$D('time_search').value=$dp.cal.getP('W','第'+'W'+'周');}})
	     new WdatePicker({dateFmt:'yyyy-MM-dd'});
	     break;
	   case '4':
	   	 new WdatePicker({dateFmt:'yyyy-MM'});
	     break;
	 }
}
//时间改变事件
function changeTimeLevel(){
	$('#time_search').attr("value","");
}


//初始化toolbar
$(document).ready(function(){
	displayOrHiddenTd();
		if(width==1024){
			$("#frm").css("width","1025px");
			$("#frm1").css("width","1025px");
		}
		
      var toolbar = new Toolbar({
        renderTo : 'toolbar',
		//border: 'top',
        items : [{
          type : 'button',
          text : '导出',
          bodyStyle : 'xls',
          useable : 'T',
          handler : exportToXls
        }]
      });
	  toolbar.render();
    });
//获取归属地数据
function getAllCountry(){
	$.ajax({
		type : "post",
		url : "/countryTopUser_findAllCountry.do",
		dataType: 'json',
		success : function(data) {
			var jsn = eval(data);
			var jn = jsn.datalist;
			 $("#countryId").empty();
			 $("#countryId1").empty();
			var inhtml = "<option value ='-1'>--全部--</option>";
			for(var i=0;i<jn.length;i++){
				if(jn[i].id=='101'){
				inhtml = inhtml + '<option value ="'+jn[i].id+'" selected >'+jn[i].name+'</option>'
				}else{
				inhtml = inhtml + '<option value ="'+jn[i].id+'"  >'+jn[i].name+'</option>'
				}	
				countrys[i] =  {name:jn[i].name,id:jn[i].id};
			}
			 $(inhtml).appendTo("#countryId");//添加下拉框的option
			// $("#countryId").attr("value",'101');
			  $(inhtml).appendTo("#countryId1");//添加下拉框的option
			// $("#countryId1").attr("value",'101');
		},
		error : function() {
			alert('获取归属地数据失败!');
		}
	});
}
function exportToXls(){
 	//查询条件
	var params={
		hasinit:hasinit,
		raittype:dataType_search,
		stattype:timeLevel_search,
		searchdate:time_search,
		spaceLevel:spaceLevel_search,
		countryId:country_Id
	};
			//导出
	var fileObj = new Object();
	fileObj.fileName='用户归属地'+chartFlagName+'分布数据';//('+startTime_search+'至'+endTime_search+')';//文件名称
	fileObj.fileFormat = 'xls';//文件格式,后台暂支持xls格式
	fileObj.gridObj = datagrid;//当前grid对象
	fileObj.params = params;
	exportFile(fileObj);
 }
/**
脚本不出错*/
$(document).ready(function(){
	window.onerror = killErrors;
})
function killErrors() {
	return true;
}


/*
function checkBlur(){ 
					if(document.all["t"].value=="" || document.all["t"].value=="输入以快速查找国家或地区"){ 
							document.getElementById("t").value="输入以快速查找国家或地区";
							os = document.all["countryId1"].options;
							var tt = document.all["t"].value;  
							for(i=0;i<os.length;i++){ 
								o = os[i]; 
								if(o.text.indexOf(tt)>=0){ 
									var newOpt = new Option(o.text, o.value, false, false); 
									document.all["countryId"].add(newOpt); 
								} 
							}
			}		
	}
				
				function checkFocus(){ 
			
					var tt=document.getElementById("t");
					
					if(tt.value=="输入以快速查找国家或地区" ){
						tt.value="";
					}
					
				} 
				
		function checkSelct(){ 
							os1 = document.all["countryId"].options; 
							for(i=os1.length-1;i>=0;i--){ 
							     document.all["countryId"].remove(i); 
							} 
						
							var tt = document.all["t"].value; 
							if(tt!=""){ 
								os = document.all["countryId1"].options; 
								for(i=0;i<os.length;i++){ 
									o = os[i]; 
									if(o.text.indexOf(tt)>=0){ 
										var newOpt = new Option(o.text, o.value, false, false); 
										document.all["countryId"].add(newOpt); 
									} 
								} 
							}else{ 
								os = document.all["countryId1"].options; 
									for(i=0;i<os.length;i++){ 
											o = os[i]; 
											var newOpt = new Option(o.text, o.value, false, false); 
											document.all["countryId"].add(newOpt); 
									} 
								} 
						}
*/
</script>



