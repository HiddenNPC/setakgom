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
		
		
		var fileEleCnt = $("input[type=file]").length;
		console.log(fileEleCnt);

		
		randomnum = function() {
			var array = new Uint32Array(1);
			window.crypto.getRandomValues(array);
			var num = array[0] + "";
			var rnum = num.substring(0,6);
			console.log(rnum);

			/* for (var i = 0; i < array.length; i++) {
			    console.log(array[i]);
			} */
			
			return rnum;
		}
		
		
		/* $("#btnSubmit").click(function (event) {
			event.preventDefault();
			
			// Get form
            var form = $('#fileUploadForm')[0];

            // Create an FormData object
            //var data = new FormData(form);
            var data = new FormData();
			console.log($("#filetest")[0].files.length);
			
			for(var i = 0; i < $("#filetest")[0].files.length; i++){
				data.append("files", $("#filetest")[0].files[i]);
			}
			
			console.log(data.get("files"));
			console.log(data);
			var objStr = JSON.stringify(data);
			
			console.log("제이슨data:" + objStr);
			
			sessionStorage.setItem("test", objStr);
			var sm = sessionStorage.getItem("test");
			var data3 = JSON.parse(sm);
			console.log(data3);
			
			
         	$.ajax({
                type: "POST",
                enctype: 'multipart/form-data',
                url: "/setak/testImage.do",
                data: data,
                processData: false,
                contentType: false,
                cache: false,
                dataType: 'json',

                success: function (data) {
                	
                },
                error: function (e) {

				}
			});
			
   	     }); */
		
		
		$("#btnSubmit").click(function (event) {
			event.preventDefault();
			var xhr = new XMLHttpRequest();

			var formdata = new FormData();

			formdata.enctype='multipart/form-data';
			formdata.method='post';
			formdata.action='test2.jsp';

			formdata.append("files", $("#filetest")[0].files[0]);

			xhr.open('post','/setak/passimage.do', true); 
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4){
					location.replace="/setak/test2.jsp"
				}
			}
			xhr.send(formdata);
		});
		
   	    $("#subtest").click(function (event) {
   	    	event.preventDefault();
   	    	
   	    	$("#hid").val()
   	     	$('#target').submit();
   	    });
   	    
	});
	
    </script>
</head>
<body>
	<form method="POST" enctype="multipart/form-data" id="fileUploadForm">
        <input type="file" name="files" id="filetest" accept="image/*" multiple/><br/><br/>
        <input type="submit" value="Submit" id="btnSubmit"/>
    </form>
    
    <form method="POST" action = "./setak/passimage.do" enctype="multipart/form-data" id= "target">
    	<input type="hidden" value="" id ="hid">
    	<input type="submit" value="Submit" id= "subtest"/>
    </form>
    
</body>
</html> 