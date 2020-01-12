<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>세탁곰</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="./css/default.css"/>
	<link rel="stylesheet" type="text/css" href="./css/keep.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			//헤더, 푸터연결
			$("#header").load("header.jsp")
			$("#footer").load("footer.jsp")
			
			//세탁, 수선, 보관 탭 눌렀을 때
			$(".tab").on("click", function() {
				$(".tab").removeClass("active");
				$(".tab-content").removeClass("show");
				$(this).addClass("active");
				$($(this).attr("href")).addClass("show");
			});
			
			//세탁, 수선, 보관 탭 눌렀을 때 위로 올라가는 제이쿼리
			var windowWidth = $(window).width();
			if (windowWidth > 769) {
				$('.tab-list a').click(function() {
					$('html, body').animate({
						scrollTop : $($.attr(this, 'href')).offset().top - 200
					}, 500);
					return false;
				});
			}
			
			//옷 종류 눌렀을 때
			$(".keep-list").on("click", function() {
				var str = "";
				
				str += '<tr>';
				str += '<td><input type="checkbox" name="check" value="yes" checked></td>';
				str += '<td>'+$.attr(this, 'value')+'</td>';
				str += '<td><input type="text" maxlength="3" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" name="count" value="1" id="" class="count">';
				str += '<div><a class="bt_up">▲</a><a class="bt_down">▼</a></div>';
				str += '</td>';
				str += '</tr>';		
				
				$(".keep_sortation_title").after(str);
			});
			
			//보관기간 선택 시 css효과
			$(".month").on("click", function(){
				$(".month").removeClass("month_click");
				$(this).addClass("month_click");
			});
			
			//수량
			$(document).on('click','.bt_up',function(event) {
				
				
				
				var test = document.getElementsByClassName('month_click')
				alert(test[0].innerHTML);
				if(document.getElementsByClassName('month_click')==''){
					alert('안됩니다');
				}
				
				
				
				
				
				
				
				var n = $('.bt_up').index(this);
				var num = $(".count:eq(" + n + ")").val();
				num = $(".count:eq(" + n + ")").val(num * 1 + 1);
				
				$.pricefun(n);
			});
			$(document).on('click','.bt_down',function(event) {
				var n = $('.bt_down').index(this);
				var num = $(".count:eq(" + n + ")").val();
				if (num == 1) {
					alert("최저 수량은 1개입니다.");
				} else {
					num = $(".count:eq(" + n + ")").val(num * 1 - 1);
				}
				
				$.pricefun(n);
			});
			
			//총 합계
			sumprice = function() {
				var sum = 0;
				var tr = $(".mending_order").children().children();
				var pricearr = new Array();
				tr.each(function(i) {
					pricearr.push(tr.eq(i).children().eq(4).text())
				});
				//tr이 지금 두개라 구분창 말고 값가진 애들만 받기위해 한번 더 돌림 i를 1로.
				for(var i = 1; i<pricearr.length;i++){
					sum += parseInt(pricearr[i].split('원')[0]);
				}
				$(".tot_price").html(sum);
			}
			
			//수량에 따른 값변경
			$.pricefun = function(n){
				var num = parseInt($(".count:eq(" + n + ")").val());
				var price = parseInt($(".tprice:eq(" + n + ")").attr('name'));
				$(".tprice:eq(" + n + ")").html((num*price) + "원");
				sumprice();
			};
			$(document).on("propertychange change keyup paste",".count", function(){
				var n = $('.count').index(this);
				$.pricefun(n);
			});

			//전체선택, 전체선택해제
			$("#allcheck").click(function(){
		        if($("#allcheck").prop("checked")){
		            $("input[name=check]").prop("checked",true);
		        }else{
		            $("input[name=check]").prop("checked",false);
		        }
		    })
		    //선택 삭제
		    $(".chkdelete").click(function(){
				var checkbox = $("input[name=check]:checked");
				checkbox.each(function(){
					var tr = checkbox.parent().parent();
					tr.remove();
				}) 
				sumprice();
			});
		});
		//한글, 영어 금지
		function onlyNumber(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
					|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
				return;
			else
				return false;
		}
		function removeChar(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
				return;
			else
				event.target.value = event.target.value.replace(/[^0-9]/g, "");
		}
	</script>
