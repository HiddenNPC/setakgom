<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
   <title>세탁곰</title>
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
   <link rel="stylesheet" type="text/css" href="./css/default.css"/>
   <link rel="stylesheet" type="text/css" href="./css/test.css"/><!-- 여기 본인이 지정한 css로 바꿔야함 -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function(){
         $("#header").load("./header.jsp")
         $("#footer").load("./footer.jsp")     
         
         $("#btnSubmit").click(function (event) {
             //stop submit the form, we will post it manually.
             event.preventDefault();

             /* // Get form
             var form = $('#fileUploadForm')[0];

             // Create an FormData object
             var data = new FormData(form);

             data.append("frst_nm", "${frst_nm}");
             data.set("last_nm", "${last_nm}");

             // disabled the submit button
             $("#btnSubmit").prop("disabled", true); */

             $.ajax({
                 type: "POST",
                 enctype: 'multipart/form-data',
                 //url: "/setak/uploadImages.do?${_csrf.parameterName}=${_csrf.token}",
                 url: "/setak/imageDownload.do",
                 //data: data,
                 processData: false,
                 contentType: false,
                 cache: false,
                 timeout: 600000,
                 success: function (data) {

                     $("#result").text(data);
                     console.log("SUCCESS : ", data);
                     $("#btnSubmit").prop("disabled", false);

                 },
                 error: function (e) {

                     $("#result").text(e.responseText);
                     console.log("ERROR : ", e);
                     $("#btnSubmit").prop("disabled", false);

                 }
             });

         });
      });
      
      
    </script>
</head>
<body>
   <div id="header"></div>
   
   <!-- 여기서 부터 작성하세요. 아래는 예시입니다. -->
   <section id="test"> <!-- id 변경해서 사용하세요. -->
      <div class="content"> <!-- 변경하시면 안됩니다. -->
         <div class="title-text"> <!-- 변경하시면 안됩니다. -->
            <h2>수선 서비스</h2>
         </div>
         <div class="test2"> <!-- class 변경해서 사용하세요. -->
            <p>※ 수선만 가능한 페이지입니다. 수선할 옷에 세탁 서비스도 이용하실 예정이시면 세탁 페이지를 이용해주세요.</p>
            <form method="POST" enctype="multipart/form-data" id="fileUploadForm">
		        <input type="file" name="files" multiple/><br/><br/>
		        <input type="hidden" name="ssn_num" id="ssn_num" value="testnum"/>
		        <input type="submit" value="Submit" id="btnSubmit"/>
		        
		        <a href = "imageDownload.do">홈</a>
		    </form>
         </div>
      </div>
   </section>
   <!-- 여기까지 작성하세요. 스크립트는 아래에 더 작성해도 무관함. -->
   
   <div id="footer"></div>
</body>
</html>