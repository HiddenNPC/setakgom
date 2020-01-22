<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.spring.setak.WashingVO" %>
<%@ page import = "com.spring.setak.MendingVO" %>
<%@ page import = "com.spring.setak.KeepVO" %>
<%@ page import = "java.util.ArrayList" %>
<%
	ArrayList<WashingVO> washingList = (ArrayList<WashingVO>)request.getAttribute("washingList");
	ArrayList<MendingVO> mendingList = (ArrayList<MendingVO>)request.getAttribute("mendingList");
	ArrayList<KeepVO> keepList = (ArrayList<KeepVO>)request.getAttribute("keepList");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>세탁곰</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">

	<link rel="stylesheet" type="text/css" href="./css/default.css"/>
	<link rel="stylesheet" type="text/css" href="./css/cart.css"/>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>

    <script type="text/javascript">
      $(document).ready(function(){
    	  
         $("#header").load("./header.jsp")
         $("#footer").load("./footer.jsp")   
         
         getTotal(); 
         
	    /* 체크박스 전체선택 */
		$("#allcheck").click(function(){
	        //클릭되었으면
	        if($("#allcheck").prop("checked")){
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의 
	            $("input[name=check]").prop("checked",true);
	            //클릭이 안되있으면
	        }else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=check]").prop("checked",false);
	        }
	    });
         
         /* 체크박스 삭제 */
 
     	$(".total-button a").click(function(){
            var washSeqArr = []; 
            var repairSeqArr = []; 
            var keepSeqArr = []; 
            
     		var member_id = "bit"; 
     		var checkbox = $("input[name=check]:checked");
     		
     		checkbox.each(function(){
     			var tr = checkbox.parent().parent();
     			var type = $(this).val().substr(0, 1); 
     			var seq = $(this).val().substr(1, $(this).val().length);
     			
     			console.log('type : ' + type); 
     			
     			if(type == 'w') {
     				console.log('w' + seq);
     				washSeqArr.push(seq);   				
     			}else if (type == 'r') {
     				console.log('r' + seq);
     				repairSeqArr.push(seq);
     			}else {
     				console.log('k' + seq);
     				keepSeqArr.push(seq);
     			}
  
     			tr.remove();
     		});

     		
 			getTotal(); 
     		
     		var params = {
     			"washSeqArr" : washSeqArr,
     			"repairSeqArr" : repairSeqArr,
     			"loc" : "cart"
     		};
     		
     		$.ajax({
     			url : '/setak/cartDelete.do',
     			type : 'post',
     			data : params,
     			traditional : true,
     			success : function(retVal) {
     				if(retVal.res == "OK") {
     					alert("오키");
     				}else {
     					alert("실패"); 
     				}
     			},
     			error : function() {
     				alert("삭제 과정 실패 ajax"); 
     			}
     		});
     		
     	});
                      
      });
      
      // 합계 구하는 함수
      function getTotal() {
    	  var total = 0; 
          $('.product_price').each(function() {
	          var price = parseInt($(this).text().slice(0, -1)); 
	          total += price; 
          });
          $("#pay_price").html(numberFormat(total+'원'));
          $("#order_price").html(numberFormat(total+'원'));
      }
      
      function numberFormat(inputNumber) {
		   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
      }
      
    </script>
<body>
	<div id="header"></div>
	
	<!-- 여기서 부터 작성하세요. 아래는 예시입니다. -->
	<section id="cart"> <!-- id 변경해서 사용하세요. -->
		<div class="content"> <!-- 변경하시면 안됩니다. -->
			<div class="title-text"> <!-- 변경하시면 안됩니다. -->
				<h2>장바구니</h2>
			</div>
						
			<div class = "cart-div">
							
				<img class = "arrow-img" src = "images/order1.png" />
				
				<table class = "cart_list">
					<thead>
						<tr>
							<th><input id = "allcheck" type = "checkbox" /></th>
							<th>구분</th>
							<th>종류</th>
							<th>수량</th>
							<th>가격</th>
							<th>비고</th>
						</tr>
					</thead>
					<tbody align = "center">			
						<% if(washingList.size() != 0) {
						for(int i = 0; i < washingList.size(); i++) {
						WashingVO wvo = washingList.get(i);%>		
						  <tr>
		                     <td>
		                     	<input type = "checkbox" name = "check" value = "w<%=wvo.getWash_seq() %>"/>
		                     </td>
		                     <td>세탁</td>
		                     <td><%=wvo.getWash_kind() %></td>
		                     <td><%=wvo.getWash_count() %>장</td>
		                     <td class = "product_price"><%=wvo.getWash_price() %>원</td>
		                     <td><%=wvo.getWash_method() %></td>
		                  </tr>   
                  		<% } } else { %>
                  		<tr></tr>
                  		<%} %>
						<% if(mendingList.size() != 0) {
						for(int i = 0; i < mendingList.size(); i++) {
						MendingVO mvo = mendingList.get(i);%>		
						  <tr>
		                     <td>
		                     	<input type = "checkbox" name = "check" value = "r<%=mvo.getRepair_seq()%>"/>
		                     </td>
		                     <%if(mvo.getRepair_wash() == 0) { %>
		                     <td>수선</td>
		                     <%} else { %>
		                     <td>세탁-수선</td>
		                     <%} %>
		                     <td><%=mvo.getRepair_cate()%></td>
		                     <td><%=mvo.getRepair_count()%>장</td>
		                     <td class = "product_price"><%=mvo.getRepair_price()%>원</td>
		                     <td><%=mvo.getRepair_kind()%></td>
		                  </tr>   
                  		<% } } else { %>
                  		<tr></tr>
                  		<%} %>
                  		
						<% if(keepList.size() != 0) {

						KeepVO kvo = keepList.get(0);%>		
						  <tr>
		                     <td>
		                     	<input type = "checkbox" name = "check" value = "k<%=kvo.getKeep_seq()%>"/>
		                     </td>
		                     <td>보관</td>
		                     <td></td>
		                     <td><%=kvo.getKeep_box()%>박스</td>
		                     <td class = "product_price"><%=kvo.getKeep_price()%>원</td>
		                     <td><%=kvo.getKeep_month()%>개월</td>
		                  </tr>   
                  		<% } else { %>
                  		<tr></tr>
                  		<%} %>
					
					</tbody>
				</table>
				
				<p/>

				<div class="total-button">
					<a href="javascript:">선택삭제</a>
				</div>

				<table class = "cart_price">
					<thead>
						<tr>
							<th>주문금액</th>
							<th></th>
							<th>배송비</th>
							<th></th>
							<th>결제 예정금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><span id = "order_price"></span></td>
							<td class = "td_big">+</td>
							<td>0원</td>
							<td class = "td_big">=</td>
							<td class = "td_blue"><span id = "pay_price"></span></td>
						</tr>
					</tbody>
				</table>
				
				<button class="bt_1000" onclick="location.href='/setak/order.do'">주문결제</button>
		</div>
		

		</div>
	</section>
	<!-- 여기까지 작성하세요. 스크립트는 아래에 더 작성해도 무관함. -->
	
	<div id="footer"></div>
</body>
</html>