<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html style="overflow-x: hidden">
	<%@ page contentType="text/html;charset=utf-8"%>
	<%@ include file="/include/session.jsp"%>
	<%@ include file="/include/setcache.jsp"%>
	<head>
		<title>终端品牌系统分析</title>
		<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
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
		<script type="text/javascript" src="/js/common_grid.js"></script>
		<!-- OFC图表 -->
		<script type="text/javascript" src="/flash/js/swfobject.js"></script>
		<script type="text/javascript" src="/flash/js/json/json2.js"></script>
		<script type="text/javascript" src="/flash/js/BarChartUtil.js"></script>
		<script type="text/javascript" src="/flash/js/ParseUtils.js"></script>
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
						style="width: 100%">
						<tr valign="top">
							<td>
								<table cellspacing="0" cellpadding="0" border="0" width="100%">
									<tr>
										<td height="5px" bgcolor="#D3E0F2" width="100%"></td>
									</tr>

									<tr>
										<td>
											<table cellspacing="0" cellpadding="0" border="0"
												width="100%" class="menubar">
												<tr valign="top">
													<td width="4px" height="24px">
														<div class="lefttitle"></div>
													</td>
													<td width="100%" height="24px">
														<div class="middletitle" id="distribute_chart_div">
															终端品牌系统分析图形
														</div>
														<input type="hidden" value="" id="chartxmldata1" />
														<input type="hidden" value="" id="chartxmldata2" />
														<input type="hidden" value="" id="chartxmldata3" />
													</td>
													<td width="4px">
														<div class="righttitle"></div>
													</td>
												</tr>
											</table>
										</td>
									</tr>

									<tr>
										<td height="220px" width="100%"
											style="padding: 15px 10px; padding-top: 1px; background: #ffffff">
											<input type="radio" name='chartTypeRadio'
												onclick='showChartType(1)' checked />
											总流量
											<input type="radio" name='chartTypeRadio'
												onclick='showChartType(2)' />
											用户数
											<input type="radio" name='chartTypeRadio'
												onclick='showChartType(3)' style="display:none"/>
											<!--  访问次数-->
											<div id="imgareas" style="width: 99%; height: 100%;border: 2px solid #008BD1;">
											<div id="imgarea1" style="width: 100%; height: 100%"></div>
											</div>
										</td>
									</tr>

									<tr>
										<td height="5px" bgcolor="#D3E0F2" width="100%"></td>
									</tr>

									<tr>
										<td>
											<table cellspacing="0" cellpadding="0" border="0"
												width="100%" class="menubar">
												<tr valign="top">
													<td width="4px" height="24px">
														<div class="lefttitle"></div>
													</td>
													<td width="100%" height="24px">
														<div class="middletitle" id="distribute_data_div">
															终端品牌系统数据
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
				</td>
			</tr>
		</table>
	</body>
</html>
<script type="text/javascript">
var obj = window.dialogArguments ;
	var areaType = obj.areaType;
	var timeLevel_search = obj.timeLevel_search;
	var dataType_search = obj.dataType_search;
	var time_search = obj.time_search;
	var vcTerminalBrand = obj.vcTerminalBrand;
	var vcName =obj.vcName;
$('#distribute_data_div').html( vcName + '(' + vcTerminalBrand + '品牌)'+ '系统分析数据');
$('#distribute_chart_div').html( vcName + '(' +  vcTerminalBrand+ '品牌)'+ '系统分析图形');

