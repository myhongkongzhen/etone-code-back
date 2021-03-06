<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<%@ page contentType="text/html;charset=utf-8"%>
	<%@ include file="/include/session.jsp"%>
	<%@ include file="/include/setcache.jsp"%>
	<head>
		<title>终端业务分析</title>
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
		<!-- OFC图表 -->
		<script type="text/javascript" src="/flash/js/swfobject.js">
</script>
		<script type="text/javascript" src="/flash/js/json/json2.js">
</script>
		<script type="text/javascript" src="/flash/js/BarLineChartUtil.js">
</script>
		<script type="text/javascript" src="/flash/js/ParseUtils.js">
</script>

	</head>
	<body>
		<table id="maincontent" cellspacing="0" cellpadding="0" border="0"
			bgcolor="#D3E0F2" width="100%" height="100%">
			<tr>
				<td colspan="2" height="5px"></td>
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
								终端业务图形
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
				<td height="230" width="100%"
					style="padding: 15px 20px; background: #ffffff">
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
							<td width="100%" height="24px">
								<div class="middletitle">
									终端业务列表
								</div>
							</td>
							<td width="4px">
								<div class="righttitle"></div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<!-- ------------------>
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
var objterminal = window.dialogArguments;
var taskId = objterminal.taskId;
var taskStartTime = objterminal.taskStartTime;
var dataTypeValue = objterminal.dataTypeValue;
var terminalId = objterminal.terminalId;
var bussinessId = objterminal.bussinessId;
var sortnmFlush = false;
var dsConfig = {
	uniqueField : 'null',
	fields : [ {
		name : 'fullDate'
	}, {
		name : 'business'
	}, {
		name : 'vcTerminalName'
	}, 

	{
		name : 'upFlushMB'
	}, {
		name : 'downFlushMB'
	}, {
		name : 'totalFlushMB'
	}, {
		name : 'upFlushKB'
	}, {
		name : 'downFlushKB'
	}, {
		name : 'totalFlushKB'
	}, {
		name : 'upFlushGB'
	}, {
		name : 'downFlushGB'
	}, {
		name : 'totalFlushGB'
	},

	{
		name : 'nmUsers'
	},

	]
};

var colsConfig = [ {
	id : 'fullDate',
	width : 250,
	header : "时间"
}, {
	id : 'vcTerminalName',
	header : "终端名称",
	width : 250,
	sortable : false
}, {
	id : 'business',
	header : "业务名称",
	width : 250,
	sortable : false
}, {
	id : 'upFlushMB',
	header : "上行流量(MB)",
	headAlign : 'right',
	align : 'right',
	exportnumber : true,
	renderer : renderFormatDataInit2
}, {
	id : 'downFlushMB',
	header : "下行流量(MB)",
	headAlign : 'right',
	align : 'right',
	exportnumber : true,
	renderer : renderFormatDataInit2
}, {
	id : 'totalFlushMB',
	header : "总流量(MB)",
	headAlign : 'right',
	align : 'right',
	exportnumber : true,
	renderer : renderFormatDataInit2
}, {
	id : 'upFlushKB',
	header : "上行流量(KB)",
	headAlign : 'right',
	align : 'right',
	exportnumber : true,
	renderer : renderFormatDataInit2
}, {
	id : 'downFlushKB',
	header : "下行流量(KB)",
	headAlign : 'right',
	align : 'right',
	exportnumber : true,
	renderer : renderFormatDataInit2
}, {
	id : 'totalFlushKB',
	header : "总流量(KB)",
	headAlign : 'right',
	align : 'right',
	exportnumber : true,
	renderer : renderFormatDataInit2
}, {
	id : 'upFlushGB',
	header : "上行流量(GB)",
	headAlign : 'right',
	align : 'right',
	exportnumber : true,
	renderer : renderFormatDataInit2
}, {
	id : 'downFlushGB',
	header : "下行流量(GB)",
	headAlign : 'right',
	align : 'right',
	exportnumber : true,
	renderer : renderFormatDataInit2
}, {
	id : 'totalFlushGB',
	header : "总流量(GB)",
	headAlign : 'right',
	align : 'right',
	exportnumber : true,
	renderer : renderFormatDataInit2
}, {
	id : 'nmUsers',
	header : "用户数",
	headAlign : 'right',
	align : 'right',
	exportnumber : true
} ];



var gridConfig = {
	id : "datagrid",
	/* loadURL 支持函数, 该函数返回值是response对象 */
	loadURL : '/cameratrackresult_queryTerminalBis.do?taskId=' + taskId+'&terminalId='+terminalId+'&bussinessId='+bussinessId+'&taskStartTime='+taskStartTime+'&dataType='+dataTypeValue,
	exportURL : '/cameratrackresult_exportTerminalBis.do?1=1',
	dataset : dsConfig,
	columns : colsConfig,
	width : 780,
	height : 400,
	resizable : false,
	beforeLoad : checkLogon,
	container : 'data_container',
	beforeLoad : checkLogon,
	toolbarContent : 'nav | goto | pagesize | state',
	pageSize : getLongPageSize(),
	remoteSort : true,
	remotePaging : true,
	pageSizeList : [ 5, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23,
			24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
			45, 50, 100 ],
	onComplete : loadComplate
};
function getLongPageSize() {
	var size = getDispalyPageSize(1, 1);
	if (size < 25) {
		size = 25;
	}
	return size;
}
var datagrid = new GT.Grid(gridConfig);
GT.Utils.onLoad(function() {
	datagrid.render();
});
//页面呈现的单位
var showunit = 'KB';
var firstInit = true;

