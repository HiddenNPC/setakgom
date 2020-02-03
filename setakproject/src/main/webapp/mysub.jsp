<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.spring.member.MemberSubVO"  %>    
<%@ page import="com.spring.member.HistorySubVO" %>
<%@ page import="com.spring.member.SubscribeVO" %>
<%@ page import="com.spring.member.MemberVO" %>
<%@ page import = "java.util.ArrayList" %>
<%
	MemberSubVO ms = (MemberSubVO) request.getAttribute("sub_list");
	SubscribeVO sv = (SubscribeVO) request.getAttribute("subscribe");
	MemberVO mo = (MemberVO) request.getAttribute("name");
	ArrayList<HistorySubVO> list = (ArrayList<HistorySubVO>)request.getAttribute("subhistory_list");
	int limit = ((Integer)request.getAttribute("limit")).intValue();
	int nowpage = ((Integer)request.getAttribute("page")).intValue();
	int maxpage = ((Integer)request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer)request.getAttribute("startpage")).intValue();
	int endpage = ((Integer)request.getAttribute("endpage")).intValue();
	int listcount = ((Integer)request.getAttribute("listcount")).intValue();
	System.out.println("수거취소"+ms.getSubs_cancel());
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>세탁곰</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./css/default.css" />
<link rel="stylesheet" type="text/css" href="./css/mysub.css" />
<!-- 여기 본인이 지정한 css로 바꿔야함 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#header").load("./header.jsp")
		$("#footer").load("./footer.jsp")
		
		 //수거고 클릭
		 $("#go").on("click", function() {  
				$("#cancletxt").css('display', 'none');	 
		        $("#gotxt").css({
		            "top": (($(window).height()-$("#gotxt").outerHeight())/2+$(window).scrollTop())+"px",
		            "left": (($(window).width()-$("#gotxt").outerWidth())/2+$(window).scrollLeft())+"px"
		            //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정
		           
		            }); 
		        $(".popup_back").css("display","block"); //팝업 뒷배경 display block
		        $("#gotxt").css("display","block"); //팝업창 display block
		        
		        $("#go").css('display', 'none');
				$("#cancle").css('display', 'block');
			  });
			//수거고 - 확인
			$(".pop_btn").click(function(event){
		        $(".popup_back").css("display","none"); //팝업창 뒷배경 display none
		        $(".popup").css("display","none"); //팝업창 display none
		    });
		
		//수거취소 클릭
		
			var subs_cancel = <%=ms.getSubs_cancel() %>;
			if(subs_cancel=="0") { // 수거취소 가능
			 $("#cancle").on("click", function() {  
		        $("#cancletxt").css({
		            "top": (($(window).height()-$(".popup").outerHeight())/2+$(window).scrollTop())+"px",
		            "left": (($(window).width()-$(".popup").outerWidth())/2+$(window).scrollLeft())+"px"
		           
		            }); 
		        
		        $(".popup_back").css("display","block");
		        $("#cancletxt").css("display","block");
			 });		
			} else  { // 수거취소 불가능
				$('#cancle').css('background-color','#e1e4e4');
				$('#cancle').css('color','#444');
				$("#cancletxt").css({ 'pointer-events': 'none' });// 버튼 비활성화
			};
		 
		
		
		//수거취소 - 수거취소
		 $(".pop_btn2").click(function(event){
		        $(".popup_back").css("display","none"); //팝업창 뒷배경 display none
		        $(".popup").css("display","none"); //팝업창 display none
		        
		        $("#go").css('display', 'block');
				$("#cancle").css('display', 'none');
		    });
		 
		//수거취소 - 수거접수
		 $(".pop_btn3").click(function(event){
		        $(".popup_back").css("display","none"); //팝업창 뒷배경 display none
		        $(".popup").css("display","none"); //팝업창 display none
		        
		        $("#go").css('display', 'none');
				$("#cancle").css('display', 'block');
		    }); 
		
		//구독해지 클릭
		   $("#sub").click(function(event){
			   $(".subcancle").css('display', 'block');
			});
		
		   $(".pop_btn4").on("click", function() {
				$(".subcancle").css('display', 'none');
			});
		   
		   
		 //구독해지하면?????????????????????
			$(".pop_btn5").on("click", function() {
				$(".subcancle").css('display', 'none'); 
			});
			
						
		/*나의 정기구독이 0/0일 때 -로 바꿈*/
		for(var i = 0; i < 6; i++) {
			if($('.cell').eq(i).text() == "0/0") {
				$('.cell').eq(i).text('-');
			}
		}
		
		/*수거고 날짜*/
		var d = new Date(); 
		var day = (d.getMonth()+1)+"월" + (d.getDate()+1)+"일";
		document.getElementById("printday").innerHTML =day;
		
		/*리뷰버튼 클릭시*/
		$("#review").click(function(event){
			 $(location.href="/setak/profile2.do"); // 리뷰쓰는 주소로 수정하기
		});
		
	});
	 

