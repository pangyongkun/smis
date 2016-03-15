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
				var url='<%=request.getContextPath()%>/student/course/allTeacherCourse?id='+${sessionScope.student.id};
				getCourse(null,url,"get");
				/*选课*/
				$("#listCourse").on("click","a[name='course']",function(event)
				{
					var cid=$(this).attr("data-cid");
					var tid=$(this).attr("data-tid");
					var cname=$(this).attr("data-cname");
					var tname=$(this).attr("data-tname");
					
					var url="<%=request.getContextPath()%>/student/course/add"
					var param="?cid="+cid+"&sid="+${sessionScope.student.id};
					$("#selectedCourse").append("<li><a name='selectedCourse' data-cid="+cid+" data-cname="+cname+" data-tid="+tid+" data-tname="+tname+">课程号:"+cid+" 课程名:"+cname+" 开课教师:"+tname+"</a></li>").listview('refresh');
					operateCourse(null,(url+param));
					
				});
				
				$("#selectedCourse").on("click","a[name='selectedCourse']",function(event)
				{
					var cid=$(this).attr("data-cid");
					var tid=$(this).attr("data-tid");
					var cname=$(this).attr("data-cname");
					var tname=$(this).attr("data-tname");
					var url='<%=request.getContextPath()%>/student/course/delete'
					var param="?cid="+cid+"&sid="+${sessionScope.student.id};
					$(this).parent("li").remove();
					operateCourse(null,(url+param));
				}).listview('refresh');
				
				/*获取课程请求*/
				function getCourse(DATA, URL, METHOD) {
					if (METHOD == "get") {
						$.ajax({
							type : "get",
							url : URL,
							dataType : "json",
							data : $.toJSON(DATA),
							contentType : "application/json",
							processData : false,
							cache : true,
							success : function(data) {							
								var list = eval(data);
								for (var i = 0; i <=list.length; i++) {
									var obj=list[i];
									
									$("#listCourse").append(
											"<li><a  name='course' data-tid='"+obj.teacher.id+"' data-cid='"+obj.course.id+"' data-tname='"+obj.teacher.name+"' data-cname='"+obj.course.name+"' >" 
													+ " 教师名:" + obj.teacher.name +"课程名:"+ obj.course.name+ "</a></li>")
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
			
			function operateCourse(DATA, URL)
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
								alert("修改成功!");
							},
							error : function(XMLHttpRequest, textStatus, errorThrown) {
								alert("修改失败!");
							}
						});
			}
				
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
					可选课程
				</li>
				
			</ul>
			<ul id="selectedCourse" data-role="listview" data-inset="true"
				data-divider-theme="a">
				<li data-role="list-divider">${ sessionScope.student.name }
					已选中,点击可退选
				</li>
			
			</ul>			
		</div>
		<div data-role="footer"></div>
	</div>
	
</body>

</html>
