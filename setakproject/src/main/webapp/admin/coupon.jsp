<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>세탁곰 관리자페이지</title>
	<link rel="stylesheet" type="text/css" href="../css/admin.css"/>
	<link rel="stylesheet" type="text/css" href="../css/adminorder.css"/>
	<link rel="stylesheet" type="text/css" href="../css/admin_coupon.css"/><!-- 여기 본인이 지정한 css로 바꿔야함 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	
	<!-- datepicker -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	<script type="text/javascript">
		$(document).ready(function() {
			//헤더, 푸터연결
			$("#admin").load("./admin.jsp")
			
		
		//검색
		function searchOrder() {
			
			var checkbox = $("input[name=check]:checked");
			
			$.ajax({
				url:'/setak/admin/memberSearch.do', 
				type:'POST',
				data:param,
				traditional : true,
				dataType:"json", //리턴 데이터 타입
				contentType:'application/x-www-form-urlencoded; charset=utf-8',
				success:function(data) {	
					$("#result-table tbody").empty();
					
					if($("#allcheck").prop("checked")){
						 $("#allcheck").prop("checked",false);
					}
					
					 var count = data.orderSearchCount;
					 $("#result-num").text(count); 
					 
					 var list = data.orderSearchList;
					 
					 $.each(list, function(index, item) {
						 
						 var delicode = item.order_delicode;
						 console.log(delicode); 
						 if(delicode == null) {
							 delicode = "-"; 
						 }
						 
						 var output = '';
						 
						 output += '<tr>';
							 output += '<td class = "check"> <input type = "checkbox"  name = "chk"/> </td>';
						 output += '<td><input class="orderNum" type="button" onclick="layerOrderDetail('+'\'open\',\''+item.order_num+'\''+')" value="'+item.order_num+'"/></td>';
						 output += '<td>'+item.member_id+'</td>';						 
						 output += '<td>'+item.order_name+'</td>';						 
						 output += '<td>20'+date+'</td>';
						 output += '<td>'+item.order_price+'원</td>';
						 output += '<td><span id = "delivery_num">'+delicode+'</span></td>';	
						 output += '<td>'+item.order_status+'</td>';
						 output += '</tr>';
						 
						 $('#result-table tbody').append(output); 
					 });

				},
				error: function() {
					alert("ajax통신 실패!!!");
			    }
			});
		}	
			
			//목록 띄우기
			function selectData(){
				
				$.ajax({
					url : '/setak/Admin_CouponList.do',
					type : 'POST',
					dataType : 'json',
					contentType : 'application/x-www-form-urlencoded; charset=utf-8',
					success:function(data){
						$.each(data, function(index, item){
							var str = '';
							
							str += '<ul>'
							str += '<li class="listtd"><input type="checkbox"></li>';
							str += '<li class="listtd">' + item.member_id + '</li>';
							str += '<li class="listtd">' + item.coupon_name + '</li>';
							str += '<li class="listtd"><input type="date" class="coupon_day" name="coupon_start" value="' + item.coupon_start + '" disabled></li>';
							str += '<li class="listtd"><input type="date" class="coupon_day" name="coupon_end" value="' + item.coupon_end + '" disabled></li>';
							str += '<li class="listtd"><input type="date" class="coupon_day" name="coupon_useday" value="' + item.coupon_useday + '" disabled></li>';
							str += '<li class="listtd"><select class="coupon_use" name="coupon_use" disabled>';
							str += '<option value=' + item.coupon_use + '>'+ item.coupon_use +'</option>';
							str += '<option value="보관중">사용가능</option>';
							str += '<option value="부분반환">사용불가</option>';
							str += '</select></li>';
							str += '<li class="listtd"><a class="update">수정</a>';
							str += '<a style="display: none;" value="/setak/updateCoupon.do?coupon_seq=' + item.coupon_seq + '" class="after">수정</a></li>';
							str += '</ul>';
							$(".coupon_list").append(str);
						});
					},
					error:function(){
						alert("ajax통신 실패!!!");
					}
				});
			}
			
			selectData();	
			
			//수정버튼 클릭시
			$(document).on('click','.update',function(event) {
				$(".after").css("display","none");
				$(".update").css("display","block");
				$(".coupon_start").attr("disabled","disabled");
				$(".coupon_end").attr("disabled","disabled");
				$(".coupon_useday").attr("disabled","disabled");
				$(".coupon_use").attr("disabled","disabled");
				$(".coupon_start").removeClass("upadte_select");
				$(".coupon_end").removeClass("upadte_select");
				$(".coupon_useday").removeClass("upadte_select");
				$(".coupon_use").removeClass("upadte_select");
				$('.listtd').removeClass("update_count");
				
				$($(this).parent().children(".after")).css("display","block");
				$(this).css("display","none");
				$($(this).parent().parent().children().children('.coupon_start')).removeAttr("disabled");
				$($(this).parent().parent().children().children('.coupon_end')).removeAttr("disabled");
				$($(this).parent().parent().children().children('.coupon_useday')).removeAttr("disabled");
				$($(this).parent().parent().children().children('.coupon_use')).removeAttr("disabled");
				$($(this).parent().parent().children().children('.coupon_start')).addClass("upadte_select");
				$($(this).parent().parent().children().children('.coupon_end')).addClass("upadte_select");
				$($(this).parent().parent().children().children('.coupon_useday')).addClass("upadte_select");
				$($(this).parent().parent().children().children('.coupon_use')).addClass("upadte_select");
				$($(this).parent().parent().children('.listtd:nth-child(5)')).addClass("update_count"); //팝업창 누를 수 있게 됨
				
								
				//다른 수정버튼 눌렀을 때 기본값으로 돌리기 위해서
				$('#coupon_form')[0].reset();
			});

			//수정 활성화 됐을 때 종류 값 클릭시 팝업생성
			$(document).on('click','.update_count',function(event) {
				$(".popup_back").addClass("popup_on");
			});
			$(document).on('click','.close',function(event) {
	            $(".popup_back").removeClass("popup_on");
				$(".coupon-list").removeClass("tab_active");
	        });

			//팝업에서 탭 눌렀을 때
			$(".tab").on("click", function() {
				$(".tab").removeClass("tab_active");
				$(".tab-content").removeClass("show");
				$(this).addClass("tab_active");
				$($(this).attr("href")).addClass("show");
			});
			$(".coupon-list").on("click", function() {
				$(".coupon-list").removeClass("tab_active");
				$(this).addClass("tab_active");
			});
			
			//팝업에서 확인 눌렀을 때
			var popup_keep_cate = "";	//큰카테
			var popup_keep_kind = "";	//작은카테
			$(document).on('click','.commit',function(event) {
				popup_keep_cate = document.getElementsByClassName('tab tab_active');
	            popup_keep_kind = document.getElementsByClassName('keep-list tab_active');
	            
	            if(!$(".keep-list").hasClass("tab_active")){
					alert("종류를 선택하지 않았습니다.");
					return false;
				}
	            
	            //팝업닫기
	            $(".popup_back").removeClass("popup_on");

	            //옷종류 바꾼거 적용시키기 
	            $(update_keep_cate).val(popup_keep_cate[0].innerHTML);
	            $(update_keep_kind).val(popup_keep_kind[0].innerHTML);

	            $(".keep-list").removeClass("tab_active");
			});
			
			//수정 ajax
			$(document).on('click','.after', function(event){
				var cate = $(this).parents().eq(1).children().eq(12).children().val();
				var kind = $(this).parents().eq(1).children().eq(4).children().val();
				var count = $(this).parents().eq(1).children().eq(5).children().val();
				var box = $(this).parents().eq(1).children().eq(6).children().val();
				var sd = $(this).parents().eq(1).children().eq(7).children().val();
				var fd = $(this).parents().eq(1).children().eq(8).children().val();
				var now = $(this).parents().eq(1).children().eq(9).children().val();
				
				var params = {"keep_cate":cate,"keep_kind":kind,"keep_box":box,"keep_start":sd,"keep_end":fd,"keep_now":now,"keep_count":count}
				
				jQuery.ajax({
					url : $(this).attr("value"), 
					type : 'post',
					data : params,
					contentType : 'application/x-www-form-urlencoded;charset=utf-8',
					dataType : "json", //서버에서 보내줄 데이터 타입
					success:function(retVal){
						if(retVal.res == "OK"){
							$('.keep_list').empty()
							selectData();
						} else {
							alert("수정 실패");
						}
					},
					error:function(){
						alert("ajax통신 실패");
					}
				});
				event.preventDefault();
			}); 
			
		});
	</script>