</script>
</head>
<body>
	<div id="header"></div>

	<!-- 여기서 부터 작성하세요. 아래는 예시입니다. -->
	<section id="test">
		<!-- id 변경해서 사용하세요. -->
		<div class="content">
			<!-- 변경하시면 안됩니다. -->
			<div class="mypage_head">
				<ul>
					<li class="mypage-title">마이페이지</li>
					<li>
						<ul class="mypage_list">
                     		<li>주문관리</li>
                     		<li><a href="orderview.jsp">주문/배송현황</a></li>
                     		<li><a href="mykeep.jsp">보관현황</a></li>
                 	 	</ul>
                  		<ul class="mypage_list">
                     		<li>정기구독</li>
                     		<li><a href="mysub.do">나의 정기구독</a></li>
                  		</ul>
                 		<ul class="mypage_list">
                    		<li>고객문의</li>
                     		<li><a href="qnainquiry.jsp">Q&amp;A 문의내역</a></li>
                  		</ul>
                  		<ul class="mypage_list">
                     		<li>정보관리</li>
                    		<li><a href="profile1.do">개인정보수정</a></li>
							<li><a href="mycoupon.do">쿠폰조회</a></li>
							<li><a href="mysavings.do">적립금 조회</a></li>
							<li><a href="withdraw.do">회원탈퇴</a></li>
                  		</ul>
					</li>
				</ul>
			</div>
			<div class="mypage_content"> 
				<h2>나의정기구독</h2>
				<% if(ms == null) {%>
				<h3>정기구독을 이용해 주세요</h3>
				<% } else { %> 
				<div class="mysub">
					<!-- class 변경해서 사용하세요. -->
					<div class="one">
						<ul class="mysub_top">
							<li class="list">요금제</li>
							<li class="list">물빨래 30L</li>
							<li class="list">와이셔츠</li>
							<li class="list">드라이클리닝</li>
							<li class="list">이불</li>
							<li class="list">배송</li>
							<li class="list">구독신청일</li>
							<li class="list">구독만료일</li>
							<li class="list">수거</li>
							<li class="list">구독해지</li>
						</ul>
					</div>
					
					
					<div class="two">
						<ul class="mysub_bottom">
							<li class="cell"><%=ms.getSubsname() %></li>
							<li class="cell"><%=ms.getWashcnt() %>/<%=sv.getSubs_water() %></li>
							<li class="cell"><%=ms.getShirtscnt() %>/<%=sv.getSubs_shirts() %></li>
							<li class="cell"><%=ms.getDrycnt() %>/<%=sv.getSubs_dry() %></li>
							<li class="cell"><%=ms.getBlacketcnt() %>/<%=sv.getSubs_blanket() %></li>
							<li class="cell"><%=ms.getDeliverycnt() %>/<%=sv.getSubs_delivery() %></li>
							<li class="cell"><% String a =ms.getSubs_start();
												String b=a.substring(0,10);
												%><%=b %></li>
							<li class="cell"><%String c =ms.getSubs_end(); 
											   String d =c.substring(0,10);
												%><%=d %></li>
							<li class="btn">
								<a id="go" class="help">수거고 </a>
								<a id="cancle" href="javascript:">수거취소</a>
							</li>
							<li class="btn">
								<a id="sub" href="javascript:" >해지</a>
							</li>
						</ul>
					
						<br>
						<p>※ 수거고를 누르시면 다음날 수거가 이루어집니다.</p>
						<p>※ 수거 취소는 수거 신청 버튼을 누른 당일 밤 10시까지만 가능하니 유의해주세요.</p>
						<p>※ 구독해지는 당일이 아닌 다음 달부터 구독 해지가 이루어집니다.</p>
					</div>
					<%} %>	
					<!--정기구독내역이 없을 경우 -->		
						<% if(listcount == 0 ) {%> 
					<% } else { %> 	
					<div class="myrecord">
						<div class="text">
							<h2>정기구독 내역</h2>
							<table class="record_list"> 
								<thead>
									<tr>
										<th></th>
										<th>요금제</th>
										<th>결제금액</th>
										<th>결제일</th>
										<th>리뷰쓰기</th>
									</tr>
								</thead>
						
						
								 <%for (int i=0; i<list.size(); i++) {
									HistorySubVO hlist = (HistorySubVO)list.get(i);
								%>
								<tbody>
									<tr>
										<td><%=i+1 %></td>
										<td><%=hlist.getHis_name() %></td>
										<td><%=hlist.getHis_price() %>원</td>
										<td><%=hlist.getHis_date() %></td>
										<td>
											<a id="review" href="javascript:">review</a>
										</td>
									</tr>
								</tbody>
								<%} %>   
							</table>
						</div>
					</div>	
					<div class="page_a">
							<table class="page_a">
                     		<tr align = center height = 20>
                          <td>
                          <%if(nowpage <= 1) {%>
                          <span class="page_a"><a>&#60;</a></span>
                          <%} else {%>  <!-- nowpage가 1페이지 아닐 때, 2 페이지거나 3페이지 등등 -->
                             <span class="page_a"><a href ="./mysub.do?page=<%=nowpage-1 %>">&#60;</a></span>
                          <%} %>
                          <%for (int af=startpage; af<=endpage; af++) {
                             if(af==nowpage) {
                          %>
                          <span class="page_a"><a><%=af %></a></span>
                          <%} else {%>
                             <span class="page_a"><a href="./mysub.do?page=<%=af %>"><%=af %></a></span>
                          <%} %>
                          <%} %>
                          <%if (nowpage >= maxpage) {%>   <!-- 링크 걸지 않겠다.. -->
                             <span class="page_a"><a>&#62;</a></span>
                          <%} else { %>   
                              <span class="page_a"><a href ="./mysub.do?page=<%=nowpage+1 %>">&#62;</a></span>
                           <%} %> 
                       <%} %>  
                           </td>
                        </tr>
              		 </table>
						</div>
					</div>
					
