<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.setak.*" %>
<%
	NoticeVO notice = (NoticeVO)request.getAttribute("noticedata");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function noticemodify() {
	modifyform.submit();
}
</script>
</head>
<body>
	<form action="noticeModify.st" method="post" name="modifyform">
		<input type="hidden" name="NOTICE_NUM" value="<%=notice.getNOTICE_NUM()%>">
		<table cellpadding="0" cellspacing="0">
			<tr align="center" valign="middle">
				<td colspan="5">MVC 게시판</td>
			</tr>
			<tr>
				<td><div align="center">제 목</div></td>
				<td><input name="NOTICE_TITLE" type="text" size="50" maxlength="100" value="<%=notice.getNOTICE_TITLE()%>" /></td>
			</tr>
			<tr>
				<td><div align="center">내 용</div></td>
				<td><textarea name="NOTICE_CONTENT" cols="67" rows="15"><%=notice.getNOTICE_CONTENT() %></textarea></td>
			</tr>
			
			<tr><td colspan="2"></td></tr>
			<tr><td colspan="2">&nbsp;</td></tr>
			<tr align="center" valign="middle">
				<td colspan="5">				
					<a href="javascript:noticemodify()">[수정]</a>&nbsp;&nbsp;
					<a href="javascript:history.go(-1)">[뒤로]</a>&nbsp;&nbsp;					
				</td>
			</tr>
		</table>
	</form>
</body>
</html>