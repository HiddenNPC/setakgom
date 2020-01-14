<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판]</title>
<script language="JavaScript">
	function addboard() {
		noticeform.submit();
	}
</script>
</head>
<body>
<form action="./noticeInsert.st" method="post" enctype="multipart/form-data" name="noticeform" enctype="multipart/form-data">
	<table cellpadding="0" cellspacing="0">
		<tr align="center" valign="middle">
			<td colspan="5">MVC 게시판</td>
		</tr>

		<tr>
			<td>
				<div align="center">제 목</div>
			</td>
			<td>
				<input name="NOTICE_TITLE" type="text" size="50" maxlength="100" value="[공지] "/>
			</td>
		</tr>
		<tr>
			<td><div align="center">내 용</div></td>
			<td><textarea name="NOTICE_CONTENT" cols="67" rows="15"></textarea></td>
		</tr>
		
		<tr><td colspan="2"></td></tr>
		<tr><td colspan="2">&nbsp;</td></tr>
		<tr align="center" valign="middle">
			<td colspan="5">
				<a href="javascript:addboard()">[등록]</a>&nbsp;&nbsp;
				<a href="javascript:history.go(-1)">[뒤로]</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>