<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<%@ page contentType="text/html;charset=utf-8"%>
	<%@ include file="/include/session.jsp"%>
	<%@ include file="/include/setcache.jsp"%>
	<head>
		<title>编辑保障区域</title>
		<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
		<link type="text/css" rel="stylesheet"
			href="/skin/Default/css/modedialog.css" />
		<script src="/js/paging.js"></script>
		<script src="/js/nav.js"></script>
		<script language="javascript" src="/js/script.js"></script>
		<script language="javascript" type="text/javascript"
			src="/tools/datepicker/WdatePicker.js"></script>
		<script type="text/javascript">
	$(document).ready(function(){
			//聚焦第一个输入框
			$("#nmMsisdn").focus();
			var obj = window.dialogArguments;
			$('#vcAreaName').attr('value',obj.vcAreaName);
			$('#vcCgiName').attr('value',obj.vcCgiName);	
			$('#vcCgiChName').attr('value',obj.vcCgiName);
			$('#id').attr('value',obj.id);	
			//为beanForm注册validate函数
			$("#beanForm").validate({
				rules : {
					"vcAreaName" :"required",
					"vcCgiName" :"required"
				},messages: {
				} 
			});
		});
</script>
		<base target="_self" />
	</head>
	<body style="overflow-x: hidden">
		<form name="beanView" action="/areaMapCell_updateAreaMapCell.do" id="beanForm"
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
										编辑保障区域
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
										保障区域：
										<font color="red">*</font>
									</th>
									<td>
										<input type="text" name="vcAreaName"
											style="width: 293px;" id="vcAreaName"/>
										<input type="hidden" name="id" id="id" />									
									</td>
								</tr>

							
								<tr>
									<th>
										小区名：
										<font color="red">*</font>
									</th>
									<td>
										<input type="text"  style="width: 293px;"
											name="vcCgiName" id="vcCgiName"/>
										<input type="hidden" name="vcCgiChName" id="vcCgiChName" />
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
													onclick="document.getElementById('btn_commit').click();"><span>保存</span>
												</a>
											</li>
											<li>
												<a href="#"
													onclick="document.getElementById('btn_cancel').click();"><span>关闭</span>
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