<!--           popup -->
                <div class="popup_back"></div> <!-- 팝업 배경 DIV -->
        
        		<!-- 수거고 팝업창 -->
                <div class="popup" id="gotxt"> 
                	<img src="images/popup.png">
                    <div class="text">
                                                     수거 신청이 되었습니다.<br><br>
                       	<span id="printday"></span>에 수거됩니다.
                    </div>
                    <div class="pop_btn">확인</div>
                </div>    
                 
                 <!-- 수거취소 팝업창 -->
                 <div class="popup" id="cancletxt"> 
                	<img src="images/popup.png">
                    <div class="text">
                    	수거취소  하시겠어요?<br><br>
                    	취소는 신청 당일 저녁 10시까지 가능합니다.
                    </div>
                    <div class="pop_btn2">수거취소</div>
                    <div class="pop_btn3">수거접수</div>
                </div>
                
                <!-- 구독해지 팝업창 -->
                
                <div class="subcancle" id="subcancle" >
	                <div class="back">
						<img class="sub_image" src="images/back.png">
						<div class="text">
							<h2><span><%=mo.getMember_name() %></span>님</h2>
							<p>지금 정기구독을 해지하시면,</p>
							<h4>최대<span>60%</span>저렴한 정기구독권</h4>
							<h4>보관 1BOX<span>1개월 쿠폰</span></h4>
							<h4>구독회원 전용<span>상시이벤트</span></h4>
							<h5>이 모든 세탁곰의 <span>정기구독 전용 혜택</span>이 사라져요<br>그래도 해지하시겠어요?</h5>
							<h5>구독해지는 당일이 아닌 다음 달부터 구독 해지가 이루어집니다.</h5>
						</div>
						<input type="button" class="pop_btn4" value="구독하고 혜택 유지">
						<input type="button" class="pop_btn5" value="해지하고 혜택 포기">
					</div>
				</div>
				
            </div><!-- mysub -->
			</div><!-- mypage_content -->
		</div><!-- content -->
	</section>
	<!-- 여기까지 작성하세요. 스크립트는 아래에 더 작성해도 무관함. -->

	<div id="footer"></div>
</body>

                
</html>