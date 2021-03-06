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
			$(function(){
				var url= "<%=request.getContextPath()%>/student/course/allcourse";
				var param = "?id=" + ${sessionScope.student.id};
				URL = url + param;
				getCourse(null, URL, "post");
				event.preventDefault();

				
				/*加载课程*/
				function getCourse(DATA, URL, METHOD) {
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
							
								var list = eval(data);
								for (var i = 0; i < list.length; i++) {
									$("#listCourse").append(
											"<li name='course'>" + "课程编号:" + list[i].id
													+ " 课程名:" + list[i].name + "</li>")
											.listview('refresh');
								};
							},
							error : function(XMLHttpRequest, textStatus, errorThrown) {
								$("#prompt").html("课程加载失败!");
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
			<a href="<%=request.getContextPath()%>/student/display?id=${ sessionScope.student.id }&studentID=${ sessionScope.student.studentID }" data-icon="carat-l">返回</a>
			<h1 style="color: #3FA9FB">学生信息管理系统</h1>
		</div>
		<div data-role="content">
			<div id="#prompt"></div>
			<ul id="listCourse" data-role="listview" data-inset="true"
				data-divider-theme="a">
				<li data-role="list-divider">${ sessionScope.student.name }
					已选课程</li>


			</ul>
		</div>
		<div data-role="footer"></div>
	</div>
	
</body>

</html>