var dsConfig= {
	//data : data1 ,
	uniqueField : 'no' ,
	fields :[
		{name : 'fullDate'        },
		{name : 'vcTerminalOS'      },
		{name : 'upFlushMB'       },
		{name : 'downFlushMB'     },
		{name : 'totalFlushMB'     },
		{name : 'upFlushKB'    },
		{name : 'downFlushKB'   },
		{name : 'totalFlushKB'    },
		{name : 'upFlushGB'    },
		{name : 'downFlushGB'   },
		{name : 'totalFlushGB'   },
		{name : 'intImsis'  },
		{name : 'nmAveFlushKB'   }
		
	]
};
var colsConfig = [
		{ id : 'fullDate'      , header : "时间",sortable:false     },
		{ id : 'vcTerminalOS'      , header : "终端系统"   ,sortable:false   },
		{ id : 'upFlushMB'    , header : "上行流量(MB)"   ,sortable:false ,headAlign:'right' ,align:'right' ,exportnumber:true,renderer:renderFormatDataInit2 },
		{ id : 'downFlushMB'     , header : "下行流量(MB)"    ,sortable:false ,headAlign:'right' ,align:'right',exportnumber:true,renderer:renderFormatDataInit2  },
		{ id : 'totalFlushMB'  , header : "总流量(MB)"  ,sortable:false ,headAlign:'right' ,align:'right' ,exportnumber:true,renderer:renderFormatDataInit2 },
		{ id : 'upFlushKB'    , header : "上行流量(KB)" ,sortable:false ,headAlign:'right' ,align:'right' ,exportnumber:true ,renderer:renderFormatDataInit2  },
		{ id : 'downFlushKB'     , header : "下行流量(KB)" ,sortable:false ,headAlign:'right' ,align:'right' ,exportnumber:true ,renderer:renderFormatDataInit2   },
		{ id : 'totalFlushKB'  , header : "总流量(KB)" ,sortable:false ,headAlign:'right' ,align:'right',exportnumber:true,renderer:renderFormatDataInit2 },
		{ id : 'upFlushGB'    , header : "上行流量(GB)" ,sortable:false ,headAlign:'right' ,align:'right' ,exportnumber:true ,renderer:renderFormatDataInit2  },
		{ id : 'downFlushGB'     , header : "下行流量(GB)" ,sortable:false ,headAlign:'right' ,align:'right' ,exportnumber:true ,renderer:renderFormatDataInit2   },
		{ id : 'totalFlushGB'  , header : "总流量(GB)" ,sortable:false ,headAlign:'right' ,align:'right',exportnumber:true,renderer:renderFormatDataInit2 },
		{ id : 'intImsis' , header : "用户数"      ,sortable:false ,headAlign:'right' ,align:'right',exportnumber:true },
		{ id : 'nmAveFlushKB'  , header : "平均流量(KB/人)",headAlign:'right' ,align:'right',exportnumber:true,renderer:renderFormatDataInit2  ,sortable:false}
];

var gridConfig={
	id : "datagrid",
	loadURL :'/terminalSystemDetail_query.do?vcName='+obj.vcName+'&dataType_search='+dataType_search+'&time_search='+time_search+'&timeLevel_search='+timeLevel_search+'&vcTerminalBrand='+vcTerminalBrand+'&areaType='+areaType,
	exportURL :'/terminalSystemDetail_export.do?1=1' ,
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
	pageSize : 10 ,
	remoteSort : true ,
	pageSizeList : [10,20,50,100],
	defaultRecord :  { no : 111 , name :'', age : '', gender : 'U' , english : 50 , math :50 },
	onComplete:loadComplate
};

var datagrid=new GT.Grid( gridConfig );
GT.Utils.onLoad( function(){
	datagrid.render();
} );

function loadComplate(){
	//判断是否查询到数据
	judgeData(datagrid,1);
	//选择呈现单位 
	if(!initHasData){
		sortInit = true;
	}
	
	if(sortInit && initHasData){
		 buildUnit();
		sortInit = false;
	}
	
	var totalRecords = datagrid.getAllRows().length;//获取加载到的数据记录数目
	var width=window.screen.availWidth;
	//根据分辨率初始化grid列宽
	if(!columninit){
		if(width==1024){
			initColumnWidthWithPop(datagrid,792,6);
			
		}else{
			initColumnWidthWithPop(datagrid,973,6);
			
		}
	}
	//getAjaxChartXmlData();
	//组装图形数据

	buildChartData(datagrid.getAllRows().length);	
}

///////////////////图表////////////////////////

