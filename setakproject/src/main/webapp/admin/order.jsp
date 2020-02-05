<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import = "com.spring.order.OrderVO" %>
<%@ page import = "java.util.ArrayList" %>

<%
	ArrayList<OrderVO> orderList = (ArrayList<OrderVO>)request.getAttribute("orderList");
	int orderCount = (int)request.getAttribute("orderCount"); 
	
	int limit = ((Integer)request.getAttribute("limit")).intValue();
	int nowpage = ((Integer)request.getAttribute("page")).intValue();
	int maxpage = ((Integer)request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer)request.getAttribute("startpage")).intValue();
	int endpage = ((Integer)request.getAttribute("endpage")).intValue();
	int listcount = ((Integer)request.getAttribute("listcount")).intValue();
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>세탁곰 관리자페이지</title>
	<link rel="stylesheet" type="text/css" href="../css/admin.css"/>
	<link rel="stylesheet" type="text/css" href="../css/adminorder.css"/><!-- 여기 본인이 지정한 css로 바꿔야함 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	
	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	
	<!-- datepicker -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	<script type="text/javascript">
		$(document).ready(function() {
			//헤더, 푸터연결
			$("#admin").load("./admin.jsp")
			
			//전체 주문 개수
			var resultNum = <%=orderCount%>;
			$("#result-num").text(resultNum); 
						
			//datePicker
			$.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                ,buttonImage: "https://img.icons8.com/ultraviolet/20/000000/planner.png" //버튼 이미지 경로
                ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,minDate: "-2Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "today" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)      
            });
			 
            //input을 datepicker로 선언
            $("#datepicker").datepicker();                    
            $("#datepicker2").datepicker();
            
			$("img.ui-datepicker-trigger").attr("style", "margin-left:2px; vertical-align:middle; cursor: Pointer;"); 
			
			//요일 버튼 누르기
			$(".search-date-btn").on("click", function() {
				$(".search-date-btn").removeClass("active");
				$(this).addClass("active");
				
				var select_btn = $(this).val(); 

				if(select_btn == '오늘') {
		            $('#datepicker').datepicker('setDate', 'today');
		            $('#datepicker2').datepicker('setDate', 'today');
				}else if(select_btn == '일주일') {
		            $('#datepicker').datepicker('setDate', '-7D');
		            $('#datepicker2').datepicker('setDate', 'today');					
				}else if(select_btn == '1개월') {
		            $('#datepicker').datepicker('setDate', '-1M');
		            $('#datepicker2').datepicker('setDate', 'today');					
				}else if(select_btn == '3개월') {
		            $('#datepicker').datepicker('setDate', '-3M');
		            $('#datepicker2').datepicker('setDate', 'today');					
				}else if(select_btn == '6개월') {
		            $('#datepicker').datepicker('setDate', '-6M');
		            $('#datepicker2').datepicker('setDate', 'today');					
				}else {
		            $('#datepicker').datepicker('setDate', '-1Y');
		            $('#datepicker2').datepicker('setDate', 'today');					
				}
				
			});
			
			// 초기화 버튼
			$("#reset-btn").on("click", function() {
				$("#searchType").val("order_num"); 
				$("#keyword").val(""); 
				$("input[name=check]").prop("checked",false);
	            $('#datepicker').val("");
	            $('#datepicker2').val("");
			});
			
			// 정렬
			$('#order-select').change(function() {
				searchOrder();
			});

		});
		
		// 나의주소록 레이어 스크립트
		 function layerOrderDetail(type, value) {

	        if(type == 'open') {
	        	
	            // 팝업창을 연다.            
	            jQuery('#layer-div').attr('style','display:block');
	            jQuery('#popup-div').attr('style','display:block');
	            
	            var param = {'order_num' : value}
				$.ajax({
					url:'/setak/admin/orderSelect.do', 
					type:'POST',
					data:param,
					dataType:"json", //리턴 데이터 타입
					contentType:'application/x-www-form-urlencoded; charset=utf-8',
					success:function(data) {	
						
						$("#detailOrderNum").text(data.order_num);
						$("#detailOrderDate").text(data.order_date);
						$("#deliveryPrice").text(data.order_price);
						$("#detailOrderStatus").text(data.order_status);
						$("#deliveryNum").text(data.order_delicode);
						$("#deliveryPrice").text(data.order_price+'원');
						
						$("#detail-human").val(data.order_name);
						$("#detail-phone").val(data.order_phone);
						$("#detail-zipcode").val(data.order_zipcode);
						$("#detail-addr1").val(data.order_addr1);
						$("#detail-addr2").val(data.order_addr2);
						$("#detail-request").val(data.order_request);
					},
					error: function() {
						alert("ajax통신 실패!!!");
				    }
				});
				
	            // 스크롤 없애기
	            $("body").css("overflow","hidden");
	            
	            // 페이지를 가리기위한 레이어 영역의 높이를 페이지 전체의 높이와 같게 한다.
	            jQuery('#layer-div').height(jQuery(document).height());
	        	
	        }
	       
	        else if(type == 'close') {
	            // 팝업창을 닫는다.
	            jQuery('#layer-div').attr('style','display:none');
	            $("body").css("overflow","scroll");            
	        }
	    }
		
		// 검색
		function searchOrder() {
			
			var checkbox = $("input[name=check]:checked");
			
			var statusArr = []; 
     		checkbox.each(function(){
     			var status = $(this).val(); 
     			statusArr.push(status);
     		});
     		
     		var start = $('#datepicker').val();
     		var end = $('#datepicker2').val(); 
     		
     		if(start == ""){
     			start = "2020-01-01"
     			
     			var dateObj = new Date();
     			var year = dateObj.getFullYear();
     			var month = dateObj.getMonth()+1;
     			var day = dateObj.getDate();
     			var today = year + "-" + month + "-" + day; 
     			end = today;
     			
     			console.log(today); 
     		}     		
     		
			var orderBy = $("#order-select").val();
			$('#result-table tbody').empty();
			var param = {
							startDate : start,
							endDate : end,
							statusArr : statusArr, 
							searchType : $('#searchType').val(),
							keyword : $('#keyword').val(),
							orderBy : orderBy
						};
			
			$.ajax({
				url:'/setak/admin/orderSearch.do', 
				type:'POST',
				data:param,
				traditional : true,
				dataType:"json", //리턴 데이터 타입
				contentType:'application/x-www-form-urlencoded; charset=utf-8',
				success:function(data) {	
					$("#result-table tbody").empty();
					
					 var count = data.orderSearchCount;
					 $("#result-num").text(count); 
					 
					 var list = data.orderSearchList;
					 
					 $.each(list, function(index, item) {
						 
						 var orderDate = item.order_date; 
						 var dateArr = orderDate.split(" ");
						 var date = dateArr[0];
						 
						 var output = '';
						 
						 output += '<tr>';
						 output += '<td class = "check"> <input type = "checkbox" /> </td>';
						 output += '<td><input class="orderNum" type="button" onclick="layerOrderDetail('+'\'open\',\''+item.order_num+'\''+')" value="'+item.order_num+'"/></td>';
						 output += '<td>'+item.member_id+'</td>';						 
						 output += '<td>'+item.order_name+'</td>';						 
						 output += '<td>20'+date+'</td>';
						 output += '<td>'+item.order_price+'원</td>';
						 output += '<td><span id = "delivery_num"></span></td>';	
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

	</script>
</head>
<body>
		<div id="admin"></div>
		<div class="content">
			<!-- 여기서부터 작업하세요. -->
			<h1>전체주문관리</h1>
			
			<!--필터 div 시작 -->
			<div id = "search-div">
				<h2>전체주문검색</h2>
				<form id = "search-form" action = "">
					<table id = "search-table">
						<tr>
							<td>주문검색</td>
							<td>
								<select id = "searchType" name = "cate-select">
									<option value = "order_num">주문 번호</option>
									<option value = "member_id">회원 아이디</option>
								</select>
								<input id = "keyword" type = "text" size = "40px" placeholder = "내용을 입력해주세요." /> 
							</td>
						</tr>
						<tr>
							<td>주문상태</td>
							<td>
								<label for = "orderStatus1"><input id="orderStatus1" name = "check" value = "결제완료" type = "checkbox">결제완료</label>
								<label for = "orderStatus2"><input id="orderStatus2" name = "check" value = "수거중"  type = "checkbox">수거중</label>
								<label for = "orderStatus3"><input id="orderStatus3" name = "check" value = "서비스중"  type = "checkbox">서비스중</label>
								<label for = "orderStatus4"><input id="orderStatus4" name = "check" value = "배송중"  type = "checkbox">배송중</label>
								<label for = "orderStatus5"><input id="orderStatus5" name = "check" value = "배송완료"  type = "checkbox">배송완료</label>
								<label for = "orderStatus6"><input id="orderStatus6" name = "check" value = "주문취소"  type = "checkbox">주문취소</label>
							</td>
						</tr>
						<tr>
							<td>주문일자</td>
							<td>
								<input id = "datepicker" name = "search_start" class = "search-date" type = "text" size = "10px"/>
								~
								<input id = "datepicker2" name = "search_end" class = "search-date" type = "text" size = "10px"/>
								
								<input type = "button" class = "search-date-btn" name = "order_date" id = "today" value = "오늘"/>
								<input type = "button"  class = "search-date-btn" name = "order_date" id = "today" value = "일주일"/>
								<input type = "button"  class = "search-date-btn" name = "order_date" id = "today" value = "1개월"/>
								<input type = "button"  class = "search-date-btn" name = "order_date" id = "today" value = "3개월"/>
								<input type = "button"  class = "search-date-btn" name = "order_date" id = "today" value = "6개월"/>
								<input type = "button"  class = "search-date-btn" name = "order_date" id = "today" value = "1년"/>
							</td>
						</tr>
					</table>
				</form>
				
				<div id="search-btn-div">
					<input type="button" id = "search-btn" value = "검색" onclick = "searchOrder();" />
					<button id = "reset-btn">초기화</button>
				</div>
			</div>
			<!--필터 div 끝 -->
			
			<!-- 결과  div 시작-->
			<div id="result-div">
			
				<!-- 결과 정렬 div 시작 -->
				<div id="result-first-div">
					<!-- 검색 결과 수 div-->
					<div id="result-num-div">
						검색 <span id="result-num"><b>3</b></span>건
					</div>
					
					<!-- 검색 정렬 방식 div-->
					<div id="result-order-div">
						<form id = "result-order">
							<select id = "order-select">
								<option value = "byDate">주문날짜순</option>
								<option value = "byDateReverse">주문날짜역순</option>
								<option value = "byName">주문자이름순</option>
							</select>
						</form>
					</div>					
				</div>
				<!-- 결과 정렬 div 끝 -->
				
				<!-- 결과 테이블 div 시작 -->
				<div id=result-second-div>
				
					<table id="result-table" class = "example">
						<thead>
							<tr>
								<th class = "check"><input type = "checkbox" /></th>
								<th>주문번호</th>
								<th>아이디</th>
								<th>받는사람</th>
								<th>주문날짜</th>
								<th>결제금액</th>
								<th>배송번호</th>
								<th>주문상태</th>
							</tr>
						</thead>
						<tbody>
						<%for(int i = 0; i < orderList.size(); i++) {
							OrderVO ovo = orderList.get(i);
							
							String date = ovo.getOrder_date();
							String[] dateArr = date.split(" ");
							String orderDate = dateArr[0]; 			
							
						%>
							<tr>
								<td class = "check"> <input type = "checkbox" /> </td>
								<td><input id="orderNumBtn" class = "orderNum" type = "button" onclick = "layerOrderDetail('open', '<%=ovo.getOrder_num()%>')" value = "<%=ovo.getOrder_num() %>" /></td>
								<td><%=ovo.getMember_id() %></td>
								<td><%=ovo.getOrder_name() %></td>
								<td>20<%=orderDate %></td>
								<td><%=ovo.getOrder_price() %>원</td>
								<td><span id = "delivery_num"></span></td>
								<td><%=ovo.getOrder_status() %></td>
							</tr>
						<%} %>
						
						</tbody>
					</table>


				</div>
				<!-- 결과 테이블 div 끝-->

				<!-- 결과 테이블 상태 변경 div 시작 -->
				<div id="result-third-div">
					<div id="status-update-div">
						선택한 주문건을 
						<select id = "status-select">
							<option>결제완료</option>
							<option>수거중</option>
							<option>서비스중</option>
							<option>배송중</option>
							<option>배송완료</option>
							<option>주문취소</option>
						</select>
						 상태로 변경
						<input type = "button" id = "update-btn" value = "변경"/>
					</div>
				</div>
				<!-- 결과 테이블 상태 변경 div 끝-->
			
				<!-- 결과 페이징 div 시작 -->
				<div id="result-paging-div">
				
				<table class="nlt3" align="center">	
					<tr align=center height=35  >
						<td colspan=7 >
						<% if(nowpage<=1) { %>
							< &nbsp;&nbsp;&nbsp;
							<% } else { %>
							<a href="./noticeList.do?page=<%=nowpage-1 %>"><img src="https://img.icons8.com/ultraviolet/20/000000/left-squared.png"></a>&nbsp;
							<% } %>
							
							<% for (int a=startpage; a<=endpage; a++) { 
									if(a==nowpage) { %>
										<%=a %>
										<% } else { %>
										<a href="./noticeList.do?page=<%=a %>" >&nbsp;<%=a %>&nbsp;</a>
								<% } %>
							<% } %>
							&nbsp;
							<% if (nowpage >= maxpage ) { %>
									&nbsp;&nbsp;&nbsp; >
								<% } else { %>
									<a href="./noticeList.do?page=<%=nowpage+1 %>"><img src="https://img.icons8.com/ultraviolet/20/000000/right-squared.png"></a>
							<% } %>
							</td>
						</tr>
				</table>				

				</div>
				<!-- 결과 페이징 div 끝 -->
			</div>
		<!-- 결과  div 끝-->
		
	<!-- 주문 상세보기 레이어 -->
   <section id = "detail">
   	<div id = "layer-div" class = "layer-card">
		<div id = "popup-div">
			<div class="popup-title">
				<h2>주문 상세정보 
				<button class = "popup-close" onclick = "layerOrderDetail('close')"><img src="https://img.icons8.com/ultraviolet/20/000000/close-window.png"></button>
				</h2>
			</div>
			<div class="popup-content">
				
				<!-- 주문정보 div 시작 -->
				<div id = "detail-order-div">
					<p class = "detail-title">주문정보</p>
					<table id = "detail-table">
						<tbody>
							<tr>
								<td>주문번호</td>
								<td><span id = "detailOrderNum"></span></td>
								<td>결제방법</td>
								<td>카드</td>
							</tr>
							<tr>
								<td>주문일자</td>
								<td><span id = "detailOrderDate"></span></td>
								<td>결제금액</td>
								<td><span id = "deliveryPrice"></span></td>
							</tr>
							<tr>
								<td>주문상태</td>
								<td><span id = "detailOrderStatus"></span></td>
								<td>배송번호</td>
								<td><input id = "deliveryNum" type = "text"/></td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 주문정보 div 끝-->
				
				<!-- 수취인 정보 div 시작 -->
				<div id = "detail-info-div">
					<p class = "detail-title">수취인정보</p>
					<table id = "detail-get-table">
						<tbody>
							<tr>
								<td>받는사람</td>
								<td><input id = "detail-human" type = "text" value = "" /></td>
								<td>휴대폰</td>
								<td><input id = "detail-phone" type = "text" value = "" /></td>
							</tr>
							<tr>
								<td>우편번호</td>
								<td>
									<input id = "detail-zipcode" type = "text" value = "" readonly />
									<input type = "button" value = "우편번호 검색" />
								</td>
							<tr>
								<td>주소</td>
								<td><input id = "detail-addr1" type = "text" value = "" /></td>
								<td>상세주소</td>
								<td><input id = "detail-addr2" type = "text" value = "" /></td>
							</tr>
							<tr>
								<td>요청사항</td>
								<td colspan = "3">
									<textarea id = "detail-request" cols = "75" rows = "3"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 수취인 정보 div 끝-->

				<!-- 버튼 div -->				
				<div id = "detail-btn-div">
					<input id = "detail-submit-btn" type = "button" value = "확인 "/>
				</div>
			</div>
		</div>
   	</div>
   </section>
   
	</div><!-- 지우지마세요 -->
</body>
</html>
