<!DOCTYPE  HTML>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
	<head>
		<title>学生信息管理系统</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=divice-width,initial-scale=1" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.mobile-1.4.5.css" />
		<script src="<%=request.getContextPath()%>/resources/js/jquery-1.11.3.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/jquery.mobile-1.4.5.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/jquery.json-2.3.js"></script>
		<script type="text/javascript">
		$(function() {
				/* 上传提交数据  */
				$("#sl").click(function(event) {
					$("#context").html("");
					var obj = {
						studentID : $("#username").val(),
						password : $("#password").val()
					};
					var jsonStr = $.toJSON(obj);
					$.ajax({
						type : "post",
						url : "<%=request.getContextPath()%>/student/load",
						dataType : "json",
						data : jsonStr,
						contentType : "application/json",
						processData : false,
						cache: true,
						success : function(data) {
							var url= '<%=request.getContextPath()%>/student/display'; 
							window.location.href = url;
						},
						error : function(XMLHttpRequest, textStatus,
								errorThrown) {
							$("#context").html("登录失败!请检查密码或用户名是否正确");
						}
					});
					event.preventDefault();
				});
				$("#tl").click(function(event) {
					$("#context").html("");
					var obj = {
						teacherID : $("#username").val(),
						password : $("#password").val()
					};
					var jsonStr = $.toJSON(obj);
					$.ajax({
						type : "post",
						url : "<%=request.getContextPath()%>/teacher/load",
						dataType : "json",
						data : jsonStr,
						contentType : "application/json",
						processData : false,
						cache: true,
						success : function(data) {
							var url= '<%=request.getContextPath()%>/teacher/display'; 
							window.location.href = url;
						},
						error : function(XMLHttpRequest, textStatus,
								errorThrown) {
							$("#context").html("登录失败!请检查密码或用户名是否正确");
						}
					});
					event.preventDefault();
				});
	});
</script>
	</head>
	<body>
		<div data-role="page" >	
			<div data-role="header"></div>			
			<div data-role="header">
				<h1 style="color: #3FA9FB">学生信息管理系统</h1>
			</div >
			<div data-role="content" id="index">
				<div id="load">
				<ul data-role="listview">
				<li><span id="context"></span></li>
					<li>
						<input  id="username" placeholder="学号或工号" value="" type="text">
					</li>
					<li></li>
					<li>
						<input id="password" placeholder="密码" value="" type="password">
					</li>
					<li>
						<div data-role="navbar">
							<ul>
							
								<li>
									<a id="tl" style="text-decoration:none;text-align:center" href="#" data-role="button">教师登录</a>
								</li>
								<li>
									<a id="sl" style="text-decoration:none;text-align:center" href="#" data-role="button">学生登录</a>
								</li>
								
							</ul>
						</div>
						<a id="register" style="text-decoration:none;text-align:center" href="<%=request.getContextPath()%>/register" data-transition="slide" data-role="button">注册</a>
					</li>
					
					
				</ul>
			</div>
			</div>
			<div data-role="footer">				
			</div>
		</div>
	</body>
</html>