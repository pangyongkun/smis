<!DOCTYPE  HTML>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<title>学生信息管理系统</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width,initial-scale=1" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jquery.mobile-1.4.5.css" />
<script src="<%=request.getContextPath()%>/resources/js/jquery-1.8.3.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/jquery.mobile-1.4.5.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/jquery.json-2.3.js"></script>
<script type="text/javascript">
	$(function() {
		/*判断是否被选中*/
		$("#reset").click(function()
		{
			$("#t").attr("checked", false).checkboxradio("refresh");
			$("#s").attr("checked", false).checkboxradio("refresh");	
		});
		$("#s").click(function() {
			$("#t").attr("checked", false).checkboxradio("refresh");
			$("#s").attr("checked", "checked").checkboxradio("refresh");			
		});
		$("#t").click(function() {
			$("#s").attr("checked", false).checkboxradio("refresh");
			$("#t").attr("checked", "checked").checkboxradio("refresh");
			
		});
		
		/*实现注册*/
		$("#register").bind("click", function(event) {
			var obj=getInfo();
			if(obj=="error")
			{
				$("#p").listview("refresh");
				return;
			}
			if($("#s").is(":checked")&&!$("#t").is(":checked"))
			{
				var sURL="<%=request.getContextPath()%>/student/register";
				register(obj,sURL,"post");
			}else if($("#t").is(":checked")&&!$("#s").is(":checked"))
			{
				var tURL="<%=request.getContextPath()%>/teacher/register";
				register(obj, tURL, "post");
			} else return;
			event.stopPropagation();
			event.preventDefault();
		});

		/*获取注册内容*/
		function getInfo() {
			var username = $("#username").val();
			var password = $("#password").val();
			var _password = $("#_password").val();
			var name = $("#name").val();
			//校验数据合法性
			if(username=="")
			{
				$("#prompt").html("用户名不能为空!");
				return "error";
			}
			if(password==""||_password=="")
			{
				$("#prompt").html("用户名不能为空!");
				return "error";
			}
			if(!(password==_password))
			{
				$("#prompt").html("两次密码不匹配!");
				return "error";
			}
			if(!$("#s").is(":checked") && !$("#t").is(":checked"))
			{
				$("#prompt").html("请选择注册类型!");
				return "error";
			}
			
			//获取数据
			if ($("#s").is(":checked") && !$("#t").is(":checked")) {
				var obj = {
					studentID : username,
					password : password,
					name : name
				};
				return obj;
			} else if ($("#t").is(":checked") && !$("#s").is(":checked")) {
				var obj = {
					teacherID : username,
					password : password,
					name : name
				};
				return obj;
			} else
				return;
		}
		/*注册*/
		function register(DATA, URL, METHOD) {
			if (METHOD == "post") {
				
				$.ajax({
					type : "post",
					url : URL,
					dataType : "json",
					data : $.toJSON(DATA),
					contentType : "application/json",
					processData : false,
					cache : true,
					success : function(data) {
						$("#prompt").html("你已注册成功!请登录");
						alert(data.type);
						datas=data;
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						$("#prompt").html("学好或工号已被注册!重新注册!");
					}
				});
				
			}
		}

	});
</script>
</head>
<body>
	<div data-role="page">
		<div data-role="header"></div>
		<div data-role="header">
			<a href="<%=request.getContextPath()%>/index" data-icon="arrow-l"
				data-them="a" data-transition="flip">登录</a>
			<h1 style='color: #3FA9FB'>学生信息管理系统</h1>
		</div>
		<div data-role="content">
		<ul id="p" data-role="listview">
			<li id="prompt"></li>
		</ul>
		</div>
		<div data-role="content">

			<form>
				<ul data-role="listview">
					<li></li>
					<li><input id="username" placeholder="请输入学号或工号" value=""
						type="text"></li>
					<li></li>
					<li><input id="password" placeholder="请输入密码" value=""
						type="password"></li>
					<li><input id="_password" placeholder="输入确认密码" value=""
						type="password"></li>
					<li><input id="name" placeholder="请输名字" value=""></li>
					<li>
						<fieldset data-role="controlgroup" data-type="horizontal">
							<label for="t"> 教师 </label> <input type="radio" name="t" id="t"
								value="teacher" /> <label for="s">学生 </label> <input
								type="radio" name="s" id="s" value="student" />
						</fieldset>
					</li>
					<li>
						<fieldset class="ui-grid-a">
							<div class="ui-block-a">
								<input id="register" data-theme="a" type="button" value="注册">
							</div>
							<div class="ui-block-b">
								<input id="reset" data-theme="a" type="reset" value="重置">
							</div>
						</fieldset>
					</li>
				</ul>
			</form>
		</div>
		<div data-role="footer"></div>
	</div>
</body>
</html>