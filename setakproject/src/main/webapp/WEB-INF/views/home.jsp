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
   /* 타이틀 부분 */
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
	/* 화살표 이미지 */
	#setakimg{
		position:absolute;
    	left:50%;
    	transform: translate(-50%);
    	top: 17%;
	}
	/* 카테고리 테이블 */
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
		cursor: pointer;
		border-color: e1e4e4;
	}
	
	#cate td{
		padding: 10px 30px;
		text-align: center;
		font-size: 13pt;
		font-family: 'Nanum Gothic';
	}
	
	.catelist.active{
		background-color: #3498db;
		color: #fff;
		font-weight: bold; 
	}
	/* 메뉴 테이블 */
	#menudiv{
		position:relative;
    	left:17%; 
    	top: 25% ;
	}
	.menulist{
		width : 66%;
		height: 130px;
		border-spacing: 0px;  
		table-layout: fixed; 
		cursor: pointer;
		border-color: e1e4e4;
	}
	
</style>
<!-- http://www.webmadang.net/javascript/javascript.do?action=read&boardid=8001&page=14&seq=190 : 테이블 클릭시 색-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function($) {	
	$(".catelist").on("click", function() {
		$(".catelist").removeClass("active");
		$(".menulist").removeClass("show");
		$(this).addClass("active");
		$($(this).attr("id")).addClass("show");
	});

});


</script>
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
				<td id="#list1" class = "catelist active">상의</td>
				<td id="#list2" class = "catelist">하의</td>
				<td id="#list3" class = "catelist">아우터</td>
				<td id="#list4" class = "catelist">아동</td>
			</tr>
			<tr>
				<td id="#list5" class = "catelist">침구</td>
				<td id="#list6" class = "catelist">가죽/기타</td>
				<td id="#list7" class = "catelist">스포츠웨어</td>
				<td id="#list8" class = "catelist">신발</td>
			</tr>		
			</table>
		</div>
		<div id = menudiv>
			<table border ="1" id="list1" class = "menulist show">
			<tr>
				<td>셔츠<p align="right">2000원</p></td>
				<td>티셔츠<p align="right">2500원</p></td>
				<td>블라우스<p align="right">4000원</p></td>
				<td>후드티,맨투맨티<p align="right">3500원</p></td>
			</tr>
			<tr>
				<td>니트,스웨터<p align="right">4000원</p></td>
				<td>원피스/점프수트<p align="right">5000원</p></td>
				<td>원피스(니트,실크,레자)<p align="right">6000원</p></td>
				<td>후리스<p align="right">5000원</p></td>
			</tr>
			</table>
			
			<table border ="1" id="list2" class = "menulist">
			<tr>
				<td>셔츠<p align="right">2000원</p></td>
				<td>티셔츠<p align="right">2500원</p></td>
				<td>블라우스<p align="right">4000원</p></td>
				<td>후드티,맨투맨티<p align="right">3500원</p></td>
			</tr>
			<tr>
				<td>니트,스웨터<p align="right">4000원</p></td>
				<td>원피스/점프수트<p align="right">5000원</p></td>
				<td>원피스(니트,실크,레자)<p align="right">6000원</p></td>
				<td>후리스<p align="right">5000원</p></td>
			</tr>
			</table>		
		</div>
	</div>
</body>
</html>
