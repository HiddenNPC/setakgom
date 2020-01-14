<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.spring.setak.*"%>  
<%@ page import = "java.util.*"%>
<%@ page import = "java.text.SimpleDateFormat"%>

<%	
	QnaVO vo = (QnaVO)request.getAttribute("qnadata");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세탁곰 Q&A</title>

</head>
<body>
	<form action="./qnaInsert.co" method="post" enctype="multipart/form-data" name="qnaform">
		<table cellpadding="0" cellspacing="0">
			<tr align="center" valign="middle"> <td colspan="5"> Q&A 작성</td></tr>				
			<tr>
				<td style="font-family:돋움; font-size:12" height="16">
				<div align="center">글쓴이</div>
				</td>
				<td>
					<input type="hidden" name="MEMBER_ID" value="<%=vo.getMEMBER_ID()%>"><%=vo.getMEMBER_ID()%>
				</td>
			</tr>
			
			
			<tr>
				<td style="font-family:돋움; font-size:12" height=16>
					<div align="center">문의 유형</div>
				</td>
				<td>
					<div>
					<input type="radio" name="QNA_TYPE" value="취소" checked="checked">취소
					<input type="radio" name="QNA_TYPE" value="배송관련">배송관련
					<input type="radio" name="QNA_TYPE" value="적립금">적립금
					<input type="radio" name="QNA_TYPE" value="서비스관련">서비스관련
					<input type="radio" name="QNA_TYPE" value="회원정보">회원정보
					<input type="radio" name="QNA_TYPE" value="기타">기타
					</div>
				</td>
			</tr>
			<tr>
				<td style="font-family:돋움; font-size:12" height=16>
					<div align="center">구분</div>
				</td>
				<td><div>
					<input type="radio" name="QNA_KIND" value="세탁" checked="checked" >세탁
					<input type="radio" name="QNA_KIND" value="세탁-수선">세탁-수선
					<input type="radio" name="QNA_KIND" value="세탁-보관">세탁-보관
					<input type="radio" name="QNA_KIND" value="수선">수선
					<input type="radio" name="QNA_KIND" value="보관">보관
					<input type="radio" name="QNA_KIND" value="정기구독">정기구독
					</div>
				</td>
			</tr>
			<tr>
				<td style="font-family:돋움; font-size:12" height=16>
					<div align="center">제목</div>
				</td>
				<td>
					<input name="QNA_TITLE" type="text" size="50" maxlength="100" value=""/>
				</td>
			</tr>
			<tr>
				<td style="font-family:돋움; font-size:12" height=16>
					<div align="center">내용</div>
				</td>
				<td>
					<textarea name="QNA_CONTENT" cols="67" rows="15" ></textarea>
				</td>
			</tr>
			<tr>
				<td style="font-family:돋움; font-size:12">
				<div align="center">파일 첨부</div></td>
				<!-- <td><input name="BOARD_FILE" type="button" value="선택"/></td>  -->
				<td><input id="QNA_FILE" name="QNA_FILE" type="file" /></td>
				
			</tr>
			<tr>
				<td style="font-family:돋움; font-size:12" height=16>
					<div align="center" ></div>
				</td>
				<td>
					<div>
					<input type="hidden" name="QNA_CHECK" value="답변대기" checked="checked">
					<input type="hidden" name="QNA_CHECK" value="답변완료">					
					</div>
				</td>
			</tr>
			
			
			
			
			<tr bgcolor="cccccc">
				<td colspan="2" style="height:1px"></td>		
			</tr>
			<tr><td colspan="2">&nbsp;</td></tr>
			<tr align="center" valign="middle">
				<td colspan="5">
					<a href="javascript:qnaform.submit()">[등록]</a>&nbsp;&nbsp;
					<a href="javascript:history.go(-1)">[뒤로]</a>
				</td>
			</tr>			
		</table>
	</form>
</body>
</html>