//gird回调函数
function loadComplate() {

	//判断是否查询到数据
	judgeData(datagrid);
	//选择呈现单位
	if (initHasData) {
		sortnmFlush = true;
	}
	if (sortnmFlush) {
		showunit = buildUnit();
		sortnmFlush = false;
	}

	//初始化grid
	var width = window.screen.availWidth;
	//根据分辨率初始化grid列宽
	if (!columninit) {
		if (width == 1024) {
			initColumnWidthWithPop(datagrid, 792, 6);

		} else {
			initColumnWidthWithPop(datagrid, 973, 6);

		}
	}
	buildBarChartData(datagrid.getAllRows().length);
}

//初始化grid工具栏
$(document).ready(function() {
	var toolbar = new Toolbar( {
		renderTo : 'toolbar',
		//border: 'top',
		items : [ {
			type : 'button',
			text : '导出',
			bodyStyle : 'xls',
			useable : 'T',
			handler : function() {

				var params = {
					taskId : taskId,
					taskStartTime : taskStartTime,
					dataType : dataTypeValue,
					 terminalId :terminalId,
 bussinessId :bussinessId
				};
				//导出

			var fileObj = new Object();
			fileObj.fileName = '终端业务分析数据';
			fileObj.fileFormat = 'xls';//文件格式,后台暂支持xls格式
			fileObj.gridObj = datagrid;//当前grid对象
			fileObj.params = params;
			exportFile(fileObj);
		}
		} ]
	});
	toolbar.render();

});
//////////////////图表////////////////////////
function buildBarChartData(totalRecords) {
	var str1 = buildChartJsonStr(totalRecords);
	if (!chartinit) {
		chartinit = true;
		document.getElementById("chartxmldata").value = str1;
		swfobject.embedSWF("/flash/open-flash-chart-mw.swf?id=business",
				"imgarea1", "100%", "100%", "9.0.0", "expressInstall.swf", '',
				{
					"wmode" : "opaque"
				});
	} else {
		var tmp1 = findSWF("imgarea1");
		tmp1.load(str1);
	}

}
/*图表是否已经初始化*/
var chartinit = false;
/*组装图形数据*/
function buildChartJsonStr(totalRecords, flag) {

	var chartTime = '';
	var title = '';
	var xlabels = [];
	var datas1 = [];
	var datas2 = [];
	var showxlabels = [];
	if (typeof (datagrid.getRecord(0)) != "undefined") {
		totalbar = 0;
		for ( var i = 0; i < totalRecords; i++) {
			if (totalbar == 10) {
				break;
			}
			var record = datagrid.getRecord(i);
			if (title == '') {
				title =   "终端业务 流量|用户数对比图";
			}
			totalbar++;
			
			if(bussinessId!=-1){
						showxlabels[i] = record.vcTerminalName;
			xlabels[i] = record.vcTerminalName;
				
			}else if(terminalId!=-1){
			showxlabels[i] = record.business;
			xlabels[i] = record.business;
			}
			//如果柱状图需要添加点击，必须以如下的方法设置个点的值	
			if ('MB' == showunit) {
				datas2[i] = StringToFloat(record.totalFlushMB);
			} else if ('KB' == showunit) {
				datas2[i] = StringToFloat(record.totalFlushKB);
			} else if ('GB' == showunit) {
				datas2[i] = StringToFloat(record.totalFlushGB);
			}

			//如果柱状图不需要点击时间，可以用以下写法 
			datas1[i] = StringToFloat(record.nmUsers);

		}

		//格式化X轴
		xlabels = formatXDateStrLables(xlabels);
		var tdatas = [];

		//格式化Y轴数据（流量）

		var obj = new Object();
		obj.datas = datas2;
		obj.unit = showunit;
		var lobj = obj
		var lunit = "流量";
		if (lobj.unit != "") {
			lunit = lunit + "@@" + lobj.unit;
		}
		tdatas[0] = lobj.datas;

		//格式化Y轴数据（用户数）
		var robj = formatObjNumberByWan(datas1);
		var runit = "用户数";
		if (robj.unit != "") {
			runit = runit + "@@" + robj.unit;
		}
		//alert(robj.datas);
		tdatas[1] = robj.datas;

		tdatas[0] = buildBarChartTip(lobj.datas, showxlabels, lunit);
		tdatas[1] = buildLineChartTip(robj.datas, showxlabels, runit);

		//如果有单位  则label与单位间用@@分开
		var labels = [ lunit, runit ];

		var jsons1 = buildMutileChartData(title, labels, xlabels, tdatas);

		var str1 = JSON.stringify(jsons1);
		return str1;
	} else {
		var str2 = JSON.stringify(buildEmptyAxisChart());
		return str2;
	}
}

/*初始化图表*/
function open_flash_chart_data(id) {
	return document.getElementById("chartxmldata").value;
}
/*图表回调函数*/
function callback(label) {
	//alert("label:"+label);
}
///////////////////////////////////////////

/**
 *
 */
$(document).ready(function() {
	window.onerror = killErrors;
})
function killErrors() {
	return true;
}
</script>


