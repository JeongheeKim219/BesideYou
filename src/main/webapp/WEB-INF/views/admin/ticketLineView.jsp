<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
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

</head>
<body>
	<%@include file="./header.jsp"%>
	<%@include file="./menu.jsp"%>
	<div class="app-main">
		<div class="app-main__outer">
			<div class="app-main__inner">
				<div class="app-page-title">
					<div class="page-title-wrapper">
						<div class="page-title-heading">
							<div class="page-title-icon">
								<i class="fa fa-address-book icon-gradient bg-mean-fruit"> </i>
							</div>
							<div>
								전체 회원 목록
								<div class="page-title-subheading">일반 회원, 상담사 회원 모두 조회
									가능합니다.</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="main-card mb-3 card">
						<div class="card-header" style="justify-content: flex-end;">
							<div class="widget-content widget-content-right">
								<form
									action="${pageContext.request.contextPath}/admin/selectByNameAndAlias"
									method="get">
									<div class="input-group">
										<input type="text" class="form-control form-control"
											name="keyword">
										<div class="input-group-append">
											<button type="button" data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="false"
												class="dropdown-toggle btn btn-secondary">이름/가명</button>
											<div role="menu" aria-hidden="true" class="dropdown-menu">
												<button type="button" tabindex="0" class="dropdown-item">아이디</button>

											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="card-body">
							<table class="mb-0 table table-hover">
								<thead>
									<tr>
										<th>사용내역 코드</th>
										<th>사용자</th>
										<th>잔여량</th>
										<th>상담권 사용일</th>
									</tr>
								</thead>
								<c:choose>
									<c:when test="${empty requestScope.tlList}">
										<tr>
											<td colspan="4"><p align="center">상담권 사용내역이 없습니다.</p></td>
										</tr>
									</c:when>
									<c:when test="${not empty requestScope.errorMessage}">
										<tr>
											<td colspan="4"><p align="center">${requestScope.errorMessage}</p></td>
										</tr>
									</c:when>
									<c:otherwise>
									<c:forEach items="${requestScope.tlList}" var="tlList">
										<tbody>
											<tr>
												<th scope="row">${tlList.ticket.ticketCode}-${tlList.ticketLinesCode}</th>
												<td>${tlList.ticket.member.id}</td>
												<td>${tlList.ticket.ticketRemain}</td>
												
												<fmt:parseDate var="parseDate" pattern="yyyy-MM-dd'T'HH:mm"
													value="${tlList.ticketLinesDate}" type="both" />
												<td><fmt:formatDate value="${parseDate}"
														pattern="yyyy-MM-dd HH:mm" /></td>
												</tr>		
									</c:forEach>
									</c:otherwise>
								</c:choose>
							</table>
							<c:choose>
								<c:when test="${empty requestScope.errorMessage}">
									<ul class="pagination">
										<li class="page-item"><a href="javascript:void(0);"
											class="page-link" aria-label="Previous"><span
												aria-hidden="false">«</span><span class="sr-only">이전</span></a></li>
										<c:forEach begin="0" end="${tlList.totalPages}" var="i">
											<c:choose>
												<c:when test="${tlList.totalPages==i}">
													<li class="page-item active"><a
														href="${pageContext.request.contextPath}/admin/ticketLineView?nowPage=${i}"
														class="page-link">${i+1}</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a
														href="${pageContext.request.contextPath}/admin/ticketLineView?nowPage=${i}"
														class="page-link">${i+1}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<li class="page-item"><a href="javascript:void(0);"
											class="page-link" aria-label="Next"><span
												aria-hidden="true">»</span><span class="sr-only">이후</span></a></li>
									</ul>
								</c:when>
							</c:choose>

						</div>
					</div>
				</div>
			</div>


		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
	<script>
		$(function() {

			/* 
			 $("button[tabindex='0']").click(function (){
			 $("#keyfield").();
			
			 });	
			 */

		})//제이 쿼리 Ready
	</script>
</body>
</html>