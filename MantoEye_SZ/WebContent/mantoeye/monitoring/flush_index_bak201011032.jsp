<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/session.jsp"%>
<%@ include file="/include/setcache.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.opensymphony.xwork2.ActionContext"%><html
	xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>告警展示页面</title>
<link type="text/css" rel="stylesheet"
	href="/skin/Default/css/maincontent.css" />
<link rel="stylesheet" type="text/css" href="/tools/gt-grid/gt_grid.css" />
<link rel="stylesheet" href="/js/jquery/extend.tab/css/Toolbar.css"
	type="text/css"></link>
<script type="text/javascript" src="/tools/gt-grid/gt_msg_cn.js"></script>
<script type="text/javascript" src="/tools/gt-grid/gt_grid_all.js"></script>
<script type="text/javascript" src="/js/common_grid.js"></script>
<script type="text/javascript" src="/js/jquery/extend.tab/js/Toolbar.js"></script>
 <script type="text/javascript" src="/flash/js/DoubleLineChartUtil3.js"></script> 
<script type="text/javascript" src="/flash/js/swfobject.js"></script>
<script type="text/javascript" src="/flash/js/json/json2.js"></script>
<script type="text/javascript" src="/flash/js/ParseUtils.js"></script>
<script language="javascript" type="text/javascript"
	src="/tools/datepicker/WdatePicker.js"></script>
<!-- 列表工具栏 -->
<script type="text/javascript" src="/js/jquery/extend.tab/js/Toolbar.js"></script>
</head>
<body>
<table id="maincontent" cellspacing="0" cellpadding="0" border="0"
	bgcolor="#D3E0F2" width="100%" style="height: 100%;">
	<tr>
		<td colspan="2" height="5px"></td>
	</tr>
	<tr valign="top">
		<td>
		<table cellspacing="0" cellpadding="0" border="0" bgcolor="#ffffff"
			style="width: 100%;">
			<tr valign="top">
				<td>
				<table cellspacing="0" cellpadding="0" border="0" width="100%">
					<tr valign="top" style="font-size: 1px;">
						<td>
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
						</td>
					</tr>
					<tr valign="top">
						<td width="100%" class="condition_down">
						<table id="query_condition" cellspacing="0px" cellpadding="0px;"
							border="0">
							<tr>
								<td class="condition_name" style="display: none">查询类型：</td>
								<td class="condition_value" style="display: none"><select
									id="selectType">
									<option value="1">CGI</option>
									<option value="2">BSC</option>
									<option value="3">SGSN</option>
									<option value="4">业务</option>
								</select></td>
								<td class="condition_name">查询时间：</td>
								<td><input type="text" class="Wdate"
									onclick="getStartWdate()" style="height: 17px;" id="startDate"
									name="startDate" /></td>
								<td style="width: 5px;">到</td>
								<td><input type="text" class="Wdate"
									onclick="getEndWdate()" style="height: 17px;" id="endDate"
									name="endDate" /></td>
								<td width="5"></td>
								<td width="40px">
								<div id="mainbtn">
								<ul>
									<li><a href="javascript: query1();" title="查询"><span>查询</span>
									</a></li>
								</ul>
								</div>
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
								<td width="100%" height="16px">
								<div class="middletitle" id="headTitle">识别率告警示意图</div>
								<input type="hidden" value="" id="chartxmldata" /></td>
								<td width="4px">
								<div class="righttitle"></div>
								</td>
							</tr>
						</table>
						</td>
					</tr>
					<tr>
						<td height="230" width="100%"
							style="padding: 10px 20px; background: #ffffff">
						<div id="imgareas"
							style="width: 100%; height: 100%; border: 2px solid #008BD1;">
						<div id="imgarea1" style="width: 100%; height: 100%"></div>
						</div>
						</td>
					</tr>
					<tr>
						<td>
						<table cellspacing="0" cellpadding="0" border="0" width="100%"
							class="menubar">
							<tr valign="top">
								<td width="4px" height="24px">
								<div class="lefttitle"></div>
								</td>
								<td width="100%" height="16px">
								<div class="middletitle" id="sbvTitle">识别率数据</div>
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
						<div class="gt-panel" style="width: 100%; margin: 0px;">
						<div id="data_container1" style="height: 20px;"></div>
						</div>
						</td>
					</tr>
					<tr>
						<td>
						<table cellspacing="0" cellpadding="0" border="0" width="100%"
							class="menubar">
							<tr valign="top">
								<td width="4px" height="20px">
								<div class="lefttitle"></div>
								</td>
								<td width="100%" height="16px">
								<div class="middletitle">流量告警数据</div>
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
						<div class="gt-panel" style="width: 100%; margin: 0px;">
						<div id="data_container"></div>
						</div>
						</td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		</td>
		<td width="2px"></td>
	</tr>
