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
	<link rel="stylesheet" type="text/css" href="./css/mending.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("header.jsp")
			$("#footer").load("footer.jsp")
	
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
			
			var windowWidth = $(window).width();
			if (windowWidth > 769) {
				$('a').click(function() {
					$('html, body').animate({
						scrollTop : $($.attr(this, 'href')).offset().top - 200
					}, 500);
					return false;
				});
			}
			
			$("#left input").keyup(function(){
		        $('.left_length').val($(this).val());
		    });
			$("#right input").keyup(function(){
		        $('.right_length').val($(this).val());
		    });
			$("#length input").keyup(function(){
		        $('.total_length').val($(this).val());
		    });
		    
			
			var maxAppend = 0;			
			$(".mending-list").click(function() {
				if (maxAppend >= 10){
					alert("최대 10개 선택 가능합니다.");
					return;
				}
				$(".hash").append("<p class='hashvl'>"+$.attr(this, 'value')+"<span>X</span></p>");
				maxAppend++;
			});
			$(document).on('click','.hashvl',function(event) {
				$(this).remove();
				maxAppend--;
			});
			
			
			
			
			$(".mending-list").click(function() {
				if (maxAppend >= 10){
					alert("최대 10개 선택 가능합니다.");
					return;
				}
				$(".hash").append("<p class='hashvl'>"+$.attr(this, 'value')+"<span>X</span></p>");
				maxAppend++;
			});
			$(document).on('click','.hashvl',function(event) {
				$(this).remove();
				maxAppend--;
			});
			
			
			
			
			

			$('.bt_up').click(function() {
				var n = $('.bt_up').index(this);
				var num = $(".count:eq(" + n + ")").val();
				num = $(".count:eq(" + n + ")").val(num * 1 + 1);

			});
			$('.bt_down').click(function() {
				var n = $('.bt_down').index(this);
				var num = $(".count:eq(" + n + ")").val();
				if (num == 1) {
					alert("최저 수량은 1개입니다.");
				} else {
					num = $(".count:eq(" + n + ")").val(num * 1 - 1);
				}
			});
			
			$("input:text[numberOnly]").on("keyup", function() {
				$(this).val($(this).val().replace(/[^0-9]/g, ""));
			});
			
			
		});
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
				<h2>수선 서비스</h2>
			</div>
			<div class="mending">
				<p>※ 수선만 가능한 페이지입니다. 수선할 옷에 세탁 서비스도 이용하실 예정이시면 세탁 페이지를 이용해주세요.</p>
				<div class="tabs">
					<div class="tab-list">
						<a href="#one" class="tab active">상의</a>
						<a href="#two" class="tab">하의</a>
						<a href="#three" class="tab">아우터</a>
					</div>
				</div>
				
				<div id="one" class="tab-content show">
					<ul class="top">
						<li class="mending-list" value="소매줄임">소매줄임<br><span>5,000원</span></li>
						<li class="mending-list" value="기장줄임">기장줄임<br><span>5,000원</span></li>
						<li class="mending-list" value="단추수선">단추수선<br><span>2,000원</span></li>
						<li class="mending-list" value="튿어짐">튿어짐<br><span>7,000원</span></li>
					</ul>
					<ul class="top">
						<li class="mending-list" value="지퍼수선">지퍼수선<br><span>16,000원</span></li>
						<li></li>
						<li></li>
						<li></li>
					</ul>
					<ul class="details">
						<li><img src="images/top.png" alt="상의"></li>
						<li>
							<div class="top_size_input">
								<div class="size_input">
									<p id="left">- <input type="text" maxlength="2"></p>
									<p id="right">- <input type="text" maxlength="2"></p>
									<p id="length">- <input type="text" maxlength="2"></p>
								</div>
							</div>
							<form>
								<div class="hash">
								</div>
								<p>※ 왼쪽 소매 줄임 : - <input type="text" class="left_length" value="" disabled>cm</p>
								<p>※ 오른쪽 소매 줄임 : - <input type="text" class="right_length"value="" disabled>cm</p>
								<p>※ 총기장(기장 줄임) : - <input type="text" class="total_length" value="" disabled>cm</p>
								<p>※ <input type="file" name="file" value="file" style="width:92%; display:inline;" multiple></p>
								<textarea placeholder="추가 요청사항이 있다면 알려주세요."></textarea>
								<a href="javascript:">추가</a>
							</form>
						</li>
					</ul>
					<p>※ 단추 수선은 헐렁이거나 떨어진 단추를 달아드리는 상품이며, 단추가 없을 시 유사한 단추로 달아드립니다. 수선하실 단추 수량만큼 추가해 주세요.<br><br><br></p>
				</div>
				
				<div id="two" class="tab-content">
					<ul class="top">
						<li class="mending-list" value="허리줄임">허리줄임<br><span>5,000원</span></li>
						<li class="mending-list" value="기장줄임">기장줄임<br><span>5,000원</span></li>
						<li class="mending-list" value="단추수선">단추수선<br><span>2,000원</span></li>
						<li class="mending-list" value="튿어짐">튿어짐<br><span>7,000원</span></li>
					</ul>
					<ul class="top">
						<li class="mending-list" value="지퍼수선">지퍼수선<br><span>12,000원</span></li>
						<li></li>
						<li></li>
						<li></li>
					</ul>
					<ul class="details">
						<li><img src="images/bottom.png" alt="하의"></li>
						<li>
							<div class="bottom_size_input">
								<div class="size_input">
									<p id="left">- <input type="text" maxlength="2"></p>
									<p id="right">- <input type="text" maxlength="2"></p>
									<p id="length">- <input type="text" maxlength="2"></p>
								</div>
							</div>
							<form>
								<div class="hash">
								</div>
								<p>※ 왼쪽 기장 줄임 : - <input type="text" class="left_length" value="" disabled>cm</p>
								<p>※ 오른쪽 기장 줄임 : - <input type="text" class="right_length" value="" disabled>cm</p>
								<p>※ 허리 줄임 : - <input type="text" class="total_length" value="" disabled>cm</p>
								<p>※ <input type="file" name="file" value="file" style="width:92%; display:inline;" multiple></p>
								<textarea placeholder="추가 요청사항이 있다면 알려주세요."></textarea>
								<a href="javascript:">추가</a>
							</form>
						</li>
					</ul>
					<p>※ 단추 수선은 헐렁이거나 떨어진 단추를 달아드리는 상품이며, 단추가 없을 시 유사한 단추로 달아드립니다. 수선할 단추 수량만큼 눌러주세요.<br><br><br></p>
				</div>
				
				<div id="three" class="tab-content">
					<ul class="top">
						<li class="mending-list" value="소매줄임">소매줄임<br><span>5,000원</span></li>
						<li class="mending-list" value="기장줄임">기장줄임<br><span>5,000원</span></li>
						<li class="mending-list" value="단추수선">단추수선<br><span>2,000원</span></li>
						<li class="mending-list" value="튿어짐">튿어짐<br><span>10,000원</span></li>
					</ul>
					<ul class="top">
						<li class="mending-list" value="지퍼수선">지퍼수선<br><span>20,000원</span></li>
						<li></li>
						<li></li>
						<li></li>
					</ul>
					<ul class="details">
						<li><img src="images/outer.png" alt="아우터"></li>
						<li>
							<div class="outer_size_input">
								<div class="size_input">
									<p id="left">- <input type="text" maxlength="2"></p>
									<p id="right">- <input type="text" maxlength="2"></p>
									<p id="length">- <input type="text" maxlength="2"></p>
								</div>
							</div>
							<form>
								<div class="hash">
								</div>
								<p>※ 왼쪽 소매 줄임 : - <input type="text" class="left_length" value="" disabled>cm</p>
								<p>※ 오른쪽 소매 줄임 : - <input type="text" class="right_length" value="" disabled>cm</p>
								<p>※총기장(기장 줄임) : - <input type="text" class="total_length" value="" disabled>cm</p>
								<p>※ <input type="file" name="file" value="file" style="width:92%; display:inline;" multiple></p>
								<textarea placeholder="추가 요청사항이 있다면 알려주세요."></textarea>
								<a href="javascript:">추가</a>
							</form>
						</li>
					</ul>
					<p>※ 단추 수선은 헐렁이거나 떨어진 단추를 달아드리는 상품이며, 단추가 없을 시 유사한 단추로 달아드립니다. 수선하실 단추 수량만큼 추가해 주세요.<br><br><br></p>
				</div>
				
				<p>※ 받으신 웰컴키트 안 '택'에  선택하신 택 코드를 동일하게 적어서 보내주세요.</p>
				<form>
					<table class="mending_order">
						<tr class="mending_order_title">
							<td colspan="2">구분</td>
							<td>택코드</td>
							<td>수량</td>
							<td>합계</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="check" value="yes" checked></td>
							<td style="text-align:left; padding-left:59px;">상의</td>
							<td>
								<select name="list">
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
									<option value="F">F</option>
									<option value="G">G</option>
									<option value="H">H</option>
									<option value="I">I</option>
									<option value="J">J</option>
									<option value="K">K</option>
									<option value="L">L</option>
									<option value="N">N</option>
									<option value="M">M</option>
									<option value="O">O</option>
									<option value="P">P</option>
									<option value="Q">Q</option>
									<option value="R">R</option>
									<option value="S">S</option>
									<option value="T">T</option>
									<option value="U">U</option>
									<option value="V">V</option>
									<option value="W">W</option>
									<option value="X">X</option>
									<option value="Y">Y</option>
									<option value="Z">Z</option>
								</select>
							</td>
							<td><input type="text" maxlength="3" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' name="count" value="1" id="" class="count">
									<div><a class="bt_up">▲</a><a class="bt_down">▼</a></div>
							</td>
							<td>5000원</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="check" value="yes" checked></td>
							<td style="text-align:left; padding-left:59px;">상의</td>
							<td>
								<select name="list">
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
									<option value="F">F</option>
									<option value="G">G</option>
									<option value="H">H</option>
									<option value="Y">Y</option>
									<option value="J">J</option>
									<option value="K">K</option>
									<option value="L">L</option>
									<option value="N">N</option>
									<option value="M">M</option>
									<option value="O">O</option>
									<option value="P">P</option>
									<option value="Q">Q</option>
									<option value="R">R</option>
									<option value="S">S</option>
									<option value="T">T</option>
									<option value="U">U</option>
									<option value="V">V</option>
									<option value="W">W</option>
									<option value="X">X</option>
									<option value="Y">Y</option>
									<option value="Z">Z</option>
								</select>
							</td>
							<td><input type="text" name="count" value="1" id="" class="count">
									<div><a class="bt_up">▲</a><a class="bt_down">▼</a></div>
							</td>
							<td>5000원</td>
						</tr>							
					</table>
					
					<div class="total_price">
						<p>총 금액 : 수선비 10,000원 + 배송비 2,000원 = 합계 : 12,000원</p>
					</div>
					<div class="total-button">
						<a href="javascript:">장바구니</a>
						<a href="javascript:">선택삭제</a>
					</div>
				</form>
			</div>
		</div>
	</section>
	
	<div id="footer"></div>
</body>
</html>