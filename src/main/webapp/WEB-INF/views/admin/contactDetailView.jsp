<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

	
	<script type="text/javascript">
	function checkValid(){
		var f = window.document.writeForm;
		
		if ( f.contactReplyContent.value == "") {
		    alert( "내용을 입력해 주세요." );
		    f.contactReplyContent.focus();
			return false;
	    }
		return true;
		
		
	}
</script>
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
				<div class="row">
					<div class="col-lg-6">
						<div class="main-card mb-3 card">
							<div class="card-body">
								<h5 class="card-title"># ${contact.contactCode}</h5>
								<table class="mb-0 table">
									<tbody>
										<tr>
											<th scope="row">문의유형</th>
											<c:choose>
												<c:when test="${contact.contactCategory == 0}">
													<td>상담문의</td>
												</c:when>
												<c:when test="${contact.contactCategory == 1}">
													<td>결제문의</td>
												</c:when>
												<c:when test="${contact.contactCategory == 2}">
													<td>환불문의</td>
												</c:when>
												<c:otherwise>
													<td>기타문의</td>
												</c:otherwise>
											</c:choose>
										</tr>
										<tr>
											<th scope="row">문의자</th>
											<td>${contact.member.id}</td>
										</tr>
										<tr>
											<th scope="row">이메일</th>
											<td>${contact.member.email}</td>
										</tr>
										<tr>
											<th scope="row">연락처</th>
											<td>${contact.member.phone}</td>
										</tr>
										<tr>
											<th scope="row">제목</th>
											<td>${contact.contactTitle}</td>
										</tr>
										<tr>
											<th scope="row">내용</th>
											<td>${contact.contactContent}</td>
										</tr>
										<tr>
											<th scope="row">작성일자</th>
											<td>${contact.contactDate}</td>
										</tr>
						</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="main-card mb-3 card">
						<div class="card-body">
							<h5 class="card-title"># ${contact.contactCode}에 대한 답변</h5>


							<form class="contactReply" action="${pageContext.request.contextPath}/admin/insertContactReply" method="post" onsubmit="return checkValid()" name="writeForm">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<div class="position-relative row form-group">
									<div class="col-sm-10">
										<textarea  name="contactReplyContent" class="form-control" rows="10"></textarea>
									</div>
								</div>
								<div class="position-relative row form-check">
									<div class="col-sm-10 offset-sm-6">
										<button class="btn btn-primary">답변작성</button>
									</div>
								</div>
								<input type="hidden" name="contactCode" value="${contact.contactCode}"/>
							</form>

						</div>
					</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/adminCss/assets/scripts/main.js"></script>
</body>
</html>