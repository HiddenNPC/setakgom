<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String member_id = null;

	if(session.getAttribute("member_id")!= null){
		member_id = (String)session.getAttribute("member_id");
	}
%>
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
			//헤더, 푸터연결
			$("#header").load("./header.jsp")
			$("#footer").load("./footer.jsp")
			
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
				llength ="";
				rlength ="";
				tlength ="";
				details_text = "";
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
			var llength ="";
			var rlength ="";
			var tlength ="";
			var details_text = "";
			
			$("#left input").keyup(function(){
		        $('.left_length').val($(this).val());
		        llength= $(this).val();
		    });
			$("#right input").keyup(function(){
		        $('.right_length').val($(this).val());
		        rlength= $(this).val();
		    });
			$("#length input").keyup(function(){
		        $('.total_length').val($(this).val());
		        tlength= $(this).val();
		    });
			
			$(".details_text").keyup(function(){
				details_text = $(this).val();
		    });
			
			//태그 기능, 계산기능
			var maxAppend = 0;
			var tprice = parseInt(0);
			var kind;			
			var kind_str = new Array();

			$(".mending-list").on("click", function() {
				if (maxAppend >= 10){
					alert("최대 10개 선택 가능합니다.");
					return;
				}
				kind = $.attr(this, 'value');
				$(".hash").append("<p class='hashvl'>&nbsp;"+kind+"&nbsp;<span>X</span></p>");
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
				
				var hashvl = ($(".hash").html()).split('&nbsp;');
				var kind_str = "";
				for(var i=1; i<maxAppend*2-1; i+=2 ){
					kind_str +=hashvl[i] + ",";
				};
				kind_str +=hashvl[i];

				str += '<tr>';
				str += '<td><input type="checkbox" name="check" value="yes" checked></td>';
				str += '<td>'+sortation[0].innerHTML+'</td>';
				str += '<td style="display:none;"><input type="hidden" name="repair_cate" value="'+sortation[0].innerHTML+'">';
				str += '<input type="hidden" name="repair_kind" value="'+kind_str+'">';
				str += '<input type="hidden" name="repair_var1" value="'+llength*(-1)+'">';
				str += '<input type="hidden" name="repair_var2" value="'+rlength*(-1)+'">';
				str += '<input type="hidden" name="repair_var3" value="'+tlength*(-1)+'">';
				str += '<input type="file" name="repair_file" class="details_file">';
				str += '<textarea name="repair_content">'+details_text+'</textarea></td>';
				str += '<td>';
				str += '<select name="repair_code">';
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
				str += '<td><input type="text" maxlength="3" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" name="repair_count" value="1" id="" class="count">';
				str += '<div><a class="bt_up">▲</a><a class="bt_down">▼</a></div>';
				str += '</td>';
				str += '<td name="'+tprice+'" class="tprice">'+tprice+'원';
				str += '</td>';
				str += '<input class="repair_price" type="hidden" name="repair_price" value="'+tprice+'">';
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
					pricearr.push(tr.eq(i).children().eq(5).text())
				});
				//tr이 지금 두개라 구분창 말고 값가진 애들만 받기위해 한번 더 돌림 i를 1로.
				for(var i = 1; i<pricearr.length;i++){
					sum += parseInt(pricearr[i].split('원')[0]);
				}
				$(".tot_price").html(numberFormat(sum));
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
				$(".repair_price").val(num*price);
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

			/* 숫자 3자리마다 쉼표 넣어줌 */
			numberFormat = function(inputNumber) {
				   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
			
			//장바구니 클릭 시
			$(document).on('click','.gocart',function(event) {
				var member_id = "<%=session.getAttribute("member_id") %>";
				if(member_id=="null"){
					alert('로그인 후 이용 가능합니다.');
					location.href='login.do';
					return false;
				}
				if($(".tot_price").text()==0){
					alert('수선 내용이 없습니다.');
					return false;
				}
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
				<h2>수선 서비스</h2>
			</div>
			<div class="mending">
				<p>※ 수선만 가능한 페이지입니다. 수선할 옷에 세탁 서비스도 이용하실 예정이시면 세탁 페이지를 이용해주세요.</p>
				<div class="tabs">
					<div class="tab-list">
						<a href="#one" id="tab" class="tab active">상의</a>
						<a href="#two" id="tab" class="tab">하의</a>
						<a href="#three" id="tab" class="tab">아우터</a>
					</div>
				</div>

				<div id="one" class="tab-content show">
					<ul class="top">
						<li class="mending-list" value="소매줄임">소매줄임<br><span>원</span><span class="price">5000</span></li>
						<li class="mending-list" value="기장줄임">기장줄임<br><span>원</span><span class="price">5000</span></li>
						<li class="mending-list" value="단추수선">단추수선<br><span>원</span><span class="price">2000</span></li>
						<li class="mending-list" value="튿어짐">튿어짐<br><span>원</span><span class="price">7000</span></li>
					</ul>
					<ul class="top">
						<li class="mending-list" value="지퍼수선">지퍼수선<br><span>원</span><span class="price">16000</span></li>
						<li></li>
						<li></li>
						<li></li>
					</ul>
					<ul class="details">
						<li><img src="images/top.png" alt="상의"></li>
						<li>
							<div class="top_size_input">
								<div class="size_input">
									<p id="left">- <input type="text" maxlength="2" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"></p>
									<p id="right">- <input type="text" maxlength="2" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"></p>
									<p id="length">- <input type="text" maxlength="2" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"></p>
								</div>
							</div>
							<form>
								<div class="hash">
								</div>
								<p>※ 왼쪽 소매 줄임 : - <input type="text" class="left_length" value="" disabled>cm</p>
								<p>※ 오른쪽 소매 줄임 : - <input type="text" class="right_length"value="" disabled>cm</p>
								<p>※ 총기장(기장 줄임) : - <input type="text" class="total_length" value="" disabled>cm</p>
								<p>※ <input type="file" name="file" value="file" style="width:92%; display:inline;" multiple></p>
								<textarea class="details_text" placeholder="추가 요청사항이 있다면 알려주세요."></textarea>
								<a class="add_button" href="javascript:">추가</a>
							</form>
						</li>
					</ul>
					<p>※ 단추 수선은 헐렁이거나 떨어진 단추를 달아드리는 상품이며, 단추가 없을 시 유사한 단추로 달아드립니다. 수선하실 단추 수량만큼 추가해 주세요.<br><br><br></p>
				</div>
				
				<div id="two" class="tab-content">
					<ul class="top">
						<li class="mending-list" value="허리줄임">허리줄임<br><span>원</span><span class="price">5000</span></li>
						<li class="mending-list" value="기장줄임">기장줄임<br><span>원</span><span class="price">5000</span></li>
						<li class="mending-list" value="단추수선">단추수선<br><span>원</span><span class="price">2000</span></li>
						<li class="mending-list" value="튿어짐">튿어짐<br><span>원</span><span class="price">7000</span></li>
					</ul>
					<ul class="top">
						<li class="mending-list" value="지퍼수선">지퍼수선<br><span>원</span><span class="price">12000</span></li>
						<li></li>
						<li></li>
						<li></li>
					</ul>
					<ul class="details">
						<li><img src="images/bottom.png" alt="하의"></li>
						<li>
							<div class="bottom_size_input">
								<div class="size_input">
									<p id="left">- <input type="text" maxlength="2" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"></p>
									<p id="right">- <input type="text" maxlength="2" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"></p>
									<p id="length">- <input type="text" maxlength="2" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"></p>
								</div>
							</div>
							<form>
								<div class="hash">
								</div>
								<p>※ 왼쪽 기장 줄임 : - <input type="text" class="left_length" value="" disabled>cm</p>
								<p>※ 오른쪽 기장 줄임 : - <input type="text" class="right_length" value="" disabled>cm</p>
								<p>※ 허리 줄임 : - <input type="text" class="total_length" value="" disabled>cm</p>
								<p>※ <input type="file" name="file" value="file" style="width:92%; display:inline;" multiple></p>
								<textarea class="details_text" placeholder="추가 요청사항이 있다면 알려주세요."></textarea>
								<a class="add_button" href="javascript:">추가</a>
							</form>
						</li>
					</ul>
					<p>※ 단추 수선은 헐렁이거나 떨어진 단추를 달아드리는 상품이며, 단추가 없을 시 유사한 단추로 달아드립니다. 수선할 단추 수량만큼 눌러주세요.<br><br><br></p>
				</div>
				
				<div id="three" class="tab-content">
					<ul class="top">
						<li class="mending-list" value="소매줄임">소매줄임<br><span>원</span><span class="price">5000</span></li>
						<li class="mending-list" value="기장줄임">기장줄임<br><span>원</span><span class="price">5000</span></li>
						<li class="mending-list" value="단추수선">단추수선<br><span>원</span><span class="price">2000</span></li>
						<li class="mending-list" value="튿어짐">튿어짐<br><span>원</span><span class="price">10000</span></li>
					</ul>
					<ul class="top">
						<li class="mending-list" value="지퍼수선">지퍼수선<br><span>원</span><span class="price">20000</span></li>
						<li></li>
						<li></li>
						<li></li>
					</ul>
					<ul class="details">
						<li><img src="images/outer.png" alt="아우터"></li>
						<li>
							<div class="outer_size_input">
								<div class="size_input">
									<p id="left">- <input type="text" maxlength="2" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"></p>
									<p id="right">- <input type="text" maxlength="2" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"></p>
									<p id="length">- <input type="text" maxlength="2" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"></p>
								</div>
							</div>
							<form>
								<div class="hash">
								</div>
								<p>※ 왼쪽 소매 줄임 : - <input type="text" class="left_length" value="" disabled>cm</p>
								<p>※ 오른쪽 소매 줄임 : - <input type="text" class="right_length" value="" disabled>cm</p>
								<p>※총기장(기장 줄임) : - <input type="text" class="total_length" value="" disabled>cm</p>
								<p>※ <input type="file" name="file" value="file" style="width:92%; display:inline;" multiple></p>
								<textarea class="details_text" placeholder="추가 요청사항이 있다면 알려주세요."></textarea>
								<a class="add_button" href="javascript:">추가</a>
							</form>
						</li>
					</ul>
					<p>※ 단추 수선은 헐렁이거나 떨어진 단추를 달아드리는 상품이며, 단추가 없을 시 유사한 단추로 달아드립니다. 수선하실 단추 수량만큼 추가해 주세요.<br><br><br></p>
				</div>
				
				<p>※ 받으신 웰컴키트 안 '택'에  선택하신 택 코드를 동일하게 적어서 보내주세요.</p>
				<form name="mendingform" action="./mending.do" method="post" enctype="multipart/form-data">
					<table class="mending_order">
						<tr class="mending_order_title">
							<td width="5%"><input type="checkbox" id = "allcheck" checked></td>
							<td style="width:20%;">구분</td>
							<td style="width:25%;">택코드</td>
							<td style="width:25%;">수량</td>
							<td style="width:25%;">합계</td>
						</tr>
					</table>
					
					<div class="total_price">
						<p>수선비 총 금액 : <span class="tot_price">0</span>원</p>
					</div>
					<div class="total-button">
						<input type="submit" value="장바구니" class="gocart">
						<input type="button" value="선택삭제" class="chkdelete">
					</div>
				</form>
			</div>
		</div>
	</section>
	
	<div id="footer"></div>
</body>
</html>