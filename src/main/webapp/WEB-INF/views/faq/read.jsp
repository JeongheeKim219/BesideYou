<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<HEAD>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<SCRIPT language=javascript>
	$(function(){
		//alert(1)
		$("input[value=수정하기]").click(function(){
			//document.requestForm.action="${pageContext.request.contextPath}/board/updateForm";
		   
			$("#requestForm").attr("action", "${pageContext.request.contextPath}/faq/updateForm");
			$("#requestForm").submit();
		})
	   
	   
		$("input[value=삭제하기]").click(function(){
			var result = confirm("정말 삭제 하시겠습니까?");
			if(result){
				$("#requestForm").attr("action", "${pageContext.request.contextPath}/faq/delete");
				$("#requestForm").submit();
			}
		})
	   
	   
	})
</script>


</HEAD>


<table align="center" cellpadding="5" cellspacing="2" width="600" border='1' style="border-collapse: collapse">
    <tr>
        <td width="1220" height="20" colspan="4" bgcolor="#3680B3">
            <p align="center"><font color="white" size="3"><b>
             FAQ 자세히보기</b></font></p>
        </td>
    </tr>
    <tr>
        <td width="100" height="20">
            <p align="right"><b><span style="font-size:9pt;">제목</span></b></p>
        </td>
        <td width="450" height="20" colspan="3">
        	<span style="font-size:9pt;"><b>${requestScope.faq.faqTitle}</b></span>
        </td>
    </tr>
    <tr>
        <td width="100" height="20">
            <p align="right"><b><span style="font-size:9pt;">카테고리</span></b></p>
        </td>
        <td width="450" height="20" colspan="3">
        	<span style="font-size:9pt;"><b>
        	<c:choose>
	        	<c:when test="${requestScope.faq.faqCategory == 0}">
	        		주문, 결제
	        	</c:when>
	        	<c:when test="${requestScope.faq.faqCategory == 1}">
	        		상담기록
	        	</c:when>
	        	<c:when test="${requestScope.faq.faqCategory == 2}">
	        		상담사문의
	        	</c:when>
	        	<c:when test="${requestScope.faq.faqCategory == 3}">
	        		로그인
	        	</c:when>
	        	<c:when test="${requestScope.faq.faqCategory == 4}">
	        		서비스문의
	        	</c:when>
	        	<c:when test="${requestScope.faq.faqCategory == 5}">
	        		기타
	        	</c:when>
        	</c:choose>
        	</b></span>
        </td>
    </tr>
    <tr>
		<td width="100" height="200" valign="top">
            <p align="right"><b><span style="font-size:9pt;">내용</span></b></p>
        </td>
		<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
        <td width="450" height="200" valign="top" colspan="3">
        <span style="font-size:9pt;"><b><pre>${requestScope.faq.faqContent}</pre></b></span></td>
    </tr>
    
      
    <tr>
        <td height="20" colspan="4" align="center" valign="middle">
			<!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
			<form name="requestForm" method="post" id="requestForm">
				<input type=hidden name="faqCode" value="${faq.faqCode}">
				<input type=button value="수정하기" >
				<input type=button value="삭제하기" >
			</form>
		</td>
    </tr>
</table>


<hr>
<div align=right><span style="font-size:9pt;">&lt;<a href="${pageContext.request.contextPath}/faq/list">리스트로 돌아가기</a>&gt;</span></div>