</table>
</body>
</html>

<script type="text/javascript">
	var type = '1';
	var typeName = 'CGI';
	var date = new Date();
	var year = date.getYear();
	var m = date.getMonth();
	var month = m > 9 ? m + '' : '0' + m;
	var d = date.getDate();
	var day = d > 9 ? d + '' : '0' + d;

	var startDate = year + '-' + month + '-' + day;

	date = date.valueOf();
	date = date - 24 * 60 * 60 * 1000;
	date = new Date(date);
	var yesterday = date.getYear()
			+ '-'
			+ ''
			+ ((date.getMonth() + 1) > 9 ? (date.getMonth() + 1) : ("0" + (date
					.getMonth() + 1))) + '-' + ''
			+ (date.getDate() > 9 ? date.getDate() : ("0" + date.getDate())); //查询开始时间

	var endDate = yesterday;

	$(document).ready(function() {
		//$('#title').html(typeName + '历史识别率告警数据');
			$('#startDate').attr('value', startDate);
			$('#endDate').attr('value', endDate);
			$('#sbvTitle').html('${yestoday} 未识别率数据');
		});


	function query1(){
		var param = buildCondition();

		if( '' == startDate){
			alert('起始查询时间不能为空!');
			return;
		}
		if( '' == endDate){
			alert('截止查询时间不能为空!');
			return;
		}

		//alert(startDate+'=='+ endDate+'=='+type);

		queryAgax();
	}
	var selectType = '1';  

	function buildCondition(){
		startDate = $('#startDate').val();
		endDate = $('#endDate').val();
		selectType = $('#selectType').val();
		type = selectType;

		if('1' == type){
			typeName='CGI';
		}else if('2' == type){
			typeName='BSC';
		}else if('3' == type){
			typeName='SGSN';
		}else{
			typeName='业务';
		}
		
		var param = {
			startDate : startDate,
			endDate : endDate,
			type:type 
		}

		return param;
	}

	function getStartWdate(){
		return new WdatePicker({maxDate:'#F{$dp.$D(\'endDate\')}',dateFmt:'yyyy-MM-dd'}) ;
	}
	function getEndWdate(){
		return new WdatePicker({minDate:'#F{$dp.$D(\'startDate\')}',dateFmt:'yyyy-MM-dd'}) ;
	}

	 $(document).ready(function(){
		 queryAgax();
		});


	  function queryAgax(){
		  var param = buildCondition();
		  $.ajax({
				type : "post",
				//dataType: 'json',
				url : "distinguishRatioAlarm_queryHistoryIndex.do",
				data : param,
				success : function(sjson) {
					//alert("sjson:"+sjson);
					//if(sjson!=null && '' != sjson){		
						//组装图形数据
						buildChartData(sjson);
						//alert('sjson');	
					//}
					hasinit = true;
				},
				error : function() {
					alert('查询数据出错!');
				}
			});
	  }

	  /*图表是否已经初始化*/
	  var chartinit = false;
	  /*组装图形数据*/ 
	   
	  function getMaxSizeXlabels(xlabels1,xlabels2,xlabels3,xlabels4){

	  	var s1 = xlabels1.length;
	  	var s2 = xlabels2.length;
	  	var s3 = xlabels3.length;
	  	var s4 = xlabels4.length;
	  	var temp = 0; 
	  	if( s2 > s1){
	  		temp = s2;
	  	 }else{
	  		temp = s1;
	  	 }
	  	 if( s3 > temp){
	  		temp = s3;
	  	 }
	  	 if( s4 > temp){
	  		temp = s4;
	  	 }

	  	 for(var i = 0 ;i < temp ; i ++){
	  		if(typeof xlabels1[i] != 'undefined'){
	  			//alert('---');
	  		}else{
	  			//alert('undefined');
	  		}
	  	 }
	  }
	   
	   
	  function buildChartData(json){ 
		 	var title = startDate+"至"+endDate+"  识别率走势图";

		 	var xlabels = [] ;
			var datas = [];
			var typeNames = [];
			
		 	if(json!=''&& null != json){
		 		var ts = json.split("@");
				if( ts.length > 0){
					for (var i = 0; i < ts.length; i++) {
						var fullDate = ts[i].split('^')[0];
						var alarmRatio = ts[i].split('^')[1];
						var typeName = ts[i].split('^')[2];
						
						xlabels[i] = fullDate; 	
						datas[i] = alarmRatio;
						typeNames[i] = typeName;
					}
				}
		  	}else{
		  		var str1 = JSON.stringify(buildEmptyAxisChart());				
		  		if(!chartinit){
		  			chartinit = true;
		  			document.getElementById("chartxmldata").value=str1;
		  			swfobject.embedSWF("/flash/open-flash-chart-mw.swf?id=flush", "imgarea1", "99%", "99%", "9.0.0","expressInstall.swf",'',{"wmode":"opaque"});
		  		}else{
		  	  		var tmp1 = findSWF("imgarea1");	  	
		  				tmp1.load(str1);	
		  		}
		  		return;
		  	}

		 	xlabels = formatXDateLables(xlabels,15,"day");
		 	 
		 	var tdatas = [];
			var lobj = formatPercentDate(datas,typeNames);

			var lunit1="CGI识别率@@%";
			var lunit2="BSC识别率@@%";
			var lunit3="SGSN识别率@@%";
			var lunit4="业务识别率@@%";
			tdatas[0] = lobj.datas1;
			tdatas[1] = lobj.datas2;
			tdatas[2] = lobj.datas3;
			tdatas[3] = lobj.datas4;

			var labels = [lunit1,lunit2,lunit3,lunit4 ];
			var jsons1 = buildMutileLineChartData2(title,labels,xlabels,tdatas);
		  	var str1 = JSON.stringify(jsons1);

		  	if(!chartinit){
		  		chartinit = true;
		  		document.getElementById("chartxmldata").value=str1;
		  		swfobject.embedSWF("/flash/open-flash-chart-mw.swf?id=flush", "imgarea1", "99%", "99%", "9.0.0","expressInstall.swf",'',{"wmode":"opaque"});
		  	}else{
		  	  	var tmp1 = findSWF("imgarea1");	  	
		   		tmp1.load(str1);	
		  	}
	  }

	  function formatPercentDate(datas,kpis){
			var obj = new Object();
			var formatdates1 = [];
			var formatdates2 = [];
			var formatdates3 = [];
			var formatdates4 = [];
			var unit1 = "";
			var unit2 = "";
			var unit3 = "";
			var unit4 = "";
			 if(datas.length>0){
				for(var s=0; s<datas.length;s++){
					var n = datas[s].split('%');
						if( 'CGI' == kpis[s] ){
							formatdates1[s] = parseFloat(n[0]);
							unit1 = "CGI";
						}else if( 'BSC' == kpis[s] ){
							formatdates2[s] = parseFloat(n[0]);
							unit2 = "BSC";
						}else if( 'SGSN' == kpis[s] ){
							formatdates3[s] = parseFloat(n[0]);
							unit3 = "SGSN";
						}else{
							formatdates4[s] = parseFloat(n[0]);
							unit4 = "业务";
						}
				}
			}

			obj.datas1=formatdates1;
			obj.datas2=formatdates2;
			obj.datas3=formatdates3;
			obj.datas4=formatdates4;
			obj.unit1=unit1;
			obj.unit2=unit2;
			obj.unit3=unit3;
			obj.unit4=unit4;
			
			return obj;
		}
	   
	  /*初始化图表*/
	  function open_flash_chart_data(id)
	  {
	  	return document.getElementById("chartxmldata").value;
	  }
	  /*图表回调函数*/
	  function callback(label){
	  	//alert("label:"+label);
	  }


	  var rangeTwo ='33~66';

	  function getRangeAreaValue(c){
			if('bscConfig' == c){
				rangeTwo = '1~10';
			}else if('cgiConfig' == c){
				rangeTwo = '1~10';
			}else if('sgsnConfig' == c){
				rangeTwo = '1~10';
			}else{ 
				rangeTwo = '30~40';
			}

			return rangeTwo;
		}


	  var date = new Date();
	  date=date.valueOf();
	  date=date-24*60*60*1000;
	  date=new Date(date); 
	  var yesterday=date.getYear()+'-'+''+((date.getMonth()+1)>9?(date.getMonth()+1):("0"+(date.getMonth()+1)))+'-'+''+(date.getDate()>9?date.getDate():("0"+date.getDate())); //查询开始时间
	   

	  var dddddddd = yesterday;

		var dsConfig = {
				//data : data1,
				uniqueField : 'id',
				fields : [ {
					name : 'typeName'
				}, {
					name : 'countLow'
				}, {
					name : 'countIncrease'
				}, {
					name : 'countDecrease'
				}, {
					name : 'detail'
				}]
			};

			var colsConfig = [ {
				id : 'typeName',
				header : "类型",
				width:120
			}, {
				id : 'countIncrease',
				header : "流量激增(个)",
				headAlign:'right' ,align:'right',
				width:148,
				renderer : rendDetail1
			}, {
				id : 'countDecrease',
				header : "流量激减(个)",
				headAlign:'right' ,align:'right',
				width:148,
				renderer : rendDetail3
			}, {
				id : 'countLow',
				header : "流量异常(个)",
				headAlign:'right' ,align:'right',
				width:148,
				renderer : rendDetail2
			},{
				id : 'detail',
				header : "操作",
				sortable : false,
				width:208,
				renderer : rendDetail
			}

			];

			function rendDetail1(value ,record,columnObj,grid,colNo,rowNo){
				var v = record.countIncrease;
				var type = record.typeName;
				if(v>=25 && v < 50){
					return '<font color="#2040c0"><a href="javascript:showMoreInfoAdd(\''+type+'\')" style="cursor:pointer;color:#2040c0;">'
					+v+'<img src="/mantoeye/monitoring/img/light.gif" alt="中等严重"/></a></font>';
				}else if(v>=25 && v < 75){
					return '<font color="#c06040"><a href="javascript:showMoreInfoAdd(\''+type+'\')" style="cursor:pointer;color:#c06040;">'
					+v+'<img src="/mantoeye/monitoring/img/light.gif" alt="严重"/></a></font>';
				}else if(v>=75){
					return '<font color="#ff0000"><a href="javascript:showMoreInfoAdd(\''+type+'\')" style="cursor:pointer;color:#ff0000;">'
					+v+'</a><img src="/mantoeye/monitoring/img/light.gif" alt="非常严重"/></font>';
				}else{
					if( 0 == v){
						return v;
					}else{
						return '<font color="#000000"><a href="javascript:showMoreInfoAdd(\''+type+'\')" style="cursor:pointer;color:#000000"><span>'+v+'</span></a></font>';
					}
				}
			}

			function showMoreInfoAdd(type){
				//alert(type+'==ADD');
				var obj = new Object();
					obj.type = type;
					obj.typeName=type;
					obj.yestoday = '${yestoday}';

				w = '550px';
				h = '520px';
		 
			 	var value = window.showModalDialog("/mantoeye/monitoring/flushAlarmListDay2.jsp?1=1",obj,"dialogWidth="+w+";dialogHeight="+h+";location=no;resizable=no;status=no;toolbar:no;scroll=yes;center=yes");
				
			}
			function showMoreInfoMv(type){
				var obj = new Object();
				obj.type = type;
				obj.typeName=type;
				obj.yestoday = '${yestoday}';

			w = '550px';
			h = '520px';

		 	var value = window.showModalDialog("/mantoeye/monitoring/flushAlarmListDay3.jsp?1=1",obj,"dialogWidth="+w+";dialogHeight="+h+";location=no;resizable=no;status=no;toolbar:no;scroll=yes;center=yes");

			}
			function showMoreInfoWarm(type){
				var obj = new Object();
				obj.type = type;
				obj.typeName=type;
				obj.yestoday = '${yestoday}';

			w = '550px';
			h = '520px';

		 	var value = window.showModalDialog("/mantoeye/monitoring/flushAlarmListDay4.jsp?1=1",obj,"dialogWidth="+w+";dialogHeight="+h+";location=no;resizable=no;status=no;toolbar:no;scroll=yes;center=yes");

			}
			
			function rendDetail3(value ,record,columnObj,grid,colNo,rowNo){
				var v = record.countDecrease;
				var type = record.typeName;
				if(v>=25 && v < 50){
					return '<font color="#2040c0"><a href="javascript:showMoreInfoMv(\''+type+'\')" style="cursor:pointer;color:#2040c0;">'
					+v+'<img src="/mantoeye/monitoring/img/light.gif" alt="中等严重"/></a></font>';
				}else if(v>=25 && v < 75){
					return '<font color="#c06040"><a href="javascript:showMoreInfoMv(\''+type+'\')" style="cursor:pointer;color:#c06040;">'
					+v+'<img src="/mantoeye/monitoring/img/light.gif" alt="严重"/></a></font>';
				}else if(v>=75){
					return '<font color="#ff0000"><a href="javascript:showMoreInfoMv(\''+type+'\')" style="cursor:pointer;color:#ff0000;">'
					+v+'</a><img src="/mantoeye/monitoring/img/light.gif" alt="非常严重"/></font>';
				}else{
					if( 0 == v){
						return v;
					}else{
						return '<font color="#000000"><a href="javascript:showMoreInfoMv(\''+type+'\')" style="cursor:pointer;color:#000000"><span>'+v+'</span></a></font>';
					}
				}
			}
			function rendDetail2(value ,record,columnObj,grid,colNo,rowNo){
				var v = record.countLow;
				var type = record.typeName;
				if(v>=25 && v < 50){
					return '<font color="#2040c0"><a href="javascript:showMoreInfoWarm(\''+type+'\')" style="cursor:pointer;color:#2040c0;">'
					+v+'<img src="/mantoeye/monitoring/img/light.gif" alt="中等严重"/></a></font>';
				}else if(v>=25 && v < 75){
					return '<font color="#c06040"><a href="javascript:showMoreInfoWarm(\''+type+'\')" style="cursor:pointer;color:#c06040;">'
					+v+'<img src="/mantoeye/monitoring/img/light.gif" alt="严重"/></a></font>';
				}else if(v>=75){
					return '<font color="#ff0000"><a href="javascript:showMoreInfoWarm(\''+type+'\')" style="cursor:pointer;color:#ff0000;">'
					+v+'</a><img src="/mantoeye/monitoring/img/light.gif" alt="非常严重"/></font>';
				}else{
					if( 0 == v){
						return v;
					}else{
						return '<font color="#000000"><a href="javascript:showMoreInfoWarm(\''+type+'\')" style="cursor:pointer;color:#000000"><span>'+v+'</span></a></font>';
					}
				}
			}

			function rendDetail(value ,record,columnObj,grid,colNo,rowNo){
				var typeName = record.typeName;
				return '<div id="mainbtn" style="padding-left: 8px;padding-right:8px;">'
					+'<ul><li><a href="javascript:changeThresholdValue(\''+typeName+'\');"'
					+'style="width: 86px;" 　title="阀值设定"><span>阀值设定</span> </a></li>'
					//+'<li><a href="javascript:doWarn(\''+typeName+'\');"'
					//+'style="width: 86px;" title="详细流量告警"><span>详细信息</span> </a></li>'
					+'<li><a href="javascript:seeMoreInfos(\''+typeName+'\');"'
					+'style="width: 86px;" title="历史流量告警"><span>历史告警</span> </a></li>'
					+'</ul></div>';
						 
			}

			function seeMoreInfos(type) {
				var obj = new Object();
				if('CGI' == type){
					obj.type = type;
					obj.typeName=type;
				}else if('BSC' == type){
					obj.type = type;
					obj.typeName=type;
				}else if('SGSN' == type){
					obj.type = type;
					obj.typeName=type;
				}else{
					obj.type = type;
					obj.typeName=type;
				}

				w = '900px';
				h = '520px';
		 
			 	var value = window.showModalDialog("/mantoeye/monitoring/flushAlarmList.jsp?1=1",obj,"dialogWidth="+w+";dialogHeight="+h+";location=no;resizable=no;status=no;toolbar:no;scroll=yes;center=yes");
				
			}

			function changeThresholdValue(type) {

				var obj = new Object();
				if('CGI' == type){
					obj.type = type;
					obj.typeName=type;
				}else if('BSC' == type){
					obj.type = type;
					obj.typeName=type;
				}else if('SGSN' == type){
					obj.type = type;
					obj.typeName=type;
				}else{
					obj.type = type;
					obj.typeName=type;
				}

				w = '600px';
				h = '320px';
		 
				var value = window.showModalDialog("alarmLimitConfig_initQuery2.do?1=1&type="+type,obj,"dialogWidth="+w+";dialogHeight="+h+";location=no;resizable=no;status=no;toolbar:no;scroll=yes;center=yes");
				//var value = window.showModalDialog("/mantoeye/monitoring/changeThresholdValue.jsp?1=1",obj,"dialogWidth="+w+";dialogHeight="+h+";location=no;resizable=no;status=no;toolbar:no;scroll=yes;center=yes");
				
			}
			function doWarn(type) {
				var obj = new Object();
				if('CGI' == type){
					obj.type = type;
					obj.typeName=type;
				}else if('BSC' == type){
					obj.type = type;
					obj.typeName=type;
				}else if('SGSN' == type){
					obj.type = type;
					obj.typeName=type;
				}else{
					obj.type = type;
					obj.typeName=type;
				}

				w = '880px';
				h = '520px';
		 
			 	var value = window.showModalDialog("/mantoeye/monitoring/flushAlarmListDay.jsp?1=1",obj,"dialogWidth="+w+";dialogHeight="+h+";location=no;resizable=no;status=no;toolbar:no;scroll=yes;center=yes");
				
			}

			var w = '600px';
			var h = '520px';
			function showHistoryWarn(type) {
				var obj = new Object();
				if('CGI' == type){
					obj.type = 1;
					obj.typeName=type;
				}else if('BSC' == type){
					obj.type = 2;
					obj.typeName=type;
				}else if('SGSN' == type){
					obj.type = 3;
					obj.typeName=type;
				}else{
					obj.type = 4;
					obj.typeName=type;
				}

				 w = '600px';
				 h = '520px';
			 	var value = window.showModalDialog("/mantoeye/monitoring/distinguishRatioAlarmList.jsp",obj,"dialogWidth="+w+";dialogHeight="+h+";location=no;resizable=no;status=no;toolbar:no;scroll=yes;center=yes");
			
			}
			
			var gridConfig = {
				id : "datagrid",
				loadURL : '/flushAlarm_initQuery.do?1=1&ddd='+dddddddd,
				dataset : dsConfig ,
				columns : colsConfig ,
				width:800,
				height:120,
				resizable : false,
				showGridMenu : false,
				container : 'data_container', 
				beforeLoad:checkLogon,
				toolbarPosition: null,
				//toolbarContent : 'nav | goto | pagesize | state' ,
				pageSize : 100 ,
				remoteSort : false ,
				pageSizeList : [10,20,50,100],
				onComplete:loadComplate
			};

			var datagrid = new GT.Grid(gridConfig);
			GT.Utils.onLoad(function() {
				datagrid.render();
			});

			function loadComplate() {
				var obj = new Object();
				obj.datagrid = datagrid;
				obj.hideColumn = 0;
				obj.isCheckbox = false;
				obj.otherHeight = 0;

				judgeData(datagrid);

				columninit = true;
				//initGridInfoExColumn(obj);

			}

		function getValue(configValue,rangeTwo,c,cv){
			var ra = rangeTwo.split('~');
			
			if(eval(configValue) >= eval(ra[1])){
				$('#'+c).html(ra[1]+'%~100%');
				$('#'+cv).html(' 严重告警');
				$('#'+cv).css("color","red"); 
			}else if(eval(configValue) >=eval(ra[0]) && eval(configValue) <= eval(ra[1]) ){
				$('#'+cv).html('中等告警');	
				$('#'+c).html(ra[0]+'%~'+ra[1]+'%');
				$('#'+cv).css('color','green');	
			}else{
				$('#'+cv).html('正常');
				$('#'+c).html('0%~'+ra[0]+'%');	
				$('#'+cv).css('color','blue');		
			}	

			$('#'+c).attr('title','[正常:0%~'+ra[0]+'%][中等告警:'+ra[0]+'%~'+ra[1]+'%][严重告警:'+ra[1]+'%~100%]');		
		}

		function getRangeAreaValueConfig(c,configValue){
			rangeTwo = getRangeAreaValue(c);
			return getValue2(configValue,rangeTwo);
		}
		function getRangeAreaValueConfigV(c,configValue){
			rangeTwo = getRangeAreaValue(c);
			return getValue3(configValue,rangeTwo);
		}

		function getValue2(configValue,rangeTwo ){
			var ra = rangeTwo.split('~');
			if(eval(configValue) >= eval(ra[1])){
				return  ra[1]+'%~100%' ;
			}else if(eval(configValue) >=eval(ra[0]) && eval(configValue) <= eval(ra[1]) ){
				return  ra[0]+'%~'+ra[1]+'%' ;
			}else{
				return  '0%~'+ra[0]+'%' ;	
			}
		}

		function getValue3(configValue,rangeTwo ){
			var ra = rangeTwo.split('~');
			
			if(eval(configValue) >= eval(ra[1])){
				return ' 严重告警' ;
			}else if(eval(configValue) >=eval(ra[0]) && eval(configValue) <= eval(ra[1]) ){
				return '中等告警' ;	
			}else{
				return '正常';
			}	
		}
		 
		var data1=[];
		function getDatas(){
				var record={ 
						typeName : 'BSC', 
						reAlarmRatio : '${bscBean.reAlarmRatio}%', 
						config : getRangeAreaValueConfig('bscConfig','${bscBean.reAlarmRatio}') , 
						ConfigV :getRangeAreaValueConfigV('bscConfig','${bscBean.reAlarmRatio}') 
					}
				data1.push(record);
				var record={ typeName : 'CGI', 
						reAlarmRatio : '${cgiBean.reAlarmRatio}%', 
						config : getRangeAreaValueConfig('cgiConfig','${cgiBean.reAlarmRatio}') , 
						ConfigV :getRangeAreaValueConfigV('cgiConfig','${cgiBean.reAlarmRatio}')
					}
				data1.push(record);
				var record={ typeName : 'SGSN', 
						reAlarmRatio : '${sgsnBean.reAlarmRatio}%', 
						config : getRangeAreaValueConfig('sgsnConfig','${sgsnBean.reAlarmRatio}') , 
						ConfigV :getRangeAreaValueConfigV('sgsnConfig','${sgsnBean.reAlarmRatio}')
					}
				data1.push(record);
				var record={ typeName : '业务', 
						reAlarmRatio : '${busiBean.reAlarmRatio}%', 
						config : getRangeAreaValueConfig('busiConfig','${busiBean.reAlarmRatio}') , 
						ConfigV :getRangeAreaValueConfigV('busiConfig','${busiBean.reAlarmRatio}')
					}
				data1.push(record);
			return data1;
		}

		data1 = getDatas();
		var dsConfig1 = {
				data : data1,
				uniqueField : 'id',
				fields : [ {
					name : 'reAlarmRatio'
				}, {
					name : 'config'
				}, {
					name : 'ConfigV'
				},{
					name : 'typeName'
				}]
			};

			var colsConfig1 = [ {
				id : 'typeName',
				header : "类型",
				width:195
			},{
				id : 'reAlarmRatio',
				header : "未识别率",
				headAlign:'right' ,align:'right',
				width:195
			}, {
				id : 'config',
				header : "阀        值",
				headAlign:'right' ,align:'right',
				width:195 ,
				renderer : rendDetailConfig_
			}, {
				id : 'ConfigV',
				header : "告警级别",
				headAlign:'right' ,align:'right',
				width:195,
				renderer : rendDetailConfig
			} 

			];

			function rendDetailConfig(value ,record,columnObj,grid,colNo,rowNo){

				var tn = record.typeName;
				var typeName = 'bscConfig';
				if( 'CGI' == tn){
					typeName = 'cgiConfig';
				}else if( 'BSC' == tn){
					typeName = 'bscConfig';
				}else if( 'SGSN' == tn){
					typeName = 'sgsnConfig';
				}else if( '业务' == tn){
					typeName = 'busiConfig';
				} 

				var configV = record.ConfigV;
				var configValue = record.reAlarmRatio;
				var rangeTwo = getRangeAreaValue(typeName);
				var ra = rangeTwo.split('~');

				configValue = configValue.split('%')[0];
				
				if(eval(configValue) >= eval(ra[1])){
					return '<font color="red">'+configV+'</font>';
				}else if(eval(configValue) >=eval(ra[0]) && eval(configValue) <= eval(ra[1]) ){
					return '<font color="green">'+configV+'</font>';
				}else{
					return '<font color="blue">'+configV+'</font>';
				}
				
			}
			function rendDetailConfig_(value ,record,columnObj,grid,colNo,rowNo){

				var tn = record.typeName;
				var typeName = 'bscConfig';
				if( 'CGI' == tn){
					typeName = 'cgiConfig';
				}else if( 'BSC' == tn){
					typeName = 'bscConfig';
				}else if( 'SGSN' == tn){
					typeName = 'sgsnConfig';
				}else if( '业务' == tn){
					typeName = 'busiConfig';
				} 

				var configV = record.ConfigV;
				var configValue = record.reAlarmRatio;
				var rangeTwo = getRangeAreaValue(typeName);
				var ra = rangeTwo.split('~');

				configValue = configValue.split('%')[0];
				
				return '<font style="cursor: pointer;" title="[正常:0%~'+ra[0]+'%][中等告警:'+ra[0]+'%~'+ra[1]+'%][严重告警:'+ra[1]+'%~100%]">'+record.config+'</font>';
			}

			var gridConfig1 = {
					id : "datagrid1",
					dataset : dsConfig1 ,
					columns : colsConfig1 ,
					width:800,
					height:145,
					resizable : false,
					showGridMenu : false,
					container : 'data_container1', 
					beforeLoad:checkLogon,
					toolbarPosition: null,
					//toolbarContent : 'nav | goto | pagesize | state' ,
					pageSize : 100 ,
					remoteSort : false ,
					pageSizeList : [10,20,50,100]  
				};

				var datagrid1 = new GT.Grid(gridConfig1);
				GT.Utils.onLoad(function() {
					datagrid1.render();
				});

		/**
		脚本不出错
		*/
		$(document).ready(function(){
			window.onerror = killErrors;
		})
		function killErrors() {
			return true;
		}


	//-->
</script>
