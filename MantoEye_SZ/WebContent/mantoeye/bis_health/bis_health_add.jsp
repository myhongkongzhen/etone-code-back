<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<%@ page contentType="text/html;charset=utf-8"%>
	<%@ include file="/include/session.jsp"%>
	<%@ include file="/include/setcache.jsp"%>
	<head>
		<title>添加任务</title>
		<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
		<link type="text/css" rel="stylesheet"
			href="/skin/Default/css/modedialog.css" />
		<script src="/js/paging.js">
</script>
		<script src="/js/nav.js">
</script>
		<script language="javascript" src="/js/script.js">
</script>
		<script language="javascript" type="text/javascript"
			src="/tools/datepicker/WdatePicker.js">
</script>
		<script type="text/javascript" src="/js/common_grid.js">
</script>
		<!-- 导入业务选择复选框 -->
		<link rel="stylesheet" href="/mantoeye/dialog/dialog.css" />
		<link rel="stylesheet" href="/tools/jquery/jquery.treeview.css" />
		<script type="text/javascript" src="/mantoeye/dialog/SymbolDialog.js">
</script>
		<script type="text/javascript" src="/tools/jquery/jquery.treeview.js">
</script>

		<!-- 自动补全JS -->
		<script type="text/javascript" src="/js/common.js">
</script>
		<script type="text/javascript">
//验证表单信息
	jQuery.validator.addMethod("checkBis", function(element) {
		var value = $('#business').attr('value');
		if (value.indexOf(",") == -1)
			return true;
		else
			return false;
	}, "只能选择一个业务");
$(document).ready(function() {
	//聚焦第一个输入框
		$("#entity.vcTaskName").focus();

		//为beanForm注册validate函数
		$("#beanForm").validate( {
			rules : {
				"entity.vcTaskName" : {
					required : true,
				
					remote : {
						url : "bishealth_checkUnique.do",
						type : "post",
						data : {
							"vcTaskName" : function() {
								return $('#vcTaskName').attr('value')
							}
						}
					}
				},
				"entity.dtStartTime" : "required",
				"entity.dtEndTime" : "required",
				"entity.bitTaskActiveFlag" : "required",
				"entity.intActiveDay" : {
					required : true,
					digits : true
				},
			"business" : {
					required : true
				}
			},
			messages : {
				"entity.vcTaskName" : {
					remote : "任务名称已存在"
				}
			},
			submitHandler : function(form) {
				//alert(form);
			var ml = (parseInt(window.dialogWidth) - 250) / 2;
			var mt = (parseInt(window.dialogHeight) - 55) / 2;
			$('#showmsg').css( {
				"margin-top" : 0,
				"margin-left" : ml,
				"display" : "block"
			});
			$('#saveBtn').attr('disabled', 'disabled');
			$('#cancelBtn').attr('disabled', 'disabled');
			form.submit();
		}
		});
	});

function checkBusiness(num) {
	if (num.indexOf(num) == -1)
		return true;
	else
		return false;
}
</script>
		<style>
#content_table_id  th {
	height: 22px;
	padding-left: 5px;
	width: 24%;
	text-align: right;
	font: normal 13px arial, tahoma, helvetica, sans-serif;
}
</style>
		<base target="_self" />
	</head>
	<body style="overflow-x: hidden">
		<form name="beanView" action="/bishealth_saveTask.do"
			id="beanForm" method="post">
			<table id="maincontent" cellspacing="0" cellpadding="0" border="0"
				width="100%" height="100%">
				<tr>
					<td>
						<table cellspacing="0" cellpadding="0" border="0" width="100%"
							class="header">
							<tr>
								<td width="100%" height="24px">
									<div class="title">
										添加任务
									</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td width="100%">
						<div>
							<!----------- 表单信息 ------------------>
							<table width="100%" cellpadding="0" cellspacing="1"
								id="content_table_id"
								style="width: 100%; height: auto; margin: 0px; padding: 0px;">
								<tr>
									<th>
										任务名称：
										<font color="red">*</font>
									</th>
									<td>
										<input type="text" name="entity.vcTaskName"
											style="width: 350px;" id="vcTaskName" />

									</td>
								</tr>
								<tr>
									<th>
										任务类型：
										<font color="red">*</font>
									</th>
									<td>
										<select name="entity.intTaskType" id="intTaskType"
											style="width: 356px;">
											<option value="1">
												GSM健康度
											</option>
											<option value="2">
												TD健康度
											</option>
									</td>
								</tr>
								</tr>

								<tr>
									<th>
										开始时间：
										<font color="red">*</font>
									</th>
									<td>
										<input type="text" name="entity.dtStartTime"
											style="width: 350px;" id="dtStartTime" readonly
											onclick="showStartForm()" />
									</td>
								</tr>
								<tr>
									<th>
										结束时间：
										<font color="red">*</font>
									</th>
									<td>
										<input type="text" name="entity.dtEndTime"
											style="width: 350px;" id="dtEndTime" readonly
											onclick="showEndForm()" />
									</td>
								</tr>
							<!-- 	<tr>
									<th>
										活跃天数：
										<font color="red">*</font>
									</th>
									<td>
										<input type="text" name="entity.intActiveDay"
											style="width: 350px;" id="intActiveDay" />

									</td>
								</tr> -->
								<tr>
									<th>
										是否激活：
										<font color="red">*</font>
									</th>
									<td>
										<select name="entity.bitTaskActiveFlag" id="bitTaskActiveFlag"
											style="width: 356px;">
											<option value="true">
												是
											</option>
											<option value="false">
												否
											</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>
										指定业务：
										<font color="red">*</font>
									</th>
									<td>
										<input type="text" id="business" name="business" readonly
											onclick="showBusinessDialog()"
											style="width: 350px; height: 16px;" />
										<div style="height: 0px; border: 0px; overflow: hidden"
											id="business_dialog_hidden_id"></div>
										<input id="businessIds" type="hidden" name="businessIds" />
									</td>
									<input type="hidden" name='taskId' id="taskId" />
								</tr>
							</table>
						</div>
					</td>

					<div style="display: none;">
						<s:submit id="btn_commit"></s:submit>
						<button id="btn_cancel" onclick="window.close()"></button>
					</div>
				</tr>
			</table>
			<div class="dialog_msg_class"
				style="margin-top: 120px; margin-left: 70px;" id="showmsg"
				name="showmsg" style="display:none">
				<img src="/skin/Default/images/icon/16/loading.gif">
				</img>
				操作进行中,请稍后...
			</div>
			<table width="66%" cellpadding="0" cellspacing="0"
				class="formitem_pagestyle" style="padding-top: 40px;">
				<tr>
					<td colspan="2">
						<table align="right">
							<tr>
								<td align="center">
									<div id="mainbtn">
										<ul>
											<li>
												<a href="#"
													onclick="document.getElementById('btn_commit').click();"
													id="saveBtn" name="saveBtn"><span>保存</span> </a>
											</li>
											<li>
												<a href="#"
													onclick="document.getElementById('btn_cancel').click();"
													id="cancelBtn" name="cancelBtn"><span>关闭</span> </a>
											</li>
										</ul>
									</div>
								</td>
								<td width="10px"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
