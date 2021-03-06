<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<%@ page contentType="text/html;charset=utf-8"%>
	<%@ include file="/include/session.jsp"%>
	<%@ include file="/include/setcache.jsp"%>
	<head>
		<title>添加任务</title>
		<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
		<link rel="stylesheet" href="/mantoeye/dialog/dialog.css" />
		<link type="text/css" rel="stylesheet"
			href="/skin/Default/css/modedialog.css" />
		<script src="/js/paging.js"></script>
		<script src="/js/nav.js"></script>
		<script language="javascript" src="/js/script.js"></script>
		<script language="javascript" type="text/javascript"
			src="/tools/datepicker/WdatePicker.js"></script>
		<script type="text/javascript">
	//验证表单信息
	$(document).ready( function() {
		//聚焦第一个输入框
			$("#entity.vcTaskName").focus();
			//为beanForm注册validate函数
			$("#beanForm").validate({
				rules : {
					"entity.vcTaskName" :"required",
					"entity.dtStartTime" :"required",
					"entity.dtEndTime" :"required",
					"entity.bitTaskActiveFlag" :"required",
					"vcMsisdns": {
						required: true,
						mobil:true,
						maxlength:239
    				}
				},messages: {
					"vcMsisdns": {
					maxlength: "号码最多为20个"
					}
				},
				submitHandler: function(form) { 
					//alert(form.action);  
					var ml = (parseInt(window.dialogWidth)-250)/2;
					var mt = (parseInt(window.dialogHeight)-55)/2;
					$('#showmsg').css({"margin-top":0,"margin-left":ml,"display":"block"});
					$('#saveBtn').attr('disabled','disabled');	
					$('#cancelBtn').attr('disabled','disabled');	
					//alert($('#beanForm').attr('action'));
					form.submit();  
				}   
			});
		});
</script>
		<base target="_self" />
	</head>
	<body style="overflow-x: hidden">
		<form name="beanView" action="/dataCatch_saveTask.do?permId=${permId }" id="beanForm"
			method="post">
			<table id="maincontent" cellspacing="0" cellpadding="0" border="0"
				width="100%">
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
						<div class="inputmain">
							<!----------- 表单信息 ------------------>
							<table width="9%" cellpadding="0" cellspacing="1"
								class="formitem">
								<tr>
									<th>
										任务名称：
										<font color="red">*</font>
									</th>
									<td>
										<input type="text" name="entity.vcTaskName"
											style="width: 290px;" id="entity.vcTaskName"
											value="${entity.vcTaskName}" />
										<input type="hidden" name="entity.intTaskDelong"
											id="entity.intTaskDelong" value="1" />
										<input type="hidden" name="taskType" id="taskType" value="" />
									</td>
								</tr>

								<tr>
									<th>
										提取号码：
										<font color="red">*</font>
									</th>
									<td>
										<textarea name="vcMsisdns" id="vcMsisdns" rows="6"
											class="replyTextClass" style="overflow-y: auto;width: 290px;"></textarea>
									</td>
								</tr>
								<tr>
									<th></th>
									<td>
										<span><font color="red">注：</font><font color="blue">号码可输入多个,并且每个之间以逗号分隔符隔开。</font>
										</span>
									</td>
								</tr>
								<tr>
									<th>
										开始时间：
										<font color="red">*</font>
									</th>
									<td>
										<input type="text" class="Wdate" style="width: 293px;"
											readonly
											onclick="showStartForm();"
											name="entity.dtStartTime" id="entity.dtStartTime"
											value="${entity.dtStartTime}" />
									</td>
								</tr>
								<tr>
									<th>
										结束时间：
										<font color="red">*</font>
									</th>
									<td>
										<input type="text" class="Wdate" style="width: 293px;"
											readonly
											onclick="showEndForm()"
											name="entity.dtEndTime" id="entity.dtEndTime"
											value="${entity.dtEndTime}" />
									</td>
								</tr>
								<tr>
									<th>
										是否激活：
										<font color="red">*</font>
									</th>
									<td>
										<select name="entity.bitTaskActiveFlag"
											id="entity.bitTaskActiveFlag" style="width: 297px;">
											<option value="true">
												是
											</option>
											<option value="false">
												否
											</option>
										</select>
									</td>
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
			<div class="dialog_msg_class" style="margin-top:120px;margin-left:70px;" id="showmsg" name="showmsg" style="display:none">
										<img src="/skin/Default/images/icon/16/loading.gif">
										</img>操作进行中,请稍后...</div>
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
													onclick="document.getElementById('btn_commit').click()" 												
													id="saveBtn" name="saveBtn"><span>保存</span>
												</a>
											</li>
											<li>
												<a href="#"
													onclick="document.getElementById('btn_cancel').click();"  
													id="cancelBtn" name="cancelBtn"><span>关闭</span>
												</a>
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
/**
脚本不出错

$(document).ready(function(){
	window.onerror = killErrors;
})
function killErrors() {
	return true;
}*/

