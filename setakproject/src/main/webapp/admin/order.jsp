<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import = "com.spring.order.OrderVO" %>
<%@ page import = "java.util.ArrayList" %>

<%
	ArrayList<OrderVO> orderList = (ArrayList<OrderVO>)request.getAttribute("orderList");
	int orderCount = (int)request.getAttribute("orderCount"); 
	 
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>세탁곰 관리자페이지</title>
	<link rel = "shortcut icon" href = "../favicon.ico">
	<link rel="stylesheet" type="text/css" href="../css/admin.css"/>
	<link rel="stylesheet" type="text/css" href="../css/adminorder.css"/><!-- 여기 본인이 지정한 css로 바꿔야함 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	
	<!-- 우편번호 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>   
	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	
	<!-- datepicker -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	<script type="text/javascript">
		$(document).ready(function() {
			
			page(); 
			
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
            $("#datepicker").datepicker({
            	onClose: function(selectedDate) {    
                    $("#datepicker2").datepicker( "option", "minDate", selectedDate );
                    $("img.ui-datepicker-trigger").attr("style", "margin-left:2px; vertical-align:middle; cursor: Pointer;"); 
                }
            });                    
            $("#datepicker2").datepicker({
                onClose: function(selectedDate) {
                    $("#datepicker").datepicker( "option", "maxDate", selectedDate );
                    $("img.ui-datepicker-trigger").attr("style", "margin-left:2px; vertical-align:middle; cursor: Pointer;"); 
                }    
            });
            
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
			
			// 전체선택
			$("#allcheck").click(function(){
		        if($("#allcheck").prop("checked")){
		            $("input[name=chk]").prop("checked",true);
		        }else{
		            $("input[name=chk]").prop("checked",false);
		        }
		    })
			
			// 정렬
			$('#order-select').change(function() {
				searchOrder();
			});
			
    		// 서비스 중 상태에서만 배송번호 입력 가능 
			$('#detailOrderStatus').change(function() {
				
        		var status = $('#detailOrderStatus').val();
        		console.log(status); 
        		if(status == '서비스중') {
        			$('#deliveryNum').prop('readonly', false); 
        		}else {
        			$('#deliveryNum').prop('readonly', true);
        		}
        			
			});
			
			
			// 주문 상세 수정
			$('#detail-submit-btn').on("click", function() {
				
				if(confirm("수정 하시겠습니까?")) {
					var addr = $("#detail-addr1").val() + '!' + $("#detail-addr2").val();
					
					var param = {
							order_num : $("#detailOrderNum").text(),
							order_status : $("#detailOrderStatus").val(),
							order_delicode : $("#deliveryNum").val(),
							order_name : $("#detail-human").val(), 
						 	order_phone : $("#detail-phone").val(),
						 	order_zipcode : $("#detail-zipcode").val(),
							order_address : addr,
							order_request : $("#detail-request").val()
					};
					
					$.ajax({
						url:'/setak/admin/orderUpdate.do', 
						type:'POST',
						data:param,
						dataType:"json", //리턴 데이터 타입
						contentType:'application/x-www-form-urlencoded; charset=utf-8',
						success:function(data) {	
							
							var loc = data.order_address;
				       		var locSplit = loc.split('!');
				    		var addr1 = locSplit[0];
				    		var addr2 = locSplit[1];
				    		
			        		if(addr2 == null) {
			        			addr2 = '';
			        		}  
			        		
			        		var delicode = data.order_delicode;
			        		if(delicode == null) {
			        			delicode = ''; 
			        		}

							$("#detailOrderStatus").val(data.order_status);
							$("#deliveryNum").val(data.order_delicode);
							$("#detail-human").val(data.order_name);
							$("#detail-phone").val(data.order_phone);
							$("#detail-zipcode").val(data.order_zipcode);
							$("#detail-addr1").val(addr1);
							$("#detail-addr2").val(addr2);
							$("#detail-request").val(data.order_request);
							
							searchOrder();
						},
						error: function() {
							alert("ajax통신 실패");
					    }
					});	
				}
				
			});
			
			// 입력창  한글 금지 > 검색어, 배송번호, 휴대폰번호
			$("#keyword, #deliveryNum, #detail-phone").on("keyup", function() { 
				$(this).val($(this).val().replace(/[^0-9a-z]/g,"")); 
			});
			
			// 선택 주문 상태 변경
			$("#update-btn").click(function(){
				
				var select_status = $("#status-select").val();
				
				var orderNumArr = []; 
				var checkbox = $("input[name=chk]:checked");
				
	     		checkbox.each(function() {
	     			var chk = $(this);
	     			var order_num = chk.parent().parent().children().eq(1).children().val();
	     			orderNumArr.push(order_num);
	     		});
	     		
				$.ajax({
					url:'/setak/admin/statusUpdate.do', 
					type:'POST',
					data: { 
						orderNumArr : orderNumArr, 
						order_status : select_status
						},
					traditional : true,
					dataType:"json", //리턴 데이터 타입
					contentType:'application/x-www-form-urlencoded; charset=utf-8',
					success:function(data) {
						alert("성공"); 				
					},
					error: function() {
						alert("ajax통신 실패");
				    }
				});
	     		
			});

		});
		
		// 상세주소 레이어 스크립트 
		 function layerOrderDetail(type, value) {

	        if(type == 'open') {
	        	
	            // 팝업창을 연다.            
	            jQuery('#layer-div').attr('style','display:block');
	            jQuery('#popup-div').attr('style','display:block');
	            
	            var param = {'order_num' : value }; 
				$.ajax({
					url:'/setak/admin/orderSelect.do', 
					type:'POST',
					data:param,
					dataType:"json", //리턴 데이터 타입
					contentType:'application/x-www-form-urlencoded; charset=utf-8',
					success:function(data) {
						
						var loc = data.order_address;
			       		var locSplit = loc.split('!');
			    		var addr1 = locSplit[0];
			    		var addr2 = locSplit[1];
			    		
		        		if(addr2 == null) {
		        			addr2 = '';
		        		}  
		        		
		        		var delicode = data.order_delicode;
		        		if(delicode == null) {
		        			delicode = ''; 
		        		}
						
		        		// 서비스 중 상태에서만 배송번호 입력 가능 
		        		var status = data.order_status;
		        		console.log(status); 
		        		if(status == '서비스중') {
		        			$('#deliveryNum').prop('readonly', false); 
		        		}else {
		        			$('#deliveryNum').prop('readonly', true);
		        		}
		        				        		
						$("#detailOrderNum").text(data.order_num);
						$("#detailOrderDate").text('20'+data.order_date);
						$("#deliveryPrice").text(data.order_price);
						$("#detailOrderStatus").val(status);
						$("#deliveryNum").val(data.order_delicode);
						$("#deliveryPrice").text(data.order_price+'원');
						
						$("#detail-human").val(data.order_name);
						$("#detail-phone").val(data.order_phone);
						$("#detail-zipcode").val(data.order_zipcode);
						$("#detail-addr1").val(addr1);
						$("#detail-addr2").val(addr2);
						$("#detail-request").val(data.order_request);
					},
					error: function() {
						alert("ajax통신 실패");
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
			
			$('#result-second-pager').empty(); 
			
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
     		}     		
     		
			var orderBy = $("#order-select").val();
			$('#result-table tbody').empty();
			var param = {
							startDate : start,
							endDate : end,
							statusArr : statusArr, 
							searchType : $('#searchType').val(),
							keyword : $('#keyword').val(),
							orderBy : orderBy,
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
					
					if($("#allcheck").prop("checked")){
						 $("#allcheck").prop("checked",false);
					}
					
					 var count = data.orderSearchCount;
					 $("#result-num").text(count); 
					 
					 var list = data.orderSearchList;

					 
					 if(list.length == 0) {
						 var output = '';
						 
						 output += '<tr>';
						 output += '<td colspan = "8">검색 결과가 없습니다.</td>';
						 output += '</tr>';
						 
						 $('#result-table tbody').append(output); 
						 return; 
					 }
					 
					 
					 $.each(list, function(index, item) {
						 
						 var orderDate = item.order_date; 
						 var dateArr = orderDate.split(" ");
						 var date = dateArr[0];
						 
						 var delicode = item.order_delicode;
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
					 
					 page();

				},
				error: function() {
					alert("ajax통신 실패!!!");
			    }
			});
		}
		
		//우편번호 api
	    function execDaumPostcode() {

	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	                
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("extraAddress").value = extraAddr;	

	                
	                } else {
	                	document.getElementById("extraAddress").value = '';		                    
	                }
	                
	                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                    document.getElementById('detail-zipcode').value = data.zonecode;
	                    document.getElementById("detail-addr1").value = addr;
	                    // 커서를 상세주소 필드로 이동한다.
	                    document.getElementById("detail-addr2").value = ""; 
	                    document.getElementById("detail-addr2").focus();                	

	            }
	        }).open();
	    }

		//만들어진 테이블에 페이지 처리
		function page(){
						
			$('#result-table-tbody').each(function() {
				
				var pagesu = 10;  //페이지 번호 갯수		
				var currentPage = 0;		
				var numPerPage = 20;  //목록의 수		
				var $table = $(this);
				var tr = $('#result-table tbody tr');
				//length로 원래 리스트의 전체길이구함
				var numRows = tr.length;//10
				//Math.ceil를 이용하여 반올림
				var numPages = Math.ceil(numRows / numPerPage);
				//리스트가 없으면 종료
				if (numPages==0) return;
				//pager라는 클래스의 div엘리먼트 작성 > 페이징 하는 부분
				var $pager = $('<td align="center" id="remo" colspan="10"><div class="pager"></div></td>');
				var nowp = currentPage;
				var endp = nowp+10;
				//페이지를 클릭하면 다시 셋팅
				$table.bind('repaginate', function() {
				//기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
				$table.find('tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();						
				$("#remo").html("");		
				if (numPages > 1) { // 한페이지 이상이면
					if (currentPage < 5 && numPages-currentPage >= 5) { // 현재 5p 이하이면
				   		nowp = 0;     // 1부터 
				    	endp = pagesu;    // 10까지
					}else{
				    	nowp = currentPage -5;  // 6넘어가면 2부터 찍고
				   	 	endp = nowp+pagesu;   // 10까지
				    	pi = 1;
					}
					if (numPages < endp) {   // 10페이지가 안되면
						endp = numPages;   // 마지막페이지를 갯수 만큼
				    	nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
					}
					if (nowp < 1) {     // 시작이 음수 or 0 이면
				    	 nowp = 0;     // 1페이지부터 시작
				 	}
				}else{       // 한페이지 이하이면
				    nowp = 0;      // 한번만 페이징 생성
				    endp = numPages;
				}
				
				// [<<]
				$('<br /><span class = "page-number" cursor: "pointer"><<</span>').bind('click', {newPage: page},function(event) {
					currentPage = 0;   
				    $table.trigger('repaginate');  
				    $($(".page-number")[2]).addClass('pageClick').siblings().removeClass('pageClick');
				    $("html, body").animate({ scrollTop : 0 }, 500);
				}).appendTo($pager).addClass('clickable');
				
				// [<]
				$('<span class="page-number" cursor: "pointer"><</span>').bind('click', {newPage: page},function(event) {
				    if(currentPage == 0) return; 
				    currentPage = currentPage-1;
				    $table.trigger('repaginate'); 
				    $($(".page-number")[(currentPage-nowp)+2]).addClass('pageClick').siblings().removeClass('pageClick');
				    $("html, body").animate({ scrollTop : 0 }, 500);
				}).appendTo($pager).addClass('clickable');
				
				// [1,2,3,4,5,6,7,8]
				for (var page = nowp ; page < endp; page++) {
					$('<span class="page-number" cursor: "pointer"></span>').text(page + 1).bind('click', {newPage: page}, function(event) {
				    currentPage = event.data['newPage'];
				    $table.trigger('repaginate');
				    $($(".page-number")[(currentPage-nowp)+2]).addClass('pageClick').siblings().removeClass('pageClick');
				    $("html, body").animate({ scrollTop : 0 }, 500);
				    }).appendTo($pager).addClass('clickable');
				} 
				
				// [다음]
				$('<span class="page-number" cursor: "pointer">></span>').bind('click', {newPage: page},function(event) {
				    if(currentPage == numPages-1) return;
				    currentPage = currentPage+1;
				    $table.trigger('repaginate'); 
				    $($(".page-number")[(currentPage-nowp)+2]).addClass('pageClick').siblings().removeClass('pageClick');
				    $("html, body").animate({ scrollTop : 0 }, 500);
				}).appendTo($pager).addClass('clickable');
				
				// [끝]
				$('<span class="page-number" cursor: "pointer">>></span>').bind('click', {newPage: page},function(event) {
				    currentPage = numPages-1;
				    $table.trigger('repaginate');
				    $($(".page-number")[endp-nowp+1]).addClass('pageClick').siblings().removeClass('pageClick');
				    $("html, body").animate({ scrollTop : 0 }, 500);
				}).appendTo($pager).addClass('clickable');
				$($(".page-number")[2]).addClass('pageClick');
				
			 });
				
			 $pager.insertAfter($table.find('span.page-number:first').next().next().addClass('pageClick'));   
			 $pager.appendTo($('#result-second-pager'));
			 $table.trigger('repaginate');
		  });
		}

        // 엔터키가 눌렸을 때 실행할 내용
		function enterkey() {
	        if (window.event.keyCode == 13) {
	             searchOrder();
	        }
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
								<input id = "keyword" type = "text" size = "40px" placeholder = "내용을 입력해주세요." onkeyup="enterkey();" /> 
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
								<input id = "datepicker" name = "search_start" class = "search-date" type = "text" size = "10px" readonly />
								~
								<input id = "datepicker2" name = "search_end" class = "search-date" type = "text" size = "10px" readonly/>
								
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
						검색 <span id="result-num"><b></b></span>건
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
								<th class = "check"><input id = "allcheck" type = "checkbox" /></th>
								<th>주문번호</th>
								<th>아이디</th>
								<th>받는사람</th>
								<th>주문날짜</th>
								<th>결제금액</th>
								<th>배송번호</th>
								<th>주문상태</th>
							</tr>
						</thead>
						<tbody id = "result-table-tbody" class = "repaginate">
						<%for(int i = 0; i < orderList.size(); i++) {
							OrderVO ovo = orderList.get(i);
							
							String date = ovo.getOrder_date();
							String[] dateArr = date.split(" ");
							String orderDate = dateArr[0]; 	
							
							String order_delicode = "-"; 
							if(ovo.getOrder_delicode() != null) {
								order_delicode = ovo.getOrder_delicode();
							}
							
						%>
							<tr>
								<td class = "check"> <input type = "checkbox" name = "chk"/> </td>
								<td><input id="orderNumBtn" class = "orderNum" type = "button" onclick = "layerOrderDetail('open', '<%=ovo.getOrder_num()%>')" value = "<%=ovo.getOrder_num() %>" /></td>
								<td><%=ovo.getMember_id() %></td>
								<td><%=ovo.getOrder_name() %></td>
								<td>20<%=orderDate %></td>
								<td><%=ovo.getOrder_price() %>원</td>
								
								<td><span id = "delivery_num"><%=order_delicode%></span></td>
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
							<option value = "결제완료">결제완료</option>
							<option value = "수거중">수거중</option>
							<option value = "서비스중">서비스중</option>
							<option value = "배송중">배송중</option>
							<option value = "배송완료">배송완료</option>
							<option value = "주문취소">주문취소</option>
						</select>
						 상태로 변경
						<input type = "button" id = "update-btn" value = "변경"/>
					</div>
				</div>
				<!-- 결과 테이블 상태 변경 div 끝-->
			
				<!-- 결과 페이징 div 시작 -->
				<div id="result-paging-div">
				
				<div id = "result-second-pager">
				</div>
				
				</div>
				<!-- 결과 페이징 div 끝 -->
		<!-- 결과  div 끝-->
		
	<!-- 주문 상세보기 레이어 -->
   <section id = "detail">
   	<div id = "layer-div" class = "layer-card">
		<div id = "popup-div">
			<div class="popup-title">
				<h2>주문 상세정보 </h2>
			</div>
			<div class="popup-content">
				
				<!-- 주문정보 div 시작 -->
				<div id = "detail-order-div">
					<p class = "detail-title">주문정보</p>
					<table id = "detail-table">
						<thead>
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
								<td>
									<select id = "detailOrderStatus">
										<option value = "결제완료">결제완료</option>
										<option value = "수거중">수거중</option>
										<option value = "서비스중">서비스중</option>
										<option value = "배송중">배송중</option>
										<option value = "배송완료">배송완료</option>
										<option value = "주문취소">주문취소</option>
									</select>
								</td>
								<td>배송번호</td>
								<td><input id = "deliveryNum" type = "text" /></td>
							</tr>
						</thead>
						<tbody>

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
								<td><input id = "detail-human" type = "text" style = "width : 80px;"/></td>
								<td>휴대폰</td>
								<td><input id = "detail-phone" type = "text" style = "width : 100px;" /></td>
							</tr>
							<tr>
								<td>우편번호</td>
								<td>
									<input id = "detail-zipcode" type = "text" readonly style = "width : 45px;" />
									<input type = "button" value = "우편번호 검색" onclick = "execDaumPostcode();"/>
								</td>
							<tr>
								<td>주소</td>
								<td><input id = "detail-addr1" type = "text" style = "width : 180px;" /></td>
								<td>상세주소</td>
								<td>
									<input id = "detail-addr2" type = "text" style = "width : 230px;" />
									<input id="extraAddress" type="hidden" placeholder="참고항목">
								</td>
							</tr>
							<tr>
								<td>요청사항</td>
								<td colspan = "3">
									<textarea id = "detail-request" cols = "90" rows = "5"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 수취인 정보 div 끝-->

				<!-- 버튼 div -->				
				<div id = "detail-btn-div">
					<input id = "detail-submit-btn" type = "button" value = "확인"/>
					<input id = "detail-close-btn" type = "button" value = "닫기" onclick = "layerOrderDetail('close')"/>
				</div>
			</div>
		</div>
   	</div>
   </section>
   
	</div><!-- 지우지마세요 -->
</body>
</html>
