<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>세탁곰 관리자페이지</title>
	<link rel="stylesheet" type="text/css" href="../css/admin.css"/>
	<link rel="stylesheet" type="text/css" href="../css/adminorder.css"/><!-- 여기 본인이 지정한 css로 바꿔야함 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	
	<!-- datepicker -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	<script type="text/javascript">
		$(document).ready(function() {
			//헤더, 푸터연결
			$("#admin").load("./admin.jsp")
			
			//요일 버튼 누르기
			$(".search-date-btn").on("click", function() {
				$(".search-date-btn").removeClass("active");
				$(this).addClass("active");
			});
			
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

            $('#datepicker').datepicker('setDate', 'today');
            $('#datepicker2').datepicker('setDate', 'today');
            
			$("img.ui-datepicker-trigger").attr("style", "margin-left:2px; vertical-align:middle; cursor: Pointer;"); 
			
			// 초기화 버튼
			$(".reset-btn").on("click", function() {
				$("#search-content").val(" "); 
			});
			
		});
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
								<select id = "cate-select">
									<option>주문 번호</option>
									<option>회원 아이디</option>
								</select>
								<input id = "search-content" type = "text" size = "40px" placeholder = "내용을 입력해주세요." /> 
							</td>
						</tr>
						<tr>
							<td>주문상태</td>
							<td>
								<label for = ""><input type = "checkbox">결제완료</label>
								<label for = ""><input type = "checkbox">수거중</label>
								<label for = ""><input type = "checkbox">서비스중</label>
								<label for = ""><input type = "checkbox">배송중</label>
								<label for = ""><input type = "checkbox">배송완료</label>
								<label for = ""><input type = "checkbox">주문취소</label>
							</td>
						</tr>
						<tr>
							<td>주문일자</td>
							<td>
								<input id = "datepicker" class = "search-date" type = "text" size = "10px"/>
								~
								<input id = "datepicker2" class = "search-date" type = "text" size = "10px"/>
								<input class = "search-date-btn" id = "today" value = "오늘"/>
								<button class = "search-date-btn" id = "oneweek">일주일</button>
								<button class = "search-date-btn" id = "onemonth">1개월</button>
								<button class = "search-date-btn" id = "threemonth">3개월</button>
								<button class = "search-date-btn" id = "sixmonth">6개월</button>
							</td>
						</tr>
					</table>
				</form>
				
				<div id="search-btn-div">
					<button id = "search-btn">검색</button>
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
								<option>주문날짜순</option>
								<option>주문날짜역순</option>
								<option>주문번호순</option>
								<option>주문자이름순</option>
							</select>
						</form>
					</div>					
				</div>
				<!-- 결과 정렬 div 끝 -->
				
				<!-- 결과 테이블 div 시작 -->
				<div id=result-second-div>
					<ul class="example">
						<li class = "check"><input type = "checkbox" /></li>
						<li>주문번호</li>
						<li>아이디</li>
						<li>받는사람</li>
						<li>주문날짜</li>
						<li>결제금액</li>
						<li>배송번호</li>
						<li>주문상태</li>
					</ul>
					<ul>
						<li class = "check">
							<input type = "checkbox" />
						</li>
						<li>238428349023</li>
						<li>bit</li>
						<li>박비트</li>
						<li>2020-01-30</li>
						<li>100원</li>
						<li>dssdf</li>
						<li>asd</li>
					</ul>
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
					<img src="https://img.icons8.com/ultraviolet/20/000000/left-squared.png">
					1/1
					<img src="https://img.icons8.com/ultraviolet/20/000000/right-squared.png">
				</div>
				<!-- 결과 페이징 div 끝 -->
			</div>
		<!-- 결과  div 끝-->
	</div><!-- 지우지마세요 -->
</body>
</html>
