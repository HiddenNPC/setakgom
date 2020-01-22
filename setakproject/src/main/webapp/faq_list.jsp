<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.text.SimpleDateFormat"%>
<%@ page import = "com.spring.setak.*" %>    
    
    
<%
	ArrayList<FaqVO> faqlist = (ArrayList<FaqVO>) request.getAttribute("faqdata");
System.out.println("faqlist.get(0).getFaq_cate()=" +faqlist.get(0).getFaq_cate());
	
	
%>    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>세탁곰 FAQ</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./css/default.css"/>
<link rel="stylesheet" type="text/css" href="./css/faq.css"/><!-- 여기 본인이 지정한 css로 바꿔야함 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#header").load("header.jsp")
	$("#footer").load("footer.jsp")     
    $(function (){	
    	tab('#tab',0); //"아뒤: 탭" 의 1번째 li를 디폴트로 선택 
    });
	function tab(e, num){ 
    //위에 선언한것 과 유사하게 '함수tab'은 변수 e 와 num 을 사용하는데 
    // e에는 '#tab',num 에는 숫자 가 들어 갈것 같은데 -> ()
		var num = num || 0;//(or)
    	var menu = $(e).children(); // 메뉴는 #tab의 자손이다 
    	var con = $(e+'_con').children(); // 컨텐츠는 #tab_con의 자손이다
    	var select = $(menu).eq(num); // 셀렉트는 메뉴의(num)번쨰 값을 가져와라.
    	var i = num; //i 는 num으로선언
    	select.addClass('on'); //셀렉트 객체에 'on'이라는 클래스 값을 추가할수 있다//카테고리 부분에 파란색 영역으로 바뀌는 부분
    	con.eq(num).show();
    	menu.click(function(){
    		if(select!==null)
    		{
    			select.removeClass("on"); //.tab li.on
    	        con.eq(i).hide();
    	    }
    		select = $(this);	
    	    i = $(this).index();//현재 내가 누른 바로 그 셀렛트의 순서 .index() 메서드는 일치하는 요소들중 선택한 요소가 몇번째 순번을 가지고 있는지 알 수 있는메서드 이다.
    	    select.addClass('on');
    	    con.eq(i).show();
    	});
  	}
    //toggle + not 을 사용하라 
    $(function(){
    	$(".ico_ar").on('click',function(){
    		$except = $(this);		
    	  	$("#tab_con div ol").slideUp(); //올라간다	
    	  	$except.css('transform','rotate(180deg)');		 		
    	  	//$except.css('transform','rotate(180deg)').toggleClass();
    	  	//.parent()는 어떤 요소의 부모 요소를 선택합니다..next()는선택한 요소의 바로 다음에 위치한 형제 요소를 선택한다.
    	  	if(!$(this).parent().next().is(":visible"))
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
<section id="faq"> <!-- id 변경해서 사용하세요. -->
<div class="content"> <!-- 변경하시면 안됩니다. -->
<div class="title-text"><h2>FAQ</h2></div>         
<div class="faq">

<div class="tab" >
<ul id="tab">
    <li><%=faqlist.get(0).getFaq_cate()%></li>
    <li><%=faqlist.get(6).getFaq_cate()%></li>
    <li><%=faqlist.get(10).getFaq_cate()%></li>
    <li><%=faqlist.get(16).getFaq_cate()%></li>	
    <li><%=faqlist.get(24).getFaq_cate()%></li>	
    <li><%=faqlist.get(26).getFaq_cate()%></li>	    
</ul>
</div>

<div class="tab_con" id="tab_con">
<div>
<%for(int i=0; i<faqlist.size(); i++) { FaqVO vo =(FaqVO)faqlist.get(i); %>
<%if(vo.getFaq_cate().equals("기본정보")){%>
<h4>Q.&nbsp;&nbsp;<%=vo.getFaq_title() %><input class="ico_ar" type="button"value="▼"></h4>   
<ol><li><%=vo.getFaq_content()%></li></ol>
<%}%><%}%>
</div>	

<div>
<%for(int i=0; i<faqlist.size(); i++) { FaqVO vo =(FaqVO)faqlist.get(i); %>
<%if(vo.getFaq_cate().equals("이용정보")){%>
<h4>Q.&nbsp;&nbsp;<%=vo.getFaq_title() %><input class="ico_ar" type="button"value="▼"></h4>   
<ol><li><%=vo.getFaq_content()%></li></ol>
<%}%>
<%}%>
</div>	
<div>
<%for(int i=0; i<faqlist.size(); i++) { FaqVO vo =(FaqVO)faqlist.get(i); %>
<%if(vo.getFaq_cate().equals("수거/배송")){%>
<h4>Q.&nbsp;&nbsp;<%=vo.getFaq_title() %><input class="ico_ar" type="button"value="▼"></h4>   
<ol><li><%=vo.getFaq_content()%></li></ol>
<%}%>
<%}%>
</div>	
<div>
<%for(int i=0; i<faqlist.size(); i++) { FaqVO vo =(FaqVO)faqlist.get(i); %>
<%if(vo.getFaq_cate().equals("세탁")){%>
<h4>Q.<%=vo.getFaq_title() %><input class="ico_ar" type="button"value="▼"></h4>   
<ol><li><%=vo.getFaq_content()%></li></ol>
<%}%>
<%}%>
</div>	
<div>
<%for(int i=0; i<faqlist.size(); i++) { FaqVO vo =(FaqVO)faqlist.get(i); %>
<%if(vo.getFaq_cate().equals("요금/결제")){%>
<h4>Q.&nbsp;&nbsp;<%=vo.getFaq_title() %><input class="ico_ar" type="button"value="▼"></h4>   
<ol><li><%=vo.getFaq_content()%></li></ol>
<%}%>
<%}%>
</div>	
<div>
<%for(int i=0; i<faqlist.size(); i++) { FaqVO vo =(FaqVO)faqlist.get(i); %>
<%if(vo.getFaq_cate().equals("보관")){%>
<h4>Q.&nbsp;&nbsp;<%=vo.getFaq_title() %><input class="ico_ar" type="button"value="▼"></h4>   
<ol><li><%=vo.getFaq_content()%></li></ol>
<%}%>
<%}%>
</div>	


</div>


</div></div>
</section> 
<div id="footer"></div> 
</body>
</html>