<script>

//本周第一天
function showWeekFirstDay() {
	var Nowdate=new Date();
	var WeekFirstDay=new Date(Nowdate-(Nowdate.getDay())*86400000); return WeekFirstDay; 
	}
//上周最后一天 
function showPreviousLastWeekDay() { 
	var WeekFirstDay=showWeekFirstDay()
	return new Date(WeekFirstDay-86400000)
	}






function showStartForm() {
	var eed = document.getElementById('entity.dtEndTime').value;
	var LDate=showPreviousLastWeekDay().getDate();
	var LMonth=showPreviousLastWeekDay().getMonth()+1;
	var LYear=showPreviousLastWeekDay().getYear();
	if (eed == "") {
		return new WdatePicker( {
			maxDate : LYear+'-'+LMonth+'-'+LDate,
			dateFmt : 'yyyy-MM-dd'
		});
	} else {
		return new WdatePicker(
				{
					maxDate : '#F{$dp.$D(\'entity.dtEndTime\')}',
					dateFmt : 'yyyy-MM-dd'
				});
	}
}


function showEndForm() {
	var ssd = document.getElementById('entity.dtStartTime').value;
		var LDate=showPreviousLastWeekDay().getDate();
			var LMonth=showPreviousLastWeekDay().getMonth()+1;
	var LYear=showPreviousLastWeekDay().getYear();
	if (ssd == "") {
		return new WdatePicker( {
			maxDate : LYear+'-'+LMonth+'-'+LDate,
			dateFmt : 'yyyy-MM-dd'
		});
	} else {
		return new WdatePicker(
				{
					minDate : '#F{$dp.$D(\'entity.dtStartTime\')}',
						maxDate : LYear+'-'+LMonth+'-'+LDate,
					dateFmt : 'yyyy-MM-dd'
				});
	}
}

var businessDialog = null;
function showBusinessDialog() {
	if (businessDialog == null) {
		businessDialog = new SymbolDialog( {
			count:1,
			renderTo : 'business',//点击触发对话框ID
			renderTo2 : 'business_dialog_hidden_id',
			hiddenTo : 'businessIds',//页面与对话框参数传递
			id : 'businessDialog',//对话框ID
			hideSelItem : {//解决IE6中select元素掩盖弹出框情况,此处为select元素ID
				select1 : 'bitTaskActiveFlag'
			},
			showLoading : true,
			typeSearchName : '类型',
			modelSearchName : '业务',
			title : '业务复选对话框',//对话框标题
			url : 'businessDistributeV2_initBussnessDialogData.do'//对话框加载后台数据URL
		});
		businessDialog.init();//初始化页面DOM对象
		businessDialog.loadData($('#businessIds').attr('value'));//加载后台数据并
		businessDialog.display();//显示
	} else {
		businessDialog.display();//显示(第N次以后只显示对话框即可,提高效率)
	}
	//隐藏select
	$('#bitTaskActiveFlag').css( {
		'display' : 'none'
	});
	
}

/**
 脚本不出错
 */
$(document).ready(function() {
	window.onerror = killErrors;
})
function killErrors() {
	return true;
}
</script>