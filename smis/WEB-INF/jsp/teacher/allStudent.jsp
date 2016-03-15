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
			
				/*打分*/
				$("#listStudent").on("click","#givemark",function(){
					var score=$("#score").val();
					var cid=$(this).attr("data-cid");
					var sid=$(this).attr("data-sid");
					var url='<%=request.getContextPath()%>/teacher/give/score?cid='+cid+'&sid='+sid+'&score='+score;
					$.ajax({
							type : "post",
							url : url,
							dataType : "json",
							contentType : "application/json",
							processData : false,
							cache : true,
							success : function(data) {
								//$("#listStudent li").detach("#input,#score,#givemark").listview();
								location.reload();							
							},
							error : function(XMLHttpRequest, textStatus, errorThrown) {
								alert("失败");
							}
						});
					
				});
				
				/*添加打分功能*/
				$("#listStudent").on("click","a[name='student']",function()
				{
					var cid=$(this).attr("data-cid");
					var sid=$(this).attr("data-sid");
					$(this).parent("li").append("<id='input' fieldset class='ui-grid-a'><input id='score' type='text' /><input data-theme='a' type='button' id='givemark' value='评分' data-cid='"+cid+"' data-sid='"+sid+"' /></fieldset>");
				}).listview();
				
				/*获取所有学生及其分数*/
				var url='<%=request.getContextPath()%>/teacher/course/allStudent?cid=<%= request.getParameter("cid") %>&tid=${ sessionScope.teacher.id}';
				$.ajax({
							type : "post",
							url : url,
							dataType : "json",
							contentType : "application/json",
							processData : false,
							cache : true,
							success : function(data) {
								var list =eval(data);
								$.each(list,function(i,item)
								{
									$("#listStudent").append("<li><a name='student' data-cid='"+item.id+"' data-sid='"+item.student.id+"'>姓名:"+item.student.name+" 成绩:"+item.score+"</a></li>").listview("refresh");
								});				
								
							},
							error : function(XMLHttpRequest, textStatus, errorThrown) {
								alert("加载失败!");
							}
						});
			});
		</script>
	</head>
	<body>
		<div data-role="page">
			<div data-role="header"></div>
			<div data-role="header">
				<a data-ajax="false" href="<%=request.getContextPath()%>/teacher/course/find?id=${sessionScope.teacher.id}" data-icon="carat-l" data-transition="flip">返回</a>
				<h1 style="color: #3FA9FB">学生信息管理系统</h1>
			</div >
			<div data-role="content">

				<ul id="listStudent" data-role="listview" data-inset="true" data-divider-theme="a">
					<li data-role="list-divider">
					${ sessionScope.teacher.teacherID }	${ sessionScope.teacher.name} 
					</li>
					
									
				</ul>
				
				
			</div>
			<div data-role="footer"></div>
			
		</div>
	</body>
</html>