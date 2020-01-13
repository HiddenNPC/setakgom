<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
   <title>세탁곰 FAQ</title>
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
   <link rel="stylesheet" type="text/css" href="./css/default.css"/>
   <link rel="stylesheet" type="text/css" href="./css/faq_list.css"/><!-- 여기 본인이 지정한 css로 바꿔야함 -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript">
      $(document).ready(function(){
         $("#header").load("header.jsp")
         $("#footer").load("footer.jsp")     
     
     
      $(function () {	
    		tab('#tab',0); //"아뒤: 탭" 의 1번째 li를 디폴트로 선택 
    	});

    	function tab(e, num){ 
    	//위에 선언한것 과 유사하게 '함수tab'은 변수 e 와 num 을 사용하는데 
    	// e에는 '#tab' , num 에는 숫자 가 들어 갈것 같은데 -> ()
    	    var num = num || 0;//num이나 0 이면 true
    	    var menu = $(e).children(); // 메뉴는 #tab의 자손이다 
    	    var con = $(e+'_con').children(); // 컨텐츠는 #tab_con의 자손이다
    	    var select = $(menu).eq(num); // 셀렉트는 메뉴의(num)번쨰 값을 가져와라.
    	    var i = num; //i 는 num으로선언
    	    select.addClass('on'); 
    	    //셀렉트 객체에 'on'이라는 클래스 값을 추가할수 있다  
    	    //카테고리 부분에 파란색 영역으로 바뀌는 부분
    	    con.eq(num).show();
    	    menu.click
    	    (
    	    	function()
    	    	{
    	        if(select!==null)
    	        {
    	          select.removeClass("on"); //.tab li.on
    	          con.eq(i).hide();
    	        }
    	        	select = $(this);	
    	        	i = $(this).index();//현재 내가 누른 바로 그 셀렛트의 순서 .index() 메서드는 일치하는 요소들중 선택한 요소가 몇번째 순번을 가지고 있는지 알 수 있는메서드 이다.
    	        	select.addClass('on');
    	        	con.eq(i).show();
    	    	}
    	   	);
    	}

    	//toggle + not 을 사용하라 
    	$(function(){
    		$(".ico_ar").on('click',function(){ 
    			$except = $(this);		
    	  		$("#tab_con div ol").slideUp(); //올라간다	
    	  		$except.css('transform','rotate(180deg)');		 		
    	  		//$except.css('transform','rotate(180deg)').toggleClass();
    	  		
    	  		if(!$(this).parent().next().is(":visible"))//.parent()는 어떤 요소의 부모 요소를 선택합니다..next()는선택한 요소의 바로 다음에 위치한 형제 요소를 선택한다.
    			{						
    				$(this).parent().next().slideDown();			
    				$(".ico_ar").not($except).css('transform','none');		
    			}    			  			   		
    		})    		
    	}); 
	});     

    </script>
</head>
<body>
   <div id="header"></div>     
   <section id="faq_list"> <!-- id 변경해서 사용하세요. -->
      <div class="content"> <!-- 변경하시면 안됩니다. -->
         <div class="title-text"> <!-- 변경하시면 안됩니다. -->

<div class="about-text"><p>FAQ</p></div><br><br>
<ul class="tab" id="tab">
    <li>기본정보</li>
    <li>이용방법</li>
    <li>수거/배송</li>
    <li>세탁</li>	
    <li>요금/결제</li>	
    <li>보관</li>	
</ul>

<div class="tab_con" id="tab_con">
  <div>
    <h4>&nbsp;Q. 세탁곰 서비스란? <input class="ico_ar" type="button"value="▼"></h4>   
<!--     <h4>&nbsp;Q. 세탁곰 서비스란? <input class="ico_ar" type="button"value="▼" ></h4>    -->
    <!-- <h4>&nbsp;Q. 세탁곰 서비스란? <span class="ico_ar">▼</span></h4>  -->  
    <ol>
        <li >세탁곰 서비스는 프로젝트3조에서 만든 전문 세탁서비스입니다.간단한 예약서비스로 집에서 세탁물을 수거, 배송 받을 수 있으며 모든 세탁물은 전문 세탁인들의 전문적인 기술로 세탁합니다.</li>
    </ol>
    <h4>&nbsp;Q. 기존의 세탁서비스와 다른점은? <input class="ico_ar" type="button" value="▼"></h4>
    <ol>
      <li>세탁곰은 기존의 타 세탁서비스와는 다르게 단순한 세탁만으로 끝나지 않고  세탁 후 수선하고 싶거나 보관하고싶은 물건이 있으면 보관까지 할 수 있는 서비스 입니다.</li>
    </ol>
    <h4>&nbsp;Q. 이용 방법은 무엇인가요? <input class="ico_ar" type="button" value="▼"></h4>
    <h4>&nbsp;Q. 서비스 지역은 어디인가요? <input class="ico_ar" type="button" value="▼"></h4>
    <h4>&nbsp;Q. 세탁 기간은 얼마나 걸리나요? <input class="ico_ar" type="button" value="▼"></h4>
    <h4>&nbsp;Q. 서비스 이용 시간을 알고싶어요? <input class="ico_ar" type="button" value="▼"></h4>
  </div>	

   <div>
   <dl>
   	<dt>
   		<span>Q.</span>택배를 신청했는데 언제즈음 받을수 있을까요 ?<input class="ico_ar" type="button"value="▼">
   	</dt>
   	<dd>
   		<p>
   		상품 인수를 위한 방문 희망 일로 지정하신 요청일에 방문합니다. 다만, 공휴일, 오전/오후 및 특정 시간을 지정하여 
   		방문 요청하실 경우 반영되지 않으며 관할 지역 사정으로 인해 택배기사 방문이 1~2일 지연될 수 있기에 정확한 방문 시간 확인은
   		 관할 대리점/사원이나 고객센터로
   		</p>
   	
   	</dd>
   
   
   
   </dl>
   
   
   
   
   </div>
   
   
   
   
   
   
   
   
   
   
   <div>3rd Contents</div>
   <div>4rd Contents</div>
   <div>5rd Contents</div>
   <div>6rd Contents</div>

</div><br><br><br>






</div>
</div>
</section> 
<div id="footer"></div> 
</body>
</html>

