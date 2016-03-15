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
	
		</script>
	</head>
	<body>
		<div data-role="page">
			<div data-role="header"></div>
			<div data-role="header">
				<h1 style="color: #3FA9FB">学生信息管理系统</h1>
			</div >
			<div data-role="content">

				<ul data-role="listview" data-inset="true" data-divider-theme="a">
					<li data-role="list-divider">
					${ sessionScope.teacher.teacherID }	${ sessionScope.teacher.name} 你好
					</li>
					<li>
						<a data-ajax="false" href="<%=request.getContextPath()%>/teacher/course/find?id=${sessionScope.teacher.id}">已开课程</a>
					</li>
					<li>
						<a data-ajax="false" href="<%=request.getContextPath()%>/teacher/password/modify">修改密码</a>
					</li>
					<li>
						<a data-ajax="false" href="<%=request.getContextPath()%>/teacher/studentEntering">学生信息录入</a>
					</li>
					
									
				</ul>
				
				
			</div>
			<div data-role="footer"></div>
			
		</div>
	</body>
</html>