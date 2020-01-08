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
    	left:0%; 
    	top: 23%;
	}
	
	#cate{
		width : 100%;
		height: 90px;
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
	.catelist{
		border:2px solid #e1e4e4;
		
	}
	.catelist.active{
		background-color: #3498db;
		color: #fff;
		font-weight: bold; 
	}
	/* 메뉴 테이블 */
	#menudiv{
		position:relative;
    	left:0%; 
    	top: 25% ;
	}
	.menulist{
		width : 100%;
		height:  85px;
		border-spacing: 0px;  
		table-layout: fixed; 
		border-color: e1e4e4;
		font-family: 'Nanum Gothic';
		display: none;
	}
	
	.show{
		display: table;
	}
	/* 가격 테이블 */
	#pricediv{
		position:relative;
    	left:0%; 
    	top: 35%;
	}
	.pricemenu{
		background-color: #3498db;
		color: #fff;
	}
	#pricetable{
		width : 100%;
		height: 32px;
		border-spacing: 0px;
	}
	.hidetext{
		display: none;
	}
	.downlist{
		cursor: pointer;
		padding: 20px;
	}
	
	
	.total {
		padding:50px 0 0 0;
		position: relative;
    	top: 36%;
	}
	.total p{
		background-color:#e1e4e4;
		height:40px;
		line-height:40px;
		color:#444;
		text-align:right;
		padding-right:15px;
	}
	.total-button{
		padding:40px 0;
		position: relative;
    	top: 35%;
	}
	.total-button a{
		font-size:0.95rem;
		display:block;
		width:90px;
		background-color:#e1e4e4;
		color:#444;
		border-radius:30px;
		height:40px;
		line-height:40px;
		text-align:center;
		float:right;
		margin: 0 5px;
	}
	.total-button a:hover{
		background-color:#3498db;
		color:#fff;
		transition:all .4s;
	}
</style>
<!-- http://www.webmadang.net/javascript/javascript.do?action=read&boardid=8001&page=14&seq=190 : 테이블 클릭시 색-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
var num = 0;

$(document).ready(function($) {	
	
	/* 카테고리선택하면 메뉴리스트 변경함수 */
	$(".catelist").on("click", function() {
		$(".catelist").removeClass("active");
		$(".menulist").removeClass("show");
		$(this).addClass("active");
		$($(this).attr("id")).addClass("show");
	});
	
	/* 메뉴리스트 눌렀을때 가격테이블 생성 */
	$(".downlist").on("click", function() {
		var td = $(this);
		var tdtext = td.text().split('!');
		var str = ""
		num++;
		str += '<tr id="'+num+'">';
		str += '<td align="center"><input type="checkbox" name="chk" value="'+tdtext[0]+'" checked></td>';
		str += '<td align="center">'+tdtext[0]+'</td>';
		str += '<td align="center"><select class = "howsetak" name="세탁방법">';
		str += '<option value="물세탁">물세탁</option>';
		str += '<option value="드라이">드라이(+2000)</option>';
		str += '<option value="삶음">삶음(+1500)</option></td>';
		str += '<td align="center"><input type="number" class="qnum" name="quantity" min="1" max="1000" value="1"></td>';
		str += '<td name="'+tdtext[1]+'" align="center">'+tdtext[1]+'</td>';
		$(".pricemenu").after(str);
	});
	
	/* 가격바뀌는 함수 */
	$.pricefun = function(){
		var td = $(this).parent().parent().children();
		var price = parseInt(td.eq(4).attr('name'));
		var quan = td.eq(3).children().val();
		
		if(td.eq(2).children().val()=="드라이"){
			td.eq(4).html((price+2000)*quan);
		}else if(td.eq(2).children().val()=="삶음"){
			td.eq(4).html((price+1500)*quan);
		}else{
			td.eq(4).html(price*quan);
		}
	};
	
	/* 수량바뀔때 가격 바뀌는 함수호출 */
	$(document).on("propertychange change keyup paste",".qnum", $.pricefun);
	
	/* 세탁방법 변경했을때 가격바뀌는 함수호출 */
	$(document).on("change",".howsetak", $.pricefun);
	
	/* 체크박스 전체선택 */
	$("#allcheck").click(function(){
        //클릭되었으면
        if($("#allcheck").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=chk]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=chk]").prop("checked",false);
        }
    })
	
    /* 체크박스 삭제 */
	$(".total-button a").click(function(){
		var checkbox = $("input[name=chk]:checked");
		checkbox.each(function(){
			var tr = checkbox.parent().parent();
			tr.remove();
		}) 
	});
	
});

