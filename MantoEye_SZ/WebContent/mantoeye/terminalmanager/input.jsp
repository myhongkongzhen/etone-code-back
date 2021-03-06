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
		<script src="/js/paging.js"></script>
		<script src="/js/nav.js"></script>
		<script language="javascript" src="/js/script.js"></script>
		<script language="javascript" type="text/javascript"
			src="/tools/datepicker/WdatePicker.js"></script>
			<script type="text/javascript" src="/js/common_grid.js"></script>
		<!-- 导入业务选择复选框 -->
		<link rel="stylesheet" href="/mantoeye/dialog/dialog.css" />
		<link rel="stylesheet" href="/tools/jquery/jquery.treeview.css" />
		<script type="text/javascript" src="/mantoeye/dialog/SymbolDialog.js"></script>
		<script type="text/javascript" src="/tools/jquery/jquery.treeview.js"></script>
		<!-- 导入业务选择复选框 结束-->
		<!-- 自动补全JS --> 
		<script type="text/javascript" src="/js/common.js"></script>

		<script type="text/javascript">
	//验证表单信息
		$(document).ready(function(){
			//聚焦第一个输入框
			$("#taskName").focus();
			//为beanForm注册validate函数
			$("#beanForm").validate({
				rules: { 
					"taskName": { 
        				required: true, 
        				remote: "terminaltask_checkUnique.do?oldTaskName="+encodeURIComponent('${oldTaskName}')
    			},
          		"beginTime": "required",
    			"endTime":"required",
    			"business":"required",
    			"terminal":"required"
				},
				messages: {
					"taskName": {
						remote: "任务名已存在"
					}
				},
				submitHandler: function(form) {   
					//alert(form);
					if(!taskSubmit()){
						return false;
					}
					var ml = (parseInt(window.dialogWidth)-250)/2;
					var mt = (parseInt(window.dialogHeight)-55)/2;
					$('#showmsg').css({"margin-top":0,"margin-left":ml,"display":"block"});
					$('#saveBtn').attr('disabled','disabled');	
					$('#cancelBtn').attr('disabled','disabled');	
					form.submit();  
				}   
			});
		});
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
		<form name="beanView" action="/terminaltask_saveTask.do"
			id="beanForm" method="post" >
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
										任务名称:
										<font color="red">*</font>
									</th>
									<td>
										<input type="text" name="taskName" id="taskName"
											style="height: 16px; width: 350px;" value="${taskName}" />
									</td>
								</tr>
								
								<tr>
									<th>
										请选择业务:
										<font color="red">*</font>
									</th>
									<td>
										<input type="text" value="" name="business" id="business" readonly
											onclick="showDialog()" style="width: 350px; height: 16px;" />
										<div style="height: 0px; border: 0px; overflow: hidden"
											id="business_dialog_hidden_id"></div>

										<input id="businessIds" type="hidden" value=""
											name="businessIds" />
									</td>

								</tr>
								<tr>

									<th>
										请选择终端:
										<font color="red">*</font>
									</th>
									
									<td>
										<input type="text" value="" name="terminal" id="terminal" readonly
											onclick="showDialog2()" style="width: 350px; height: 16px;" />
										<div style="height: 0px; border: 0px; overflow: hidden"
											id="terminal_dialog_hidden_id"></div>
										<input id="terminalIds" type="hidden" value=""
											name="terminalIds" />
									</td>

								</tr>
								<tr>
									<th>
										开始时间:
										<font color="red">*</font>
									</th>

									<td>
										<input type="text" class="Wdate" style="width: 352px;"
											readonly
											onclick="getStartDate();"
											name="beginTime" id="beginTime" value="${beginTime}" />
									</td>
								</tr>

								<tr>
									<th>
										结束时间:
										<font color="red">*</font>
									</th>
									<td>
										<input type="text" class="Wdate" style="width: 350px;"
											readonly
											onclick="getEndDate()"
											name="endTime" id="endTime" value="${endTime}" />
									</td>
								</tr>

								<tr>
									<th>
										任务描述:
									</th>
									<td>
										<textarea rows="6" cols="30" name="taskDescribe"
											id="taskDescribe"
											style="border: 1px solid #999999; height: 120px; width: 350px;"></textarea>
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
													onclick="document.getElementById('btn_commit').click();" id="saveBtn" name="saveBtn"><span>保存</span>
												</a>
											</li>
											<li>
												<a href="#"
													onclick="document.getElementById('btn_cancel').click();" id="cancelBtn" name="cancelBtn"><span>关闭</span>
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

<script type="text/javascript">

function taskSubmit(){
	var benginTime=$('#beginTime').val();
	var endTime=$('#endTime').val();
	var bTime=new Date(benginTime.replace("-","/")).valueOf();
	var eTime=new Date(endTime.replace("-","/")).valueOf();
	if((eTime-7*24*60*60*1000)-bTime>0){
		alert('抱歉!任务定制时间跨度必须在一周时间内,请重新调整时间!');
		$('#endTime').focus();
		return false;
	}
	return true;
}
	
function reset(){
	$('#taskName').attr('value','');
	$('#beginTime').attr('value','');
	$('#endTime').attr('value','');
	$('#business').attr('value','');
	$('#businessIds').attr('value','');
	$('#terminal').attr('value','');
	$('#terminalIds').attr('value','');
	$('#taskDescribe').attr('value','');
}
</script>

<!-- 复选框JS -->
<script>

	var dialog = null;
	function showDialog(){
		if(dialog == null){
		  dialog = new SymbolDialog({
	        renderTo : 'business',//点击触发对话框ID
	        renderTo2:'business_dialog_hidden_id',
	        hiddenTo:'businessIds',//页面与对话框参数传递
			id:'dialog',//对话框ID
			showLoading:true,
			typeSearchName:'类型',
			modelSearchName:'业务',
			title:'业务复选对话框',//对话框标题
			url:'terminalDialog_initBussnessDialogData.do'//对话框加载后台数据URL
	      });
		  dialog.init();//初始化页面DOM对象
		  dialog.loadData($('#businessIds').attr('value'));//加载后台数据
		  dialog.display();//显示
		}else{
		  dialog.display();//显示(第N次以后只显示对话框即可,提高效率)
		}
	}
	
	var dialog2 = null;
	function showDialog2(){
		if(dialog2 == null){
		  dialog2 = new SymbolDialog({
	        renderTo : 'terminal',
	        renderTo2:'terminal_dialog_hidden_id',
	        hiddenTo:'terminalIds',
			id:'dialog2',
			showLoading:true,
			typeSearchName:'品牌',
			modelSearchName:'型号',
			title:'终端复选对话框',
			url:'terminalDialog_initTerminalDialogData.do'
	      });
		  dialog2.init();//初始化页面DOM对象
		  dialog2.loadData($('#terminalIds').attr('value'));//加载后台数据
		  dialog2.display();//显示
		}else{
		  dialog2.display();
		}
	}
	function getStartDate(){
		 
			return new WdatePicker({minDate:'%y-%M-{%d-14} %H:00:00',maxDate:'%y-%M-%d {%H-1}:00:00',dateFmt:'yyyy-MM-dd HH:00:00'});		
		 
	}
	function getEndDate(){
	 
			return new WdatePicker({minDate:'%y-%M-{%d-14} %H:00:00',maxDate:'%y-%M-%d {%H-1}:00:00',dateFmt:'yyyy-MM-dd HH:00:00'});
		 
	}	
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