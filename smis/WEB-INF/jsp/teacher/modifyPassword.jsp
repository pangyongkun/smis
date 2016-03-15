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
			$(function()
			{
				$("#submit").click(function(){
					$("#p1").html("");
					$("#p2").html("");
					var password1=$("#password1").val();
					var password=${sessionScope.teacher.password};
					var password2=$("#password2").val();
					if(password1!=password)
					{
						$("#p1").html("原密码不正确");
						return;
					}
					if(password2==""||password2==null)
					{
						$("#p2").html("请输入新密码");
						return;
					}
					if(password2==password)
					{
						$("#p2").html("新密码不能与原密码相同");
						return;
					};
					var obj={
						password: password2,
						id: ${sessionScope.teacher.id}
					};
					var url="<%=request.getContextPath()%>/teacher/password/modify"
					
					modifyPassword(obj, url);
				});
			});				
				
			
			function modifyPassword(DATA, URL)
			{
				$.ajax({
							type : "post",
							url : URL,
							dataType : "json",
							data : $.toJSON(DATA),
							contentType : "application/json",
							processData : false,
							cache : true,
							success : function(data) {							
								$("#success").html("成功");
							},
							error : function(XMLHttpRequest, textStatus, errorThrown) {
								$("#success").html("失败");
							}
						});
			}
				
		</script>
</head>
<body>
	<div data-role="page">
		<div data-role="header"></div>
		<div data-role="header">
			<a href="<%=request.getContextPath()%>/teacher/display?id=${ sessionScope.teacher.id }&teacherID=${ sessionScope.teacher.teacherID }" data-icon="carat-l">返回</a>
			<h1 style="color: #3FA9FB">学生信息管理系统</h1>
		</div>
		<div data-role="content">
			<div id="#prompt"></div>
			<form>
			<ul id="listCourse" data-role="listview" data-inset="true"
				data-divider-theme="a">
				<li data-role="list-divider">${ sessionScope.teacher.name }
					修改密码<span style="color:red" id="success"></span>
				</li>
				<li>请输入原密码</li>				
				<li><input type="password" id="password1"></li>
				<li id="p1" style="color:red;"></li>
				<li>请输入新密码</li>
				<li><input type="password" id="password2"></li>
				<li id="p2" style="color:red;"></li>
				<li>
					<fieldset class="ui-grid-a">
						<div class="ui-block-a">
							<input id="submit" data-theme="a" type="button" value="修改">
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
