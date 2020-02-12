<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>세탁곰 관리자페이지</title>
	<link rel="stylesheet" type="text/css" href="../css/admin.css"/>
	<link rel="stylesheet" type="text/css" href="../css/adminorder.css"/><!-- 여기 본인이 지정한 css로 바꿔야함 -->
	<link rel="stylesheet" type="text/css" href="../css/example.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			//헤더, 푸터연결
			$("#admin").load("./admin.jsp")
		
			getMemberList();
			page(); 
			
			// 목록 띄우기
			function getMemberList() {
				$.ajax({
					url:'/setak/admin/getMemberSubList.do', 
					type:'POST',
					dataType:"json", //리턴 데이터 타입
					contentType:'application/x-www-form-urlencoded; charset=utf-8',
					success:function(data) {	
						$("#result-table tbody").empty();
						 $.each(data, function(index, item) {
							 
							 var washcnt = item.washcnt;
							 var shirtscnt = item.shirtscnt;
							 var drycnt = item.drycnt;
							 var blancketcnt = item.blacketcnt;
							 var deliverycnt = item.deliverycnt;
							 
							 var subs_water = item.subs_water;
							 var subs_shirts = item.subs_shirts;
							 var subs_dry = item.subs_dry;
							 var subs_blanket = item.subs_blanket;
							 var subs_delivery = item.subs_delivery;
							 
							 // 타임 스탬프 날짜 변환
							 var subs_start = item.subs_start;
							 var subs_end = item.subs_end;
							 
							 var startDate = new Date(subs_start);
							 var endDate = new Date(subs_end);
							 							 
							 var output = '';
							 
							 output += '<tr>';
							 output += '<td>'+item.member_id+'</td>';
							 output += '<td>'+item.subsname+'</td>';
							 
							 if(subs_water == 0) {
								 output += '<td>-</td>';	
							 }else {
								 output += '<td><input type = "text" value ="'+washcnt+'" style = "width : 20px;"/>&nbsp;/&nbsp;'+subs_water+'</td>';									 
							 }					 		
							 
							 if(subs_shirts == 0) {
								 output += '<td>-</td>';
							 }else {
								 output += '<td><input type = "text" value ="'+shirtscnt+'" style = "width : 20px;"/>&nbsp;/&nbsp;'+subs_shirts+'</td>';
							 }
							 
							 if(subs_dry == 0) {
								 output += '<td>-</td>';
							 }else {
								 output += '<td><input type = "text" value ="'+drycnt+'" style = "width : 20px;"/>&nbsp;/&nbsp;'+subs_dry+'</td>';
							 }
							 
							 if(subs_blanket == 0) {
								 output += '<td>-</td>'; 
							 }else {
								 output += '<td><input type = "text" value ="'+blancketcnt+'" style = "width : 20px;"/>&nbsp;/&nbsp;'+subs_blanket+'</td>';
							 }
							 output += '<td><input type = "text" value ="'+deliverycnt+'" style = "width : 20px;"/>&nbsp;/&nbsp;'+subs_delivery+'</td>';
							 output += '<td>'+timeSt(startDate)+'</td>';
							 output += '<td>'+timeSt(endDate)+'</td>';
							 output += '<td><input id = "updateBtn" class = "statusBtn" name="'+item.member_id+'" type = "button" value = "수정" />';
							 output += '<input id = "deleteBtn" class = "statusBtn" name="'+item.member_id+'" type = "button" value = "삭제" /></td>'
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
			
			$('#updateBtn').on("click", function() {
				var select_btn = $(this);
				// 여기 수정해야하는 부분...
			});

		});
		
		// 검색
		function subMemberSearch() {
			
			$('#result-second-pager').empty(); 
			
			var checkbox = $("input[name=check]:checked");
			
			var planArr = []; 
     		checkbox.each(function(){
     			var plan = $(this).val(); 
     			planArr.push(plan);
     			console.log(plan); 
     		});
     		
     		var orderBy = $("#order-select").val();
     		console.log(orderBy); 
     		
			$('#result-table tbody').empty();
			
			var param = {
							planArr : planArr, 
							keyword : $('#keyword').val(),
							orderBy : orderBy,
						};
			
			$.ajax({
				url:'/setak/admin/subMemberSearch.do', 
				type:'POST',
				data:param,
				traditional : true,
				dataType:"json", //리턴 데이터 타입
				contentType:'application/x-www-form-urlencoded; charset=utf-8',
				success:function(data) {	
					$("#result-table tbody").empty();

					console.log("성공 들어옴.."); 
					
					 $.each(data, function(index, item) {
						 
						 var washcnt = item.washcnt;
						 var shirtscnt = item.shirtscnt;
						 var drycnt = item.drycnt;
						 var blancketcnt = item.blacketcnt;
						 var deliverycnt = item.deliverycnt;
						 
						 var subs_water = item.subs_water;
						 var subs_shirts = item.subs_shirts;
						 var subs_dry = item.subs_dry;
						 var subs_blanket = item.subs_blanket;
						 var subs_delivery = item.subs_delivery;
						 
						 // 타임 스탬프 날짜 변환
						 var subs_start = item.subs_start;
						 var subs_end = item.subs_end;
						 
						 var startDate = new Date(subs_start);
						 var endDate = new Date(subs_end);
						 							 
						 var output = '';
						 
						 output += '<tr>';
						 output += '<td>'+item.member_id+'</td>';
						 output += '<td>'+item.subsname+'</td>';
						 
						 if(subs_water == 0) {
							 output += '<td>-</td>';	
						 }else {
							 output += '<td><input type = "text" value ="'+washcnt+'" style = "width : 20px;"/>&nbsp;/&nbsp;'+subs_water+'</td>';									 
						 }					 		
						 
						 if(subs_shirts == 0) {
							 output += '<td>-</td>';
						 }else {
							 output += '<td><input type = "text" value ="'+shirtscnt+'" style = "width : 20px;"/>&nbsp;/&nbsp;'+subs_shirts+'</td>';
						 }
						 
						 if(subs_dry == 0) {
							 output += '<td>-</td>';
						 }else {
							 output += '<td><input type = "text" value ="'+drycnt+'" style = "width : 20px;"/>&nbsp;/&nbsp;'+subs_dry+'</td>';
						 }
						 
						 if(subs_blanket == 0) {
							 output += '<td>-</td>'; 
						 }else {
							 output += '<td><input type = "text" value ="'+blancketcnt+'" style = "width : 20px;"/>&nbsp;/&nbsp;'+subs_blanket+'</td>';
						 }
						 output += '<td><input type = "text" value ="'+deliverycnt+'" style = "width : 20px;"/>&nbsp;/&nbsp;'+subs_delivery+'</td>';
						 output += '<td>'+timeSt(startDate)+'</td>';
						 output += '<td>'+timeSt(endDate)+'</td>';
						 output += '<td><input id = "updateBtn" class = "statusBtn" name="'+item.member_id+'" type = "button" value = "수정" />';
						 output += '<input id = "deleteBtn" class = "statusBtn" name="'+item.member_id+'" type = "button" value = "삭제" /></td>'
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
		
        // 엔터키가 눌렸을 때 실행할 내용
		function enterkey() {
	        if (window.event.keyCode == 13) {
	        	subMemberSearch(); 
	        }
		}
        
		function timeSt(dt) {
		    var d = new Date(dt);
		    var yy = d.getFullYear().toString().substring(2,4);
		    var MM = d.getMonth()+1;
		    var dd = d.getDate();

		    return (yy + '/' + addzero(MM) + '/' + addzero(dd));
		}
		
		//10보다 작으면 앞에 0을 붙임
		function addzero(n) {
		    return n < 10 ? "0" + n : n;
		}	
        
		//만들어진 테이블에 페이지 처리
		function page(){
						
			$('#result-table-tbody').each(function() {
				
				var pagesu = 10;  //페이지 번호 갯수		
				var currentPage = 0;		
				var numPerPage = 10;  //목록의 수		
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
				
				// [처음]
				$('<br /><span class="page-number" style = "cursor: pointer"><img src="https://img.icons8.com/ultraviolet/20/000000/double-left.png"></span>').bind('click', {newPage: page},function(event) {
					currentPage = 0;   
				    $table.trigger('repaginate');  
				    $($(".page-number")[2]).addClass('pageClick').siblings().removeClass('pageClick');
				    $("html, body").animate({ scrollTop : 0 }, 500);
				}).appendTo($pager).addClass('clickable');
				
				// [이전]
				$('<span class="page-number" style = "cursor: pointer">&nbsp;&nbsp;&nbsp;<img src="https://img.icons8.com/ultraviolet/20/000000/back.png">&nbsp;</span>').bind('click', {newPage: page},function(event) {
				    if(currentPage == 0) return; 
				    currentPage = currentPage-1;
				    $table.trigger('repaginate'); 
				    $($(".page-number")[(currentPage-nowp)+2]).addClass('pageClick').siblings().removeClass('pageClick');
				    $("html, body").animate({ scrollTop : 0 }, 500);
				}).appendTo($pager).addClass('clickable');
				
				// [1,2,3,4,5,6,7,8]
				for (var page = nowp ; page < endp; page++) {
					$('<span class="page-number" style="margin-left: 8px; cursor: pointer;"></span>').text(page + 1).bind('click', {newPage: page}, function(event) {
				    currentPage = event.data['newPage'];
				    $table.trigger('repaginate');
				    $($(".page-number")[(currentPage-nowp)+2]).addClass('pageClick').siblings().removeClass('pageClick');
				    $("html, body").animate({ scrollTop : 0 }, 500);
				    }).appendTo($pager).addClass('clickable');
				} 
				
				// [다음]
				$('<span class="page-number" style = "cursor: pointer">&nbsp;&nbsp;&nbsp;<img src="https://img.icons8.com/ultraviolet/20/000000/forward.png">&nbsp;</span>').bind('click', {newPage: page},function(event) {
				    if(currentPage == numPages-1) return;
				    currentPage = currentPage+1;
				    $table.trigger('repaginate'); 
				    $($(".page-number")[(currentPage-nowp)+2]).addClass('pageClick').siblings().removeClass('pageClick');
				    $("html, body").animate({ scrollTop : 0 }, 500);
				}).appendTo($pager).addClass('clickable');
				
				// [끝]
				$('<span class="page-number" style = "cursor: pointer">&nbsp;<img src="https://img.icons8.com/ultraviolet/20/000000/double-right.png"></span>').bind('click', {newPage: page},function(event) {
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
		
	</script>
</head>
<body>
		<div id="admin"></div>
		<div class="content">
			<!-- 여기서부터 작업하세요. -->
			<h1>정기구독 회원 관리</h1>

			<!--필터 div 시작 -->
			<div id = "search-div">
				<h2>회원검색</h2>
				<form id = "search-form" action = "">
					<table id = "search-table">
						<tr>
							<td>회원 아이디</td>
							<td>
								<input id = "keyword" type = "text" size = "40px" placeholder = "내용을 입력해주세요." onkeyup="enterkey();" /> 
							</td>
						</tr>
						<tr>
							<td>요금제</td>
							<td>
								<label for = "plan1"><input id="plan1" name = "check" value = "올인원" type = "checkbox">올인원</label>
								<label for = "plan2"><input id="plan2" name = "check" value = "와이" type = "checkbox">와이셔츠</label>
								<label for = "plan3"><input id="plan3" name = "check" value = "드라이" type = "checkbox">드라이</label>
								<label for = "plan4"><input id="plan4" name = "check" value = "물빨래" type = "checkbox">물빨래</label>
								<label for = "plan5"><input id="plan5" name = "check" value = "물드" type = "checkbox">물빨래&드라이</label>
							</td>
						</tr>
						<tr>
							<td>정렬</td>
							<td>
							<select id = "order-select">
								<option value = "byDate">구독신청순</option>
								<option value = "byDateReverse">구독신청역순</option>
							</select>
							</td>
						</tr>
					</table>
				</form>
				
				<div id="search-btn-div">
					<input type="button" id = "search-btn" value = "검색" onclick = "subMemberSearch();" />
					<button id = "reset-btn">초기화</button>
				</div>
			</div>
			<!--필터 div 끝 -->

			<!-- 결과 div 시작 -->
			<div id = "result-div">
					<table id="result-table" class = "subTable">
						<thead>
							<tr>
								<th>아이디</th>
								<th>요금제</th>
								<th>물빨래</th>
								<th>와이셔츠</th>
								<th>드라이클리닝</th>
								<th>이불</th>
								<th>배송</th>
								<th>구독신청일</th>
								<th>구독만료일</th>
								<th>수정삭제</th>
							</tr>
						</thead>
						<tbody id = "result-table-tbody" class = "repaginate">			
						</tbody>
					</table>				
			</div>
			<!-- 결과 div 끝 -->

			<!-- 결과 페이징 div 시작 -->
			<div id="result-paging-div">
				
				<div id = "result-second-pager">
				</div>
				
			</div>
			<!-- 결과 페이징 div 끝 -->


		</div>
	</div><!-- 지우지마세요 -->
</body>
</html>
