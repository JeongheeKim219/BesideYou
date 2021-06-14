<%@ page info="게시판 수정하기" contentType="text/html;charset=UTF-8" %>
<HTML>
<HEAD>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<SCRIPT >
$(function(){
	alert(1)
})

</SCRIPT>

</HEAD>

<BODY>


<form name=updateForm method=post action="${pageContext.request.contextPath}/faq/update" >
    <input type='hidden' name='faqCode' value="${faq.faqCode}">
	<table align="center" cellpadding="5" cellspacing="1" width="600" border="1">
    <tr>
        <td width="1220" height="20" colspan="2" bgcolor="#3680B3">
            <p align="center"><font color="white" size="3"><b> ${faq.faqTitle} FAQ 수정하기</b></font></p>
        </td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">제목</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type=text name="faqTitle" size="30"
		 value="${requestScope.faq.faqTitle}"></span></b></td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">카테고리</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<select id="faqCategory" name="faqCategory" >
			<option value="0">주문, 결제</option>
			<option value="1">상담기록</option>
			<option value="2">상담사문의</option>
			<option value="3">로그인</option>
			<option value="4">서비스문의</option>
			<option value="5">기타</option>
		</select>
		</span></b></td>
    </tr>
    <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">내 용</span></b></p>
        </td>
        <td width="450" height="20" ><b><span style="font-size:9pt;">
		<textarea name="faqContent" cols="50" rows="10">${requestScope.faq.faqContent}</textarea></span></b></td>
    </tr>
    <tr>
        <td width="450" height="20" colspan="2" align="center"><b><span style="font-size:9pt;">
		<input type="submit" value="수정하기"> <input type="reset" value="다시쓰기"></span></b></td>
    </tr>
</table>
</form>
<hr>
<div align=right><span style="font-size:9pt;">&lt;<a href="${pageContext.request.contextPath}/faq/list">리스트로 돌아가기</a>&gt;</span></div>
</BODY>


</HTML>