</head>
<body>
		<div id="admin"></div>
		
		<div class="content">
			<!-- 여기서부터 작업하세요. -->
			<h1>전체쿠폰관리</h1>
			
			<!-- 필터 -->
			<div id = "search-div">
				<h2>전체쿠폰검색</h2>
				<form id = "search-form" action = "">
					<table id = "search-table">
						<tr>
							<td>회원 검색</td>
							<td>
								<input id = "keyword" type = "text" size = "40px" placeholder = "내용을 입력해주세요." /> 
							</td>
						</tr>
					</table>
				</form>
				
				<div id="search-btn-div">
					<input type="button" id = "search-btn" value = "검색" onclick = "searchOrder();" />
				</div>
			</div>			
			<!-- 필터 끝 -->
			
			
			<ul class="coupon_title">
				<li><input type="checkbox" id="allcheck"></li>
				<li>회원아이디</li>
				<li>쿠폰이름</li>
				<li>쿠폰부여날짜</li>
				<li>쿠폰만료날짜</li>
				<li>쿠폰사용날짜</li>
				<li>쿠폰사용여부</li>
				<li>수정</li>
			</ul>
			<form id="coupon_form">
				<div class="coupon_list paginated">
					<input type="button" value="선택삭제" class="checkdelete">
				</div>
			</form>


		</div>
		<!-- 결과  div 끝-->
	<!-- 지우지마세요 -->
</body>
</html>
