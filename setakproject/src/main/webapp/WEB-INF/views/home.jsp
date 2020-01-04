<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<style>
	@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800');
	
	.content{
      width:1200px;
      height: 100%;
      margin:0 auto;   
   }
	.title-text{
		position:absolute;
    	left:50%;
    	transform: translate(-50%);
	}
	.title-text h2{
		font-size:2rem;
		color:#444;
		margin: 0;
	}
	.title-text h2:before{
		content:'';
		display:block;
		width:60px;
		height:5px;
		background-color:#3498db;
	}
	
	#setakimg{
		position:absolute;
    	left:50%;
    	transform: translate(-50%);
    	top: 17%;
	}
	#catediv p{
		color:#3498db;
		
	}
	
	#catediv{
		position:relative;
    	left:17%; 
    	top: 23%;
	}
	
	#cate{
		width : 66%;
		height: 130px;
		border-spacing: 0px;  
		table-layout: fixed; 
	}
	
	#cate td{
		padding: 10px 30px;
		text-align: center;
		font-size: 13pt;
		font-family: 'Nanum Gothic';
	}
</style>
<!-- http://www.webmadang.net/javascript/javascript.do?action=read&boardid=8001&page=14&seq=190 : 테이블 클릭시 색-->
<body>
	<div class = content>
		<div class = title-text>
			<h2>세탁 서비스</h2>
		</div>
		<div id = setakimg>
			<img src ="${pageContext.request.contextPath}/resources/image/화살표.PNG" border="0">
		</div>
		<div id = catediv>
			<p><sub>&nbsp;※본 가격은 물세탁 기준이며, 드라이클리닝 또는 삶음 가격은 세탁물 선택 후 아래창에서 확인 가능합니다.</sub></p>
			<table border="1" id = "cate">
			<tr>
				<td>상의</td>
				<td>하의</td>
				<td>아우터</td>
				<td>아동</td>
			</tr>
			<tr>
				<td>침구</td>
				<td>가죽/기타</td>
				<td>스포츠웨어</td>
				<td>신발</td>
			</tr>		
			</table>
		</div>
	</div>
</body>
</html>