$(".qnum").bind('keyup mouseup', function () {
    alert("changed");            
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
			<table id = "cate">
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
			<table border="1" id="list1" class = "menulist show">
			<tr>
				<td class = "downlist">셔츠<p align="right"><span class = "hidetext">!</span>2000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">티셔츠<p align="right"><span class = "hidetext">!</span>2500<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">블라우스<p align="right"><span class = "hidetext">!</span>4000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">후드티,맨투맨티<p align="right"><span class = "hidetext">!</span>3500<span class = "hidetext">!</span>원</p></td>
			</tr>
			<tr>
				<td class = "downlist">니트,스웨터<p align="right"><span class = "hidetext">!</span>4000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">원피스/점프수트<p align="right"><span class = "hidetext">!</span>5000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">원피스(니트,실크,레자)<p align="right"><span class = "hidetext">!</span>6000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">후리스<p align="right"><span class = "hidetext">!</span>5000<span class = "hidetext">!</span>원</p></td>
			</tr>
			</table>
			
			<table border ="1" id="list2" class = "menulist">
			<tr>
				<td class = "downlist">바지<span class = "hidetext">!</span><p align="right">3500<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">바지(니트,레자,패딩)<span class = "hidetext">!</span><p align="right">5000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">스커트<span class = "hidetext">!</span><p align="right">3500<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">스커트(니트,레자,패딩)<span class = "hidetext">!</span><p align="right">5000<span class = "hidetext">!</span>원</p></td>
			</tr>
			</table>
			
			<table border ="1" id="list3" class = "menulist">
			<tr>
				<td class = "downlist">가디건<span class = "hidetext">!</span><p align="right">5000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">롱가디건<span class = "hidetext">!</span><p align="right">6000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">점퍼(야상,청자켓,항공점퍼,집업)<span class = "hidetext">!</span><p align="right">5000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">자켓<span class = "hidetext">!</span><p align="right">6000<span class = "hidetext">!</span>원</p></td>
			</tr>
			<tr>
				<td class = "downlist">패딩<span class = "hidetext">!</span><p align="right">10000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">롱패딩<span class = "hidetext">!</span><p align="right">15000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">프리미엄패딩<span class = "hidetext">!</span><p align="right">20000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">코트<span class = "hidetext">!</span><p align="right">20000<span class = "hidetext">!</span>원</p></td>
			</tr>
			<tr>
				<td class = "downlist">기능성의류(등산용,바람막이)<span class = "hidetext">!</span><p align="right">20000<span class = "hidetext">!</span>원</p></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			</table>
			
			<table border ="1" id="list4" class = "menulist">
			<tr>
				<td class = "downlist">아동 상의<span class = "hidetext">!</span><p align="right">2000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">아동 바지/치마<span class = "hidetext">!</span><p align="right">2500<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">아동 자켓/점퍼<span class = "hidetext">!</span><p align="right">3500<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">아동 코트<span class = "hidetext">!</span><p align="right">8000<span class = "hidetext">!</span>원</p></td>
			</tr>
			<tr>
				<td class = "downlist">아동 패딩<span class = "hidetext">!</span><p align="right">10000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">아동 원피스<span class = "hidetext">!</span><p align="right">4000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">아동 운동화<span class = "hidetext">!</span><p align="right">4000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">아동 부츠<span class = "hidetext">!</span><p align="right">5000<span class = "hidetext">!</span>원</p></td>
			</tr>
			</table>
			
			<table border ="1" id="list5" class = "menulist">
			<tr>
				<td class = "downlist">베개,쿠션 커버<span class = "hidetext">!</span><p align="right">3000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">침대,매트리스,이불커버,홑이불<span class = "hidetext">!</span><p align="right">8000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">일반 이불<span class = "hidetext">!</span><p align="right">10000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">극세사,일반 토퍼<span class = "hidetext">!</span><p align="right">15000<span class = "hidetext">!</span>원</p></td>
			</tr>
			<tr>
				<td class = "downlist">구스이불,양모이불<span class = "hidetext">!</span><p align="right">20000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">실크이불<span class = "hidetext">!</span><p align="right">33000<span class = "hidetext">!</span>원</p></td>
				<td></td>
				<td></td>
			</tr>
			</table>
			
			<table border ="1" id="list6" class = "menulist">
			<tr>
				<td class = "downlist">발매트<span class = "hidetext">!</span><p align="right">4000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">원룸커튼<span class = "hidetext">!</span><p align="right">15000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">일반커튼<span class = "hidetext">!</span><p align="right">20000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">벨벳커튼<span class = "hidetext">!</span><p align="right">25000<span class = "hidetext">!</span>원</p></td>
			</tr>
			<tr>
				<td class = "downlist">러그,카펫<span class = "hidetext">!</span><p align="right">15000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">식탁보<span class = "hidetext">!</span><p align="right">10000<span class = "hidetext">!</span>원</p></td>
				<td></td>
				<td></td>
			</tr>
			</table>
			
			<table border ="1" id="list7" class = "menulist">
			<tr>
				<td class = "downlist">운동화,스니커즈<span class = "hidetext">!</span><p align="right">5000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">캐주얼샌들/슬리퍼<span class = "hidetext">!</span><p align="right">4500<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">구두,로퍼<span class = "hidetext">!</span><p align="right">7000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">등산화<span class = "hidetext">!</span><p align="right">7000<span class = "hidetext">!</span>원</p></td>
			</tr>
			<tr>
				<td class = "downlist">부츠화<span class = "hidetext">!</span><p align="right">10000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">롱부츠<span class = "hidetext">!</span><p align="right">15000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">가죽부츠(발목)<span class = "hidetext">!</span><p align="right">20000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">어그부츠<span class = "hidetext">!</span><p align="right">25000<span class = "hidetext">!</span>원</p></td>
			</tr>
			</table>
			
			<table border ="1" id="list8" class = "menulist">
			<tr>
				<td class = "downlist">니트모자<span class = "hidetext">!</span><p align="right">3000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">스카프,장갑<span class = "hidetext">!</span><p align="right">3000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">숄<span class = "hidetext">!</span><p align="right">6000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">넥타이<span class = "hidetext">!</span><p align="right">1000<span class = "hidetext">!</span>원</p></td>
			</tr>
			<tr>
				<td class = "downlist">에코백<span class = "hidetext">!</span><p align="right">3000<span class = "hidetext">!</span>원</p></td>
				<td class = "downlist">목도리<span class = "hidetext">!</span><p align="right">15000<span class = "hidetext">!</span>원</p></td>
				<td></td>
				<td></td>
			</tr>
			</table>		
		</div>
		
		<div id = "pricediv">
			<table border="1" id = "pricetable">
				<tr class= "pricemenu">
					<th><input type="checkbox" id = "allcheck" checked></th>
					<th>세탁물</th>
					<th>세탁방법</th>
					<th>수량</th>
					<th>합계</th>
				</tr>
			</table>
		</div>
		
		<div class="total">
			<p>총 금액 : 수선비 10,000원 + 배송비 2,000원 = 합계 : 12,000원</p>
		</div>
		
		<div class="total-button">
			<a href="javascript:">다음</a>
			<a href="javascript:">선택삭제</a>
		</div>
	</div>
</body>
</html>
