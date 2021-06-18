<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<HEAD>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<SCRIPT language=javascript>
	$(function(){
		//alert(1)
/* 		$("input[value=수정하기]").click(function(){
			//document.requestForm.action="${pageContext.request.contextPath}/board/updateForm";
		   
			$("#requestForm").attr("action", "${pageContext.request.contextPath}/contact/updateForm");
			$("#requestForm").submit();
		}) */
	   
	   
		$("input[value=삭제하기]").click(function(){
			var result = confirm("정말 삭제 하시겠습니까?");
			if(result){
				$("#requestForm").attr("action", "${pageContext.request.contextPath}/contact/delete");
				$("#requestForm").submit();
			}
		})
	   
		$("input[value=답변하기]").click(function(){
			//document.requestForm.action="${pageContext.request.contextPath}/board/updateForm";
		   
			$("#requestForm").attr("action", "${pageContext.request.contextPath}/admin/contactDetailView");
			$("#requestForm").submit();
		})
	   
	})
</script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Language" content="ko">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Analytics Dashboard - This is an example dashboard
	created using build-in elements and components.</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
<meta name="description"
	content="This is an example dashboard created using build-in elements and components.">
<meta name="msapplication-tap-highlight" content="no">
<!--
    =========================================================
    * ArchitectUI HTML Theme Dashboard - v1.0.0
    =========================================================
    * Product Page: https://dashboardpack.com
    * Copyright 2019 DashboardPack (https://dashboardpack.com)
    * Licensed under MIT (https://github.com/DashboardPack/architectui-html-theme-free/blob/master/LICENSE)
    =========================================================
    * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
    -->
<link href="${pageContext.request.contextPath}/adminCss/main.css"
	rel="stylesheet">
	
<style type="text/css">
	input[type=button]{
		background-color: #50BCDF;
		border: none;
		border-radius: 5px;
		color: #fff;
		width: 100px;
	}
</style>

</HEAD>
<body>
	<%@include file="./header.jsp"%>
	<%@include file="./menu.jsp"%>
<table align="center" cellpadding="5" cellspacing="2" width="600" border="1px" style="border-collapse: collapse">
    <tr>
        <td width="1220" height="20" colspan="4" bgcolor="#FFFFFF">
            <p align="center"><font color="black" size="3"><b>
             문의글 자세히보기</b></font></p>
        </td>
    </tr>
    <tr>
        <td width="100" height="20">
            <p align="right"><b><span style="font-size:9pt;">제목</span></b></p>
        </td>
        <td width="450" height="20" colspan="3">
        	<span style="font-size:9pt;"><b>${requestScope.contact.contactTitle}</b></span>
        </td>
    </tr>
    <tr>
        <td width="100" height="20">
            <p align="right"><b><span style="font-size:9pt;">카테고리</span></b></p>
        </td>
        <td width="450" height="20" colspan="3">
        	<span style="font-size:9pt;"><b>
        		<c:choose>
	            	<c:when test="${contact.contactCategory == 0}">
	            		상담
	            	</c:when>
	            	<c:when test="${contact.contactCategory == 1}">
	            		결제
	            	</c:when>
	            	<c:when test="${contact.contactCategory == 2}">
	            		환불
	            	</c:when>
	            	<c:when test="${contact.contactCategory == 3}">
	            		기타
	            	</c:when>
		    	</c:choose>
        	</b></span>
        </td>
    </tr>
    <tr>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">등록일</span></b></p>
        </td>
        <td width="300" height="20">
        	<span style="font-size:9pt;"><b>${requestScope.contact.contactDate}</b></span>
        </td>
    </tr>
    <tr>
		<td width="100" height="200" valign="top">
            <p align="right"><b><span style="font-size:9pt;">내용</span></b></p>
        </td>
		<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
        <td width="450" height="200" valign="top" colspan="3">
        <span style="font-size:9pt;"><b><pre>${requestScope.contact.contactContent}</pre></b></span></td>
    </tr>
    
      
    <tr>
        <td height="20" colspan="4" align="center" valign="middle">
			<!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
			<form name="requestForm" method="post" id="requestForm">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type=hidden name="contactCode" value="${contact.contactCode}">
				
				<!-- <input type=button value="수정하기" > -->
				<input type=button value="답변하기" >
				<input type=button value="삭제하기" >
			</form>
		</td>
    </tr>
</table>

<br>
<h5> 답변 </h5>

${contact.contactReply.contactReplyDate}<br>
${contact.contactReply.contactReplyContent}<p>




<div align=right><span style="font-size:9pt;">&lt;<a href="${pageContext.request.contextPath}/admin/contactView">리스트로 돌아가기</a>&gt;</span></div>

</body>












