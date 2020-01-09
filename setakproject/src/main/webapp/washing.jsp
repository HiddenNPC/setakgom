<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Home</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="./css/default.css"/>
	<link rel="stylesheet" type="text/css" href="./css/washing.css"/>
</head>

<!-- http://www.webmadang.net/javascript/javascript.do?action=read&boardid=8001&page=14&seq=190 : 테이블 클릭시 색-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
var num = 0;

$(document).ready(function($) {	
	
	/* 헤더풋터 생성 */
	$("#header").load("header.jsp")
    $("#footer").load("footer.jsp")
	
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
		
		sumprice();
		/* console.log(tr.eq(2).children().eq(4).text()); */
		
		
	});
	
	sumprice = function() {
		var hap = 0;
		var fee = 0;
		var tr = $("#pricetable").children().children();
		var pricearr = new Array();
		
		tr.each(function(i) {
			pricearr.push(tr.eq(i).children().eq(4).text())
		});
		
		for(var i = 1; i<pricearr.length;i++){
			hap += parseInt(pricearr[i]);
		}
		
		$("#repairfee").html(numberFormat(hap));
		if(hap < 30000)
			fee = parseInt(2500);
		$("#shipfee").html(numberFormat(fee));
		
		$("#sumprice").html(numberFormat(hap+fee));
		
	}
	
	/* 가격바뀌는 함수 */
	$.pricefun = function(){
		var td = $(this).parent().parent().children();
		console.log(td.eq(4));
		var price = parseInt(td.eq(4).attr('name'));
		var quan = td.eq(3).children().val();
		
		if(td.eq(2).children().val()=="드라이"){
			td.eq(4).html((price+2000)*quan);
		}else if(td.eq(2).children().val()=="삶음"){
			td.eq(4).html((price+1500)*quan);
		}else{
			td.eq(4).html(price*quan);
		}
		
		sumprice();
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
		
		sumprice();
	});
	
	numberFormat = function(inputNumber) {
		   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	
	//$('#repairfee').html(numberFormat(test));
	
	
	
});



</script>
<body>
	<div id="header"></div>

	<div class = content>
		<div class = title-text>
			<h2>세탁 서비스</h2>
		</div>
		<div class="setakmain">
		<%-- <div id = setakimg>
			<img src ="${pageContext.request.contextPath}/resources/image/화살표.PNG" border="0">
		</div> --%>
			<p>※본 가격은 물세탁 기준이며, 드라이클리닝 또는 삶음 가격은 세탁물 선택 후 아래창에서 확인 가능합니다.</p>
			
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
					<th width="10px"><input type="checkbox" id = "allcheck" checked></th>
					<th width="580px">세탁물</th>
					<th width="250px">세탁방법</th>
					<th width="140px">수량</th>
					<th width="200px">합계</th>
				</tr>
			</table>
		</div>
		
		<div class="total">
			<p>총 금액 : 수선비 <span id = "repairfee">0</span>원 + 배송비 <span id = "shipfee">2,500</span>원 = 합계 : <span id = "sumprice">0</span>원</p>
		</div>
		
		<div class="total-button">
			<a href="javascript:">다음</a>
			<a href="javascript:">선택삭제</a>
		</div>
	</div>
	
	</div>
	
	
	<div id="footer"></div>
</body>
</html>