/*图表是否已经初始化*/
var chartinit = false;
/*显示的图形*/
var showchart = 1;
/*组装图形数据*/
function buildChartData(totalRecords){

	var title1 = '';
	var title2 = '';
	//var title3 = '';
	var chartTime ='';

	var xlabels = [] ;
	var datas1 = [] ;//流量	
	var datas2 = [] ;//用户数	
	var datas3 = [] ;//访问次数
	
	if(typeof(datagrid.getRecord(0))!="undefined"){
		for(var i = 0 ; i<totalRecords;i++){	
			var record = datagrid.getRecord(i);
			if(title1==''){
		 		chartTime = record.fullDate;
				title1 =  chartTime + " 终端系统流量分析图";
				title2 = chartTime + " 用户数分析图";
		 	}	
			if(i<10){//图形只显示前10 的数据
				xlabels[i] = record.vcTerminalOS; 	
				datas1[i] = StringToFloat(record.totalFlushKB);
				datas2[i] = StringToFloat(record.intImsis);	
			} 			
		}
	}else{
		var str1 = JSON.stringify(buildEmptyAxisChart());
		if(!chartinit){
			chartinit = true;
			document.getElementById("chartxmldata1").value=str1;
			swfobject.embedSWF("/flash/open-flash-chart-mw.swf?id=flush", "imgarea1", "100%", "100%", "9.0.0","expressInstall.swf",'',{"wmode":"opaque"});
		}else{
	  		var tmp1 = findSWF("imgarea1");	  	
  			tmp1.load(str1);	
		}
		return;
	}
	var showxlabels = xlabels;
	 xlabels = formatXDateStrLables(xlabels);
	 
	var tdatas1 = [];
	var tdatas2 = [];
	
	  //格式化Y轴数据（流量）
	var lobj = formatDataBy1024(datas1,"KB");
	var lunit="流量";
	if(lobj.unit!=""){
		lunit = lunit +"@@"+lobj.unit;
	}
	tdatas1[0] = lobj.datas;
	 //格式化Y轴数据（用户数）
	var robj = formatNumberByWan(datas2);
	var runit="用户数";
	if(robj.unit!=""){
		runit = runit +"@@"+robj.unit;
	}
	//alert(robj.datas);
	tdatas2[0] = robj.datas;
	
	
	
	 //如果有单位  则label与单位间用@@分开
	var labels1 = [lunit];	
	var labels2 = [runit];	

	tdatas1[0] = buildBarChartTip(lobj.datas,showxlabels,lunit);
	tdatas2[0] = buildBarChartTip(robj.datas,showxlabels,runit);
	
	
	var jsons1 = buildSingleChartData(title1,labels1,xlabels,tdatas1);
	var str1 = JSON.stringify(jsons1);
	//alert(str1);
	var jsons2 = buildSingleChartData(title2,labels2,xlabels,tdatas2);
	var str2 = JSON.stringify(jsons2);
	//alert(str2);

	if(!chartinit){
		chartinit = true;
		document.getElementById("chartxmldata1").value=str1;
		document.getElementById("chartxmldata2").value=str2;
		showchart =1;
		swfobject.embedSWF("/flash/open-flash-chart-mw.swf?id=flush", "imgarea1", "100%", "100%", "9.0.0","expressInstall.swf",'',{"wmode":"opaque"});
	}else{
	  	var tmp1 = findSWF("imgarea1");	 
	  	if(showchart==1){
	  		tmp1.load(str1);	
	  	}else if(showchart==2){
	  		tmp1.load(str2);	
	  	}else{
	  		tmp1.load(str3);
	  	} 	
	}
	
}
/*初始化图表*/
function open_flash_chart_data(id)
{
	return document.getElementById("chartxmldata1").value;
}
/*图表回调函数*/
function callback(label){
	//alert("label:"+label);
}
///////////////////////////////////////////


/*****************图形****************************/
//var initChartAgain = false;//判断是否再次初始化图形
//显示图形
function showChartType(flag){
	showchart = flag;
	var str1=document.getElementById("chartxmldata1").value;
	var str2=document.getElementById("chartxmldata2").value;
	var str3=document.getElementById("chartxmldata3").value;
	var tmp1 = findSWF("imgarea1");	 
		if(showchart==1){
	  		tmp1.load(str1);	
	  	}else if(showchart==2){
	  		tmp1.load(str2);	
	  	}else{
	  		tmp1.load(str3);
	  	} 	
}

/***************初始化toolbar***************************/
$(document).ready(function(){
      var toolbar = new Toolbar({
        renderTo : 'toolbar',
		//border: 'top',
        items : [{
          type : 'button',
          text : '导出',
          bodyStyle : 'xls',
          useable : 'T',
          handler : function(){
          //alert(areaType+"---"+dataType_search+"---"+timeLevel_search+"---"+time_search+"---"+vcName+"---"+vcTerminalNetType)
             //参数
			var params={
				areaType:areaType,
				dataType_search:dataType_search,
				timeLevel_search:timeLevel_search,
				time_search:time_search,
				vcName:vcName,
				vcTerminalBrand:vcTerminalBrand
			};
			//导出
			var fileObj = new Object();
			fileObj.fileName=vcName+'终端系统明细';
			fileObj.fileFormat = 'xls';//文件格式,后台暂支持xls格式
			fileObj.gridObj = datagrid;//当前grid对象
			fileObj.params = params;
			exportFile(fileObj);
          }
        }]
      });
	  toolbar.render();
    });
/***************初始化toolbar结束***************************/


/**
脚本不出错
*/
$(document).ready(function(){
	window.onerror = killErrors;
})
function killErrors() {
	return true;
}


</script>



