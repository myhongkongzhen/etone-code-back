<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/include/session.jsp"%>
<%@ include file="/include/setcache.jsp"%>
<head>
<title>APN时间走势</title>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link rel="stylesheet" type="text/css" href="/tools/gt-grid/gt_grid.css" />
<link type="text/css" rel="stylesheet"
	href="/skin/Default/css/maincontent.css" />
<link rel="stylesheet" href="/js/jquery/extend.tab/css/Toolbar.css"
	type="text/css"></link>
<script type="text/javascript" src="/tools/gt-grid/gt_msg_cn.js"></script>
<script type="text/javascript" src="/tools/gt-grid/gt_grid_all.js"></script>
<!--  <script language="javascript" type="text/javascript"
			src="/tools/datepicker/DatePicker/WdatePicker.js"></script>
		-->
<script language="javascript" type="text/javascript"
	src="/tools/datepicker/WdatePicker.js"></script>
<!-- 列表工具栏 -->
<script type="text/javascript" src="/js/jquery/extend.tab/js/Toolbar.js"></script>
<script type="text/javascript" src="/js/common_grid.js"></script>
<script type="text/javascript" src="/mantoeye/dialog/ControlSelector.js"></script>
<script type="text/javascript" src="/tools/jquery/jquery.treeview.js"></script>
<!-- OFC图表 -->
<script type="text/javascript" src="/flash/js/swfobject.js"></script>
<script type="text/javascript" src="/flash/js/json/json2.js"></script>
<script type="text/javascript" src="/flash/js/BarLineChartUtil.js"></script>
<script type="text/javascript" src="/flash/js/ParseUtils.js"></script>
</head>
<body>
<table id="maincontent" cellspacing="0" cellpadding="0" border="0"
	bgcolor="#D3E0F2" width="100%" style="height: 100%;">
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
						<table id="query_condition" cellspacing="0px" cellpadding="0px"
							border="0">
							<tr valign="middle">
								<td class="condition_name">时间粒度：</td>
								<td class="condition_value"><select name="timeLevel"
									id="timeLevel" onchange="changeTimeLevel()"
									style="height: 21px">
									<option value="1" selected>小时</option>
									<option value="2">天</option>
									<option value="3">周（周日~周六）</option>
									<option value="4">月</option>
								</select></td>
								<td class="condition_name">时间跨度：</td>
								<td class="condition_value" id="dateStartId"><input
									type="text" class="Wdate" style="display: block; height: 17px;"
									onclick="getStartDate();" id="queryDateStart"
									name="queryDateStart" /></td>
								<td style="width: 48px;">
								&nbsp;&nbsp;&nbsp;&nbsp;到&nbsp;&nbsp;</td>
								<td class="condition_value" id="dateEndId"><input
									type="text" class="Wdate" style="display: block; height: 17px;"
									onclick="getEndDate();" id="queryDateEnd" name="queryDateEnd" />
								</td>
								<td width="200px">
								<div id="mainbtn" style="margin-left: -6px">
								<ul>
									<li><a href="javascript:query();" 　title="查询"><span>查询</span>
									</a></li>
								</ul>
								</div>
								</td>
							</tr>
							<tr>
								<td class="condition_name">APN：</td>
								<td class="condition_value"><select name="apntype_search"
									id="apntype_search" onchange="" style="height: 21px">
								</select></td>
								<td style="width: 120px"><input type="radio"
									name="dataType" id="d_dataType1" value="1" checked
									style="width: 20px; border: 0px;" /> GPRS <input type="radio"
									name="dataType" value="2" id="d_dataType2"
									style="width: 20px; border: 0px;" /> TD</td>
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
						<div class="middletitle" id="headTitle">APN时间走势图形</div>
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
					style="padding: 15px 20px; background: #ffffff">
				<div id="imgareas"
					style="width: 100%; height: 100%; border: 2px solid #008BD1;">
				<div id="imgarea" style="width: 100%; height: 100%"></div>
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
						<div class="middletitle">APN时间走势列表</div>
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
<script>
	var date = new Date();
	date = date.valueOf();
	date = date - 24 * 60 * 60 * 1000;
	date = new Date(date);
	var initTime = date.getYear()
			+ '-'
			+ ''
			+ ((date.getMonth() + 1) > 9 ? (date.getMonth() + 1) : ("0" + (date
					.getMonth() + 1))) + '-' + ''
			+ (date.getDate() > 9 ? date.getDate() : ("0" + date.getDate())); //查询开始时间
	var timeLevel = '1';
	var queryDateStart = initTime + " 00:00";
	var queryDateEnd = initTime + " 23:00";
	var queryYear = '';
	var queryMonth = '';
	var queryDay = '';
	var queryWeek = '';
	var queryHour = '';
	var apnDomain = 'CMWAP';
	var raitype_trend = '1';

	var dsConfig = {
		uniqueField : 'no',
		fields : [ {
			name : 'fullDate'
		}, {
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
		}, {
			name : 'nmAveFlushKB'
		}, {
			name : 'intImsis'
		} ]
	};

	function renderInit(value, record, columnObj, grid, colNo, rowNo) {
	}

	var colsConfig = [ {
		id : 'fullDate',
		header : "时间",
		width : 150
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
		hidden : true,
		headAlign : 'right',
		align : 'right',
		exportnumber : true,
		renderer : renderFormatDataInit2
	}, {
		id : 'downFlushKB',
		header : "下行流量(KB)",
		hidden : true,
		headAlign : 'right',
		align : 'right',
		exportnumber : true,
		renderer : renderFormatDataInit2
	}, {
		id : 'totalFlushKB',
		header : "总流量(KB)",
		hidden : true,
		headAlign : 'right',
		align : 'right',
		exportnumber : true,
		renderer : renderFormatDataInit2
	}, {
		id : 'upFlushGB',
		header : "上行流量(GB)",
		hidden : true,
		headAlign : 'right',
		align : 'right',
		exportnumber : true,
		renderer : renderFormatDataInit2
	}, {
		id : 'downFlushGB',
		header : "下行流量(GB)",
		hidden : true,
		headAlign : 'right',
		align : 'right',
		exportnumber : true,
		renderer : renderFormatDataInit2
	}, {
		id : 'totalFlushGB',
		header : "总流量(GB)",
		hidden : true,
		headAlign : 'right',
		align : 'right',
		exportnumber : true,
		renderer : renderFormatDataInit2
	}, {
		id : 'intImsis',
		header : "用户数",
		headAlign : 'right',
		align : 'right',
		exportnumber : true
	}, {
		id : 'nmAveFlushKB',
		header : "平均流量(KB/人)",
		headAlign : 'right',
		align : 'right',
		exportnumber : true,
		renderer : renderFormatDataInit2
	} ];

	var gridConfig = {
		id : "datagrid",
		/* loadURL 支持函数, 该函数返回值是response对象 */
		loadURL : '/apnDistributeTrend_query.do?1=1',
		exportURL : '/apnDistributeTrend_export.do?1=1',
		dataset : dsConfig,
		columns : colsConfig,
		width : 780,
		height : 500,
		resizable : false,
		showGridMenu : false,
		allowCustomSkin : false,
		allowFreeze : false,
		allowGroup : false,
		allowHide : false,
		container : 'data_container',
		beforeLoad : checkLogon,
		toolbarContent : 'nav | goto | pagesize | state',
		pageSize : getLongPageSize(),
		remoteSort : true,
		pageSizeList : [ 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22,
				23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38,
				39, 40, 45, 50, 100 ],
		onComplete : loadComplate
	};
	function getLongPageSize() {
		var size = getDispalyPageSize(1, 1);
		if (size < 25) {
			size = 25;
		}
		return 25;
	}
	var datagrid = new GT.Grid(gridConfig);
	GT.Utils.onLoad(function() {
		datagrid.render();
	});

	//页面呈现的单位
	var showunit = 'MB';
	var firstInit = true;
	//gird回调函数
	function loadComplate() {
		var obj = new Object();//使用对象传参,以防以后修改
		obj.datagrid = datagrid;
		obj.hideColumn = 5;//隐藏的列数目
		obj.isCheckbox = false;//是否可选择
		obj.otherHeight = 0; //必须定义,因为有些页面不同，所以此处指定预留高度
		obj.otherWidth = 0;

		//判断是否查询到数据
		judgeData(datagrid);
		//选择呈现单位 
		if (!initHasData) {
			sortInit = true;
		}

		if (sortInit && initHasData) {
			showunit = buildPortraitUnitF();
			sortInit = false;
		}

		//initColumnWidthWithPop(datagrid, 940, 6, 0);
		initGridInfo(obj);

		//初始化图表
		if (!hasinit) {
			getAjaxChartXmlData();
		}
		if (firstInit == true) {
			//var pageSize=getDispalyPageSize(1,1);
			var pageSize = 25;
			var index = 0;
			$(".gt-pagesize-select option").each(function(i) {
				if (this.text == pageSize) {
					index = i;
				}
			})
			firstInit = false;
			$(".gt-pagesize-select").get(0).selectedIndex = index;
		}
		getHeadTitle();

	}

	function getHeadTitle() {
		//$('#headTitle').html('【'+queryDateStart+'】到【'+queryDateEnd+'】【'+apnDomain +'】 时间走势图');
	}
	var charinit = true;
	function getAjaxChartXmlData() {
		var param = buildCondition();
		charinit = false;
		$.ajax( {
			type : "post",
			dataType : 'json',
			url : "apnDistributeTrend_getAjaxChartXmlData.do?1=1",
			data : param,
			success : function(sjson) {
				//alert("sjson:"+sjson);
			//if(sjson!=null){		
			//组装图形数据
			buildChartData(sjson);
			//}
			hasinit = true;
		},
		error : function() {
			//alert('查询数据出错!');
		}
		});
	}

	/*图表是否已经初始化*/
	var chartinit = false;
	/*组装图形数据*/
	function buildChartData(json) {

		var title = queryDateStart + "至" + queryDateEnd + " 流量|用户数走势图";

		var xlabels = [];
		var datas1 = [];
		var datas2 = [];

		if (json != '' && json.length > 0) {
			for ( var i = 0; i < json.length; i++) {
				var record = json[i];
				xlabels[i] = record.fullDate;
				if ('MB' == showunit) {
					datas1[i] = StringToFloat(record.totalFlushMB);
				} else if ('KB' == showunit) {
					datas1[i] = StringToFloat(record.totalFlushKB);
				} else if ('GB' == showunit) {
					datas1[i] = StringToFloat(record.totalFlushGB);
				}
				datas2[i] = StringToFloat(record.intImsis);
			}
		} else {
			var str1 = JSON.stringify(buildEmptyAxisChart());
			if (!chartinit) {
				chartinit = true;
				document.getElementById("chartxmldata").value = str1;
				swfobject.embedSWF("/flash/open-flash-chart-mw.swf?id=flush",
						"imgarea", "100%", "100%", "9.0.0",
						"expressInstall.swf", '', {
							"wmode" : "opaque"
						});
			} else {
				var tmp1 = findSWF("imgarea");
				tmp1.load(str1);
			}
			return;
		}
		var showxlabels = xlabels;
		//格式化X轴时间
		switch (timeLevel) {
		case '1':
			xlabels = formatXDateLables(xlabels, 12, "hour");
			break;
		case '2':
			xlabels = formatXDateLables(xlabels, 15, "day");
			break;
		case '3':
			xlabels = formatXDateLables(xlabels, 12, "week");
			if (json != '' && json.length > 0) {
				title = json[0].fullDate.split('~')[0] + "至"
						+ json[json.length - 1].fullDate.split('~')[1]
						+ " 流量|用户数走势图";
			}
			break;
		case '4':
			xlabels = formatXDateLables(xlabels, 12, "month");
			break;
		}
		var tdatas = [];

		//格式化Y轴数据（流量）

		var obj = new Object();
		obj.datas = datas1;
		obj.unit = showunit;

		var lobj = obj
		var lunit = "流量";
		if (lobj.unit != "") {
			lunit = lunit + "@@" + lobj.unit;
		}
		tdatas[0] = lobj.datas;
		//格式化Y轴数据（用户数）
		var robj = formatNumberByWan(datas2);
		var runit = "用户数";
		if (robj.unit != "") {
			runit = runit + "@@" + robj.unit;
		}
		//alert(robj.datas);
		tdatas[1] = robj.datas;

		//如果有单位  则label与单位间用@@分开
		var labels = [ lunit, runit ];

		tdatas[0] = buildBarChartTip(lobj.datas, showxlabels, lunit);
		tdatas[1] = buildLineChartTip(robj.datas, showxlabels, runit);

		var jsons1 = buildMutileChartData(title, labels, xlabels, tdatas);

		var str1 = JSON.stringify(jsons1);
		//alert("-str1-"+str1);
		if (!chartinit) {
			chartinit = true;
			document.getElementById("chartxmldata").value = str1;
			swfobject.embedSWF("/flash/open-flash-chart-mw.swf?id=flush",
					"imgarea", "100%", "100%", "9.0.0", "expressInstall.swf",
					'', {
						"wmode" : "opaque"
					});
		} else {
			var tmp1 = findSWF("imgarea");
			tmp1.load(str1);
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

	var hasinit = false;

	function query() {
		//重置分页数据
		datagrid.setTotalRowNum(-1);
		var param = buildCondition();

		if ('' == $('#queryDateStart').val()) {
			alert('请输入查询开始时间！');
			return;
		}
		if ('' == $('#queryDateEnd').val()) {
			alert('请输入查询结束时间！');
			return;
		}

		if ('' == apnDomain) {
			alert('请选择APN！');
			return;
		}
		firstInit = true;
		hasinit = false;

		GT.$grid('datagrid').query(param);

		getHeadTitle();

	}
	function buildCondition() {
		timeLevel = $('#timeLevel option:selected').val();
		queryDateStart = $('#queryDateStart').attr('value');
		queryDateEnd = $('#queryDateEnd').attr('value');
		areaType = $("#area_type_select option:selected").val();
		apnDomain = $("#apntype_search").val();
		raitype_trend = $("input:radio[name='dataType']:checked").val()

		var param = {
			timeLevel : timeLevel,
			apnDomain : apnDomain,
			startTime_trend : queryDateStart,
			endTime_trend : queryDateEnd,
			raitype_trend : raitype_trend
		};

		return param;
	}

	function reset() {
		$("#timeLevel").get(0).selectedIndex = 0;
		$('#queryDateStart').attr('value', '');
		$('#queryDateEnd').attr('value', '');
		$("input:radio[name='dataType']").get(0).checked = true;
		$("#area_type_select").attr('value', '')
		$("#apntype_search").attr('value', 'CMWAP');

	}

	function changeTimeLevel() {
		$('#queryDateStart').attr('value', '');
		$('#queryDateEnd').attr('value', '');
	}

	$(document).ready(function() {
		getAllApnType();
		$('#queryDateStart').attr('value', queryDateStart);
		$('#queryDateEnd').attr('value', queryDateEnd);

	});
	//获取数据
	function getAllApnType() {
		$.ajax( {
			type : "post",
			url : "/apnDistributeTrend_getAllApnType.do",
			dataType : 'json',
			success : function(data) {
				var jsn = eval(data);
				var jn = jsn.datalist;
				$("#apntype_search").empty()
				var inhtml = "";
				for ( var i = 0; i < jn.length; i++) {
					inhtml = inhtml + '<option value ="' + jn[i].name + '"  ';
					if (jn[i].name.toUpperCase() == 'CMWAP') {
						inhtml = inhtml + " selected "
					}
					inhtml = inhtml + '>' + jn[i].name + '</option>'
				}
				$(inhtml).appendTo("#apntype_search");//添加下拉框的option
		},
		error : function() {
			alert('获取APN数据失败!');
		}
		});
	}

	//时间选择事件
	function getStartDate() {
		var ts = $("#timeLevel option:selected").val();
		switch (ts) {
		case '1':
			var a = new WdatePicker( {
				maxDate : '#F{$dp.$D(\'queryDateEnd\')}',
				dateFmt : 'yyyy-MM-dd HH:00'
			});
			break;
		case '2':
			new WdatePicker( {
				maxDate : '#F{$dp.$D(\'queryDateEnd\')}',
				dateFmt : 'yyyy-MM-dd'
			});
			break;
		case '3':
			new WdatePicker( {
				maxDate : '#F{$dp.$D(\'queryDateEnd\')}',
				dateFmt : 'yyyy-MM-dd'
			});
			break;
		case '4':
			new WdatePicker( {
				maxDate : '#F{$dp.$D(\'queryDateEnd\')}',
				dateFmt : 'yyyy-MM'
			});
			break;
		}
	}
	function getEndDate() {
		var ts = $("#timeLevel option:selected").val();
		switch (ts) {
		case '1':
			new WdatePicker( {
				minDate : '#F{$dp.$D(\'queryDateStart\')}',
				dateFmt : 'yyyy-MM-dd HH:00:00'
			});
			break;
		case '2':
			new WdatePicker( {
				minDate : '#F{$dp.$D(\'queryDateStart\')}',
				dateFmt : 'yyyy-MM-dd'
			});
			break;
		case '3':
			new WdatePicker( {
				minDate : '#F{$dp.$D(\'queryDateStart\')}',
				dateFmt : 'yyyy-MM-dd'
			});
			break;
		case '4':
			new WdatePicker( {
				minDate : '#F{$dp.$D(\'queryDateStart\')}',
				dateFmt : 'yyyy-MM'
			});
			break;
		}
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
				handler : exportToXls
			} ]
		});
		toolbar.render();
	});
	function exportToXls() {
		//导出
		var fileObj = new Object();
		fileObj.fileName = 'APN-' + apnDomain + '时间走势数据';
		fileObj.fileFormat = 'xls';//文件格式,后台暂支持xls格式
		fileObj.gridObj = datagrid;//当前grid对象
		fileObj.params = {
			timeLevel : timeLevel,
			apnDomain : apnDomain,
			startTime_trend : queryDateStart,
			endTime_trend : queryDateEnd,
			raitype_trend : raitype_trend
		};
		exportFile(fileObj);
	}

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