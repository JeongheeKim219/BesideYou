<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

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
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<form name="requestForm" method="post" id ="requestForm">
		<input type="hidden" id="reportCode" name="reviewCode" value = ""/>
		<input type="hidden" id="reviewCode" name="reviewCode" value = ""/>
		<%@include file="./header.jsp"%>
		<%@include file="./menu.jsp"%>
		<div class="app-main">
			<div class="app-main__outer">
				<div class="app-main__inner">
					<div class="app-page-title">
						<div class="page-title-wrapper">
							<div class="page-title-heading">
								<div class="page-title-icon">
									<i class="pe-7s-car icon-gradient bg-mean-fruit"> </i>
								</div>
								<div>
									Analytics Dashboard
									<div class="page-title-subheading">This is an example
										dashboard created using build-in elements and components.</div>
								</div>
							</div>
							<div class="page-title-actions">
								<button type="button" data-toggle="tooltip"
									title="Example Tooltip" data-placement="bottom"
									class="btn-shadow mr-3 btn btn-dark">
									<i class="fa fa-star"></i>
								</button>
								<div class="d-inline-block dropdown">
									<button type="button" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false"
										class="btn-shadow dropdown-toggle btn btn-info">
										<span class="btn-icon-wrapper pr-2 opacity-7"> <i
											class="fa fa-business-time fa-w-20"></i>
										</span> Buttons
									</button>
									<div tabindex="-1" role="menu" aria-hidden="true"
										class="dropdown-menu dropdown-menu-right">
										<ul class="nav flex-column">
											<li class="nav-item"><a href="javascript:void(0);"
												class="nav-link"> <i class="nav-link-icon lnr-inbox"></i>
													<span> Inbox </span>
													<div class="ml-auto badge badge-pill badge-secondary">86</div>
											</a></li>
											<li class="nav-item"><a href="javascript:void(0);"
												class="nav-link"> <i class="nav-link-icon lnr-book"></i>
													<span> Book </span>
													<div class="ml-auto badge badge-pill badge-danger">5</div>
											</a></li>
											<li class="nav-item"><a href="javascript:void(0);"
												class="nav-link"> <i class="nav-link-icon lnr-picture"></i>
													<span> Picture </span>
											</a></li>
											<li class="nav-item"><a disabled
												href="javascript:void(0);" class="nav-link disabled"> <i
													class="nav-link-icon lnr-file-empty"></i> <span> File
														Disabled </span>
											</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="main-card mb-3 card" style="width:50%; margin: 0 auto;" >
							<div class="card-body" style="width:100%; margin: 0 auto ">
								<h5 class="card-title" align="center">신고 내용</h5>
								<table class="mb-0 table table-hover" >					
									<tr>
										<td width="60">신고 번호 </td>
										<td >${requestScope.report.reportCode} </td>
									</tr>
									<tr>
										<td width="100">신고자 ID : </td>
										<td >${requestScope.report.member.id} </td>
									</tr>
									<tr>
										<td width="100">신고 유형 : </td>
										<td >${requestScope.report.reportOption} </td>
									</tr>
									<tr>
										<td width="100">리뷰 번호 : </td>
										<td >${requestScope.report.reviewStar.reviewCode} </td>
									</tr>
									<tr>
										<td width="100">신고일자 : </td>
										<td >${requestScope.report.reportDate} </td>
									</tr>
									<tr>
										<td width="100" colspan="2" style="border-bottom: none;">신고 내용 : </td>
									</tr>
									<tr>
										<td colspan="2" style="border-top: none;">${requestScope.report.reviewContent}</td>
									</tr>
									<tr>
										<td colspan="2" align="right">
											<input type="button" id="btn" name="btn" value="삭제">
											<input type="hidden" id="reviewCode" value="${requestScope.report.reviewStar.reviewCode}">
											<input type="hidden" id="reportCode" value="${requestScope.report.reportCode}">
										</td>
									</tr>		
								</table>
			</div>
		  </div>	
		</div>
	</form>	
	
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/adminCss/assets/scripts/main.js"></script>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btn").click(function() {
			var reviewCode = $('#reviewCode').val();
			alert(reviewCode);
		});
	});
</script>
</html>