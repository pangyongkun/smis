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
			function uploadFile(){ 
				$("#submit").click(function()
				{
					alert("hello");
					$.upload({  
		                url:"<%=request.getContextPath()%>/teacher/studentEntering",            //需要链接到服务器地址  
		                secureuri:true,  
		                fileElementId:'file',                        //文件选择框的id属性  
		                success: function(data, status){     
		                     alert("成功");
		                },
		                error: function (data, status, e){  
		                     alert("失败"); 
		                }  
	            	});  
				}) 
	        
   			 }  
		</script>
	</head>
	<body>
		<div data-role="page">
			<div data-role="header"></div>
			<div data-role="header">
				<a href="<%=request.getContextPath()%>/teacher/display?id=${ sessionScope.teacher.id }&teacherID=${ sessionScope.teacher.teacherID }" data-icon="carat-l">返回</a>
				<h1 style="color: #3FA9FB">学生信息管理系统</h1>
			</div >
			<div data-role="content">

				<ul data-role="listview" data-inset="true" data-divider-theme="a">
					<li data-role="list-divider">
					${ sessionScope.teacher.teacherID }	${ sessionScope.teacher.name} 学生信息录入
					</li>
					<li><input type="file"  enctype="multipart/form-data" name="attach" id="file"  /></li>
					<li><input type="button" id="submit" class="btn" value="上传" /></li>	
				</ul>
					
					
				
				
			</div>
			<div data-role="footer"></div>
			
		</div>
	</body>
</html>