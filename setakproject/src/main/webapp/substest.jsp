<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.spring.setak.*" %>
<%response.setHeader("Access-Control-Allow-Origin","*"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript">
	$(document).ready(function(){
		$("#header").load("./header.jsp")
		$("#footer").load("./footer.jsp")
		
		swal({
			title:"Hello",
			text: "World"
		});
		
		
		$("#btnSubmit").click(function (event) {
			event.preventDefault();
			
			
			var data = {"cid":"minchoi9509","mid":"merchant_15806894981"};
			
         	$.ajax({
                type: "POST",
                url: "/setak/subsres.do",
                data: data,
                dataType: 'json',

                success: function (data) {
                	
                },
                error: function (e) {

				}
			});
			
   	     });
   	    
	});
	
    </script>
</head>
<body>
	<form method="POST" enctype="multipart/form-data" id="fileUploadForm">
        <input type="submit" value="Submit" id="btnSubmit"/>
    </form>
</body>
</html> 