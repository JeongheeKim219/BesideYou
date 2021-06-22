<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<HEAD>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<SCRIPT language=javascript>
	$(function() {
		//alert(1)
		/* 		$("input[value=수정하기]").click(function(){
		 //document.requestForm.action="${pageContext.request.contextPath}/board/updateForm";
		
		 $("#requestForm").attr("action", "${pageContext.request.contextPath}/contact/updateForm");
		 $("#requestForm").submit();
		 }) */

		$("#delete").click(function() {
				var result = confirm("정말 삭제 하시겠습니까?");
				if (result) {
					$("#requestForm").attr("action","${pageContext.request.contextPath}/contact/delete");
						$("#requestForm").submit();
				}
			})

		$("#answer").click(function() {
				//document.requestForm.action="${pageContext.request.contextPath}/board/updateForm";
				$("#requestForm").attr("action","${pageContext.request.contextPath}/admin/contactDetailView");
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



</HEAD>
<body>
	<%@include file="./header.jsp"%>
	<div class="app-main">
	<%@include file="./menu.jsp"%>
	<div class="app-main__outer">
			<div class="app-main__inner">

	<div class="main-card mb-3 card"
		style="width: 700px; margin: 0 auto; top: 100px;">
		<div class="card-body">
			<h5 class="card-title"># ${contact.contactCode}</h5>
			<table class="mb-0 table">
				<tbody>
					<tr>
						<th scope="row">제목</th>
						<td>${requestScope.contact.contactTitle}</td>
					</tr>
					<tr>
						<th scope="row">카테고리</th>
						<td><c:choose>
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
							</c:choose></td>
					</tr>
					<tr>
						<th scope="row">등록일</th>
						<td>${requestScope.contact.contactDate}</td>
					</tr>
					<tr>
						<th scope="row">내용</th>
						<td>${requestScope.contact.contactContent}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<form id="requestForm" method="post" name="requestForm">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type=hidden name="contactCode" value="${contact.contactCode}">
			<div class="position-relative row form-check" style="left: 163px">
			<div class="col-sm-10 offset-sm-6">
					<button class="btn btn-primary" id="answer">답변하기</button>
					<button class="btn btn-primary" id="delete">삭제하기</button>
				</div>
			</div>
		</form>
		
		
		<div style="margin: 30px">
			<c:choose>
				<c:when test="${contact.contactReply.contactReplyContent == null}">
					<h5>작성된 답변이 없습니다.</h5>			
				</c:when>
				<c:otherwise>
					<h5>답변</h5>
					${contact.contactReply.contactReplyDate}<br>
					${contact.contactReply.contactReplyContent}
					<p>
				</c:otherwise>
			</c:choose>
		</div>
		
		<div align="right">
			<a href="${pageContext.request.contextPath}/admin/contactView">
				<button class="btn btn-primary">리스트로 돌아가기</button>
			</a>
		</div>
		
	</div>
	</div>
	</div>
	</div>
	




</body>











