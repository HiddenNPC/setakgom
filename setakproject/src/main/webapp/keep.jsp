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
				$(".hash").empty();
				$(".size_input p input").val('');
				$(".details form")[0].reset();
				$(".details form")[1].reset();
				$(".details form")[2].reset();
				maxAppend = 0;
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
			
			//치수 입력 시 폼에도 값 넘기기
			$("#left input").keyup(function(){
		        $('.left_length').val($(this).val());
		    });
			$("#right input").keyup(function(){
		        $('.right_length').val($(this).val());
		    });
			$("#length input").keyup(function(){
		        $('.total_length').val($(this).val());
		    });
			
			//태그 기능, 계산기능
			var maxAppend = 0;
			var tprice = parseInt(0);
			$(".mending-list").on("click", function() {
				if (maxAppend >= 10){
					alert("최대 10개 선택 가능합니다.");
					return;
				}
				$(".hash").append("<p class='hashvl'>"+$.attr(this, 'value')+"<span>X</span></p>");
				maxAppend++;
				
				$(".price").removeClass("each");
				$($(this).children('.price')).addClass("each");
				var abc =  document.getElementsByClassName('each');
				tprice += parseInt(abc[0].innerHTML);
			});
			$(document).on('click','.hashvl',function(event) {
				$(this).remove();
				maxAppend--;
			});
			
			//추가 버튼 눌렀을 때
			$(".add_button").on("click", function() {
				var sortation = document.getElementsByClassName('active');
				var str = "";
				
				if(maxAppend==0){
					alert('선택 된 수선내용이 없습니다.');
					return;
				}

				str += '<tr>';
				str += '<td><input type="checkbox" name="check" value="yes" checked></td>';
				str += '<td>'+sortation[0].innerHTML+'</td>';
				str += '<td>';
				str += '<select name="list">';
				str += '<option value="A">A</option>';
				str += '<option value="B">B</option>';
				str += '<option value="C">C</option>';
				str += '<option value="D">D</option>';
				str += '<option value="E">E</option>';
				str += '<option value="F">F</option>';
				str += '<option value="G">G</option>';
				str += '<option value="H">H</option>';
				str += '<option value="I">I</option>';
				str += '<option value="J">J</option>';
				str += '<option value="K">K</option>';
				str += '<option value="L">L</option>';
				str += '<option value="N">N</option>';
				str += '<option value="M">M</option>';
				str += '<option value="O">O</option>';
				str += '<option value="P">P</option>';
				str += '<option value="Q">Q</option>';
				str += '<option value="R">R</option>';
				str += '<option value="S">S</option>';
				str += '<option value="T">T</option>';
				str += '<option value="U">U</option>';
				str += '<option value="V">V</option>';
				str += '<option value="W">W</option>';
				str += '<option value="X">X</option>';
				str += '<option value="Y">Y</option>';
				str += '<option value="Z">Z</option>';
				str += '</select>';
				str += '</td>';
				str += '<td><input type="text" maxlength="3" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" name="count" value="1" id="" class="count">';
				str += '<div><a class="bt_up">▲</a><a class="bt_down">▼</a></div>';
				str += '</td>';
				str += '<td name="'+tprice+'" class="tprice">'+tprice+'원</td>';
				str += '</tr>';		
				
				$(".mending_order_title").after(str);
				$(".hash").empty();
				$(".size_input p input").val('');
				$(".details form")[0].reset();
				$(".details form")[1].reset();
				$(".details form")[2].reset();
				maxAppend = 0;
				tprice = parseInt(0);
				sumprice();
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
			
			//수량
			$(document).on('click','.bt_up',function(event) {
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
			<div class="kepp">
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
						<li class="keep-list" value="셔츠">셔츠<br><span>원</span><span class="price">5000</span></li>
						<li class="keep-list" value="티셔츠">티셔츠<br><span>원</span><span class="price">5000</span></li>
						<li class="keep-list" value="블라우스">블라우스<br><span>원</span><span class="price">2000</span></li>
						<li class="keep-list" value="후드티,맨투맨티">후드티,맨투맨티<br><span>원</span><span class="price">7000</span></li>
					</ul>
					<ul class="top">
						<li class="keep-list" value="니트,스웨터">니트,스웨터<br><span>원</span><span class="price">16000</span></li>
						<li class="keep-list" value="니트,스웨터">원피스,점프수트<br><span>원</span><span class="price">16000</span></li>
						<li class="keep-list" value="니트,스웨터">원피스(니트,실크,레자)<br><span>원</span><span class="price">16000</span></li>
						<li class="keep-list" value="니트,스웨터">후리스<br><span>원</span><span class="price">16000</span></li>
					</ul>
				</div>
				
				<div id="two" class="tab-content">
				</div>
				
				<div id="three" class="tab-content">
				</div>
				
				<form>
					<table class="mending_order">
						<tr class="mending_order_title">
							<td width="5%"><input type="checkbox" id = "allcheck" checked></td>
							<td style="width:47.5%;">구분</td>
							<td style="width:47.5%;">수량</td>
						</tr>
					</table>
					
					<div class="total_price">
						<p>수선비 총 금액 : <span class="tot_price">0</span>원</p>
					</div>
					<div class="total-button">
						<a href="javascript:">장바구니</a>
						<a class="chkdelete" href="javascript:">선택삭제</a>
					</div>
				</form>
			</div>
		</div>
	</section>
	
	<div id="footer"></div>
</body>
</html>