</head>
<body>
	<div id="header"></div>

	<section id="mending">
		<div class="content">
			<div class="title-text">
				<h2>보관 서비스</h2>
			</div>
			<div class="keep">
				<p>※ 보관만 가능한 페이지입니다. 보관할 옷에 세탁 서비스도 이용하실 예정이시면 세탁 페이지를 이용해주세요.</p>
				<div class="tabs">
					<div class="tab-list">
						<a href="#one" id="tab" class="tab active">상의</a>
						<a href="#two" id="tab" class="tab">하의</a>
						<a href="#three" id="tab" class="tab">아우터</a>
						<a href="#four" id="tab" class="tab">아동</a>
					</div>
					<div class="tab-list">
						<a href="#five" id="tab" class="tab">침구</a>
						<a href="#six" id="tab" class="tab">가죽/기타</a>
						<a href="#seven" id="tab" class="tab">스포츠웨어</a>
						<a href="#eight" id="tab" class="tab">신발</a>
					</div>
				</div>

				<div id="one" class="tab-content show">
					<ul class="top">
						<li class="keep-list" value="셔츠">셔츠</li>
						<li class="keep-list" value="티셔츠">티셔츠</li>
						<li class="keep-list" value="블라우스">블라우스</li>
						<li class="keep-list" value="후드티,맨투맨티">후드티,맨투맨티</li>
					</ul>
					<ul class="top">
						<li class="keep-list" value="니트,스웨터">니트,스웨터</li>
						<li class="keep-list" value="원피스/점프수트">원피스/점프수트</li>
						<li class="keep-list" value="원피스(니트,실크,레자)">원피스(니트,실크,레자)</li>
						<li class="keep-list" value="후리스">후리스</li>
					</ul>
				</div>
				
				<div id="two" class="tab-content">
				</div>
				
				<div id="three" class="tab-content">
				</div>
				
				<form>
					<table class="keep_sortation">
						<tr class="keep_sortation_title">
							<td width="5%"><input type="checkbox" id = "allcheck" checked></td>
							<td style="width:47.5%;">구분</td>
							<td style="width:47.5%;">수량</td>
						</tr>
					</table>
					
					<div class="delete-button">
						<a class="chkdelete" href="javascript:">선택삭제</a>
					</div>
					
					<div class="keep_month">
						<ul>
							<li class="month"><h2>1개월</h2><p>2020.01.03 ~ 2020.02.02</p><h1>10000원</h1>
							<li class="month"><h2>3개월</h2><p>2020.01.03 ~ 2020.04.02</p><h1>28000원</h1>
							<li class="month"><h2>6개월</h2><p>2020.01.03 ~ 2020.07.02</p><h1>55000원</h1>
						</ul>
						<div class="keep_caution">
							<p>※ 규격 안내 : - 월컴키트 안 세탁곰 규격 리빙박스(30L)가 기준입니다.</p>
							<p>- 웰컴키트에 포함된 리빙박스에 세탁물을 담으시면 정확히 몇 박스가 필요하신지 알기 쉽습니다.<br>
								- 세탁곰 리빙박스는 한 박스에 여름 티셔츠 50벌이 들어갑니다.<br>
								- 세탁곰 리빙박스는 한 박스에 겨울 니트류 10~30벌이 들어갑니다.<br>
								- 세탁곰 리빙박스는 한 박스에 외투 15벌이 들어갑니다.<br>
								- 세탁곰 리빙박스는 한 박스에 겨울 코트 10벌이 들어갑니다.
							</p>
							<p>※ 배송은 만료 기준 1회 무료이며, 도중 개별 반환도 가능합니다.  도중 개별 반환 시 배송비가 청구됩니다.</p>
							<p>※ 기간 만료 2주 전 카카오톡 알람 서비스가 제공됩니다. 연장을 원하신다면 마이페이지 > 보관현황에서 연장 신청을 이용해주세요.</p>
							<p>※ 기간이 만료되면 입력하신 주소로 바로 배송됩니다. 배송 완료 후 알람을 드리며 이후 분실에 대해 책임을 지지 않습니다. 보관 중 배송지가 변경된다면 미리 정보를 수정해주세요.</p>
						</div>
					</div>
					
					<div class="box_quantity">
						<p>박스 수량을 선택 해 주세요</p>
						<div>
							<input type="text" maxlength="3" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" name="count" value="1" id="" class="count">
							<a class="bt_up">+</a>
							<a class="bt_down">-</a>
						</div>
					</div>
					
					<div class="total_price">
						<p>보관비 총 금액 : <span class="tot_price">0</span>원</p>
					</div>
					<div class="total-button">
						<a href="javascript:">장바구니</a>
					</div>
				</form>
			</div>
		</div>
	</section>
	
	<div id="footer"></div>
</body>
</html>