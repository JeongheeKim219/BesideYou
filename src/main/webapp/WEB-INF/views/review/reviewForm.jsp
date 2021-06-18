<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head></head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<title>Insert title here</title>
</head>

<body>
<div id="ex" class="modal">
<form name="writeForm" method="post" action="${path}/review/insert"
onSubmit='return checkValid()'>
	<h2 align="center">상담사 리뷰작성</h2>
	
	<table align="center" cellpadding="1" cellspacing="2" width="450"
		border="1">
		<tr>
			<td height="20" colspan="2" bgcolor="#00cc00">
				<p align="center">
					<font color="black" size="3"><b>리뷰 작성</b></font>
				</p>
			</td>
		</tr>
		<tr>
			<td width="150" height="20">
				<p align="right">
					<b><span style="font-size: 9pt;">작성자</span></b>
				</p>
			</td>
			<td width="450" height="20"><b><span style="font-size: 9pt;">
						<input name="memberCode.memberCode" size="30" value="">
						<%-- <input name="id" size="30" value="${loginUser}" readonly="readonly"
						disabled="disabled"> --%>
				</span></b></td>
		</tr>
		<tr>
			<td width="150" height="20">
				<p align="right">
					<b><span style="font-size: 9pt;">상담사</span></b>
				</p>
			</td>
			<td width="450" height="20"><b><span style="font-size: 9pt;">
						<input type="text" name="counselorCode.counselorCode" size="30" value="">
				</span></b></td>
		</tr>
		<tr>
			<td width="150" height="20">
				<p align="right">
					<b><span style="font-size: 9pt;">상담코드</span></b>
				</p>
			</td>
			<td width="450" height="20"><b><span style="font-size: 9pt;">
						<input type="text" name="counselCode.counselCode" size="30" value="">
				</span></b></td>
		</tr>
		<tr>
			<td width="150" height="20">
				<p align="right">
					<b><span style="font-size: 9pt;">평점</span></b>
				</p>
			</td>
			<td width="450" height="20"><b><span style="font-size: 9pt;">
						<select name="star">
							<option value="1.0">★</option>
							<option value="2.0">★★</option>
							<option value="3.0">★★★</option>
							<option value="4.0">★★★★</option>
							<option value="5.0">★★★★★</option>
						</select>
				</span></b></td>
		</tr>
		<tr>
			<td width="150" height="20">
				<p align="right">
					<b><span style="font-size: 9pt;">리 뷰</span></b>
				</p>
			</td>
			<td width="450" height="20"><b><span style="font-size: 9pt;">
						<textarea name="reviewContent" cols="50" rows="10"></textarea>
				</span></b></td>
		</tr>
		

		<tr>
			<td width="450" height="20" colspan="2" align="center"><b><span
					style="font-size: 9pt;"><input type=submit value=리뷰등록>
						<input type=reset value=다시쓰기><input type="button" onclick="history.back()" value="돌아가기"></span></b></td>
		</tr>
	</table>
</form>
  <a href="#" rel="modal:close">닫기</a>
</div>
 
<p><a href="#ex" rel="modal:open">리뷰쓰기</a></p>
</body>
</html>