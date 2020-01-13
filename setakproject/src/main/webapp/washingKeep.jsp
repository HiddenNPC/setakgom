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
						
			//보관기간 선택 시 css효과, 보관기간의 돈 값 가져와서 합계에 보여주기.
			var monthclick = 0;
			var price = parseInt(0);
			$(".month").on("click", function(){
				$(".month").removeClass("month_click");
				$(this).addClass("month_click");
				monthclick = 1;
				price = parseInt($($(this).children().children('.price')).html());
				var n = $('.count').index(this);
				$.pricefun(n);
			});
			
			//수량
			$(document).on('click','.bt_up',function(event) {
				var n = $('.bt_up').index(this);
				var num = $(".count:eq(" + n + ")").val();
				num = $(".count:eq(" + n + ")").val(num * 1 + 1);
			});
			$(document).on('click','.bt_down',function(event) {
				var n = $('.bt_down').index(this);
				var num = $(".count:eq(" + n + ")").val();
				if (num == 1) {
					alert("최저 수량은 1개입니다.");
				} else {
					num = $(".count:eq(" + n + ")").val(num * 1 - 1);
				}
			});
			
			//박스 수량
			$(document).on('click','.box_up',function(event) {
				if(monthclick==0){
					alert('보관하실 기간을 먼저 선택해주세요.');
					return;
				}
				var n = $('.box_up').index(this);
				var num = $(".box_count:eq(" + n + ")").val();
				num = $(".box_count:eq(" + n + ")").val(num * 1 + 1);
				
				$.pricefun(n);
			});
			$(document).on('click','.box_down',function(event) {
				var n = $('.bt_down').index(this);
				var num = $(".box_count:eq(" + n + ")").val();
				if (num == 1) {
					alert("최저 수량은 1박스입니다.");
				} else {
					num = $(".box_count:eq(" + n + ")").val(num * 1 - 1);
				}
				
				$.pricefun(n);
			});

			//수량에 따른 값변경
			$.pricefun = function(n){
				var num = parseInt($(".box_count:eq(" + n + ")").val());
				$('.tot_price').html(num*price);
			};
			//버튼안누르고 직접 수량 입력했을 때
			$(document).on("propertychange change keyup paste",".box_count", function(){
				var n = $('.box_count').index(this);
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
				<h2>세탁 서비스</h2>
			</div>
			<div class="keep">
				<div class="step"><img src="images/s3.png" alt="step3_보관"></div>
				<p>※ 세탁 신청이 들어간 세탁물에 대해서만 보관이 가능한 페이지입니다. 보관만 맡기실 옷들은 보관서비스 페이지를 이용해주세요.</p>
				<form>					
					<div class="keep_month">
						<ul class="s_keep">
							<li class="month"><h2>1개월</h2><p>2020.01.03 ~ 2020.02.02</p><h5>10000원</h5><h1><span class="price">9500</span>원</h1><img src="images/sale.png" alt="세일"></li>
							<li class="month"><h2>3개월</h2><p>2020.01.03 ~ 2020.04.02</p><h5>28000원</h5><h1><span class="price">27500</span>원</h1><img src="images/sale.png" alt="세일"></li>
							<li class="month"><h2>6개월</h2><p>2020.01.03 ~ 2020.07.02</p><h5>55000원</h5><h1><span class="price">54500</span>원</h1><img src="images/sale.png" alt="세일"></li>
							<li class="month"><h2>아니오</h2></li>
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
					
					<div class="keep_list">
						<p>보관하시게 될 품목</p>
						<p>셔츠 (2)</p>
						<p>니트 (2)</p>
					</div>
					<div class="box_quantity">
						<p>박스 수량을 선택 해 주세요</p>
						<div>
							<input type="text" maxlength="3" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" name="box_count" value="1" id="" class="box_count">
							<a class="box_up">+</a>
							<a class="box_down">-</a>
						</div>
					</div>
					
					<div class="total_price">
						<p>총 금액	: 세탁비 0원 + 수선비 0원 + 보관비 <span class="tot_price">0</span>원 = 합계 : 0원</p>
					</div>
					<div class="total-button">
						<a href="javascript:">다음</a>
						<a href="javascript:">이전</a>
					</div>
				</form>
			</div>
		</div>
	</section>
	
	<div id="footer"></div>
</body>
</html>