var taskType = 0;
$(document).ready(function(){
	//setmsg();
	taskType = window.dialogArguments;
	$('#taskType').attr('value',taskType);
	if(taskType==3){//如果获取的是历史解析数据
		$('#beanForm').attr('action','/dataCatch_saveHistoryParseTask.do?permId=${permId }');		
	}
	
});
function showStartForm(){
	if(taskType==1){//历史原始记录提取
		return new WdatePicker({minDate:'%y-%M-%d {%H-48}:00:00',maxDate:'#F{$dp.$D(\'entity.dtEndTime\')||\'%y-%M-%d %H:%m:00\'}',dateFmt:'yyyy-MM-dd HH:mm:00'});
	}else if(taskType==2){//实时原始记录提取
		return new WdatePicker({minDate:'%y-%M-%d %H:%m:00',maxDate:'#F{$dp.$D(\'entity.dtEndTime\')}',dateFmt:'yyyy-MM-dd HH:mm:00'});
	}else{//如果获取的是历史解析数据
		var eed = document.getElementById('entity.dtEndTime').value;
		if(eed==""){
			return new WdatePicker({minDate:'%y-%M-{%d-30} 00:00:00',maxDate:'%y-%M-%d %H:%m:00',dateFmt:'yyyy-MM-dd HH:mm:00'});
		}else{
			return  new WdatePicker({minDate:'#F{$dp.$D(\'entity.dtEndTime\',{d:-7})||\'%y-%M-{%d-30} 00:00:00\'}',maxDate:'#F{$dp.$D(\'entity.dtEndTime\')||\'%y-%M-%d %H:%m:00\'}',dateFmt:'yyyy-MM-dd HH:mm:00'});
		}
	}
}
function showEndForm(){
	if(taskType==1){//历史原始记录提取
		return new WdatePicker({minDate:'#F{$dp.$D(\'entity.dtStartTime\')||\'%y-%M-%d {%H-48}:00:00\'}',maxDate:'%y-%M-%d %H:%m:00',dateFmt:'yyyy-MM-dd HH:mm:00'});
	}else if(taskType==2){//实时原始记录提取
		return new WdatePicker({minDate:'#F{$dp.$D(\'entity.dtStartTime\')||\'%y-%M-%d %H:%m:00\'}',dateFmt:'yyyy-MM-dd HH:mm:00'});
	}else{//如果获取的是历史解析数据
		var ssd = document.getElementById('entity.dtStartTime').value;
		if(ssd==""){
			return new WdatePicker({minDate:'%y-%M-{%d-30} 00:00:00',maxDate:'%y-%M-%d %H:%m:00',dateFmt:'yyyy-MM-dd HH:mm:00'});			
		}else{
			return new WdatePicker({minDate:'#F{$dp.$D(\'entity.dtStartTime\')||\'%y-%M-{%d-30} 00:00:00\'}',maxDate:'#F{$dp.$D(\'entity.dtStartTime\',{d:7})||\'%y-%M-%d %H:%m:00\'}',dateFmt:'yyyy-MM-dd HH:mm:00'});
		}
	}
}
</script>