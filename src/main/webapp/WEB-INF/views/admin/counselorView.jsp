<%@page import="java.util.Arrays"%>
<%@page import="org.aspectj.util.GenericSignature.ArrayTypeSignature"%>
<%@page import="java.util.ArrayList"%>
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
<link href="${pageContext.request.contextPath}/adminCss/main.css" rel="stylesheet">

<style>



</style>
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
								<button type="button" id="ajaxTest" data-toggle="dropdown"
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
			<div class="col-md-12">
				<div class="main-card mb-3 card">
					<div class="card-header">
						상담사 등록 현황
						<div class="btn-actions-pane-right">
							<div role="group" class="btn-group-sm btn-group">
								<button class="active btn btn-focus" id="all">전체</button>
								<button class="btn btn-focus" id="request">등록신청</button>
								<button class="btn btn-focus" id="denied">반려</button>
								<button class="btn btn-focus" id="approval">승인</button>	
								<button class="btn btn-focus" id="revoked">자격정지</button>	
							</div>
						</div>
					</div>
					<div class="table-responsive">
						<table class="align-middle mb-0 table table-borderless table-striped table-hover">
							<thead>
								<tr>
									<th class="text-center">상담사코드</th>
									<th class="text-center">이름</th>
									<th class="text-center">전문분야</th>
									<th class="text-center">자격증</th>	
									<th class="text-center">확인/반려</th>																	
									<th class="text-center">상태</th>	
								</tr>
							</thead>
					<c:choose>
						<c:when test="${not empty requestScope.errorMessage}">
							<tr>
								<td colspan="6"><p align="center">${requestScope.errorMessage}</p></td>
							</tr>
						</c:when>
					<c:otherwise>
					<tbody>
					<c:forEach items="${requestScope.pageList.content}" var="newCounselor" varStatus="reqState">
							
								<tr>
									<td class="text-center text-muted"># ${newCounselor.counselorCode}</td>
									<td>
										<div class="widget-content p-0">
											<div class="widget-content-wrapper">
												<div class="widget-content-left mr-3">
													<div class="widget-content-left">
														<img width="40" class="rounded-circle"
															src="${pageContext.request.contextPath}/assets/profileSave/${newCounselor.picture}" alt="${newCounselor.picture}">
													</div>
												</div>
												<div class="widget-content-left flex2">
													<div class="widget-heading">${newCounselor.member.name}</div>
													<div class="widget-subheading opacity-7">${newCounselor.degree}</div>
												</div>
											</div>
										</div>
									</td>
									<c:set value="${newCounselor.speciality}" var="totalSpec"/>
									<td class="text-center">
										<c:forEach items="${totalSpec}" var="spec" varStatus="state">
											<c:choose>
												<c:when test="${state.last}">
													<span>${spec.specialityName}</span>
												</c:when>
												<c:otherwise>
													<span>${spec.specialityName}, </span>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</td>
									<td class="text-center">
											<a href="${pageContext.request.contextPath}/admin/download?fileName=${newCounselor.cerificate}" class="btn btn-primary btn-sm">다운로드
											</a>
									</td>
									<td>
									 <div class="dropdown d-inline-block">
                                            <button type="button" aria-haspopup="true" aria-expanded="false" data-toggle="dropdown" class="mb-2 mr-2 dropdown-toggle btn btn-focus">인증</button>
                                            <div tabindex="-1" role="menu" aria-hidden="true" class="dropdown-menu">
                                                <button type="button" tabindex="1" class="dropdown-item" id="approval" value="${newCounselor.member.memberCode}">승인</button>
                                                <button type="button" tabindex="2" class="dropdown-item" id="denial" value="${newCounselor.member.memberCode}">반려</button>                                                
                                            </div>
                                        </div>
									</td>
									<td>
									<c:choose>
										<c:when test="${newCounselor.counselorState == 0}">
											<div class="mb-3 mr-3 badge badge-info">대기</div>
										</c:when>
										<c:when test="${newCounselor.counselorState == 1}">
											<div class="mb-2 mr-2 badge badge-warning">반려</div>
										</c:when>
										<c:when test="${newCounselor.counselorState == 2}">
											<div class="mb-2 mr-2 badge badge-success">승인</div>
										</c:when>
										<c:when test="${newCounselor.counselorState == 3}">
											<div class="mb-2 mr-2 badge badge-secondary">정지</div>
										</c:when>
									</c:choose>
									</td>
									</tr>
									
									</c:forEach>
									</tbody>
								</c:otherwise>
							</c:choose>
						</table>
						<c:choose>
						<c:when test ="${empty requestScope.errorMessage}">
						<ul class="pagination">
								<li class="page-item"><a href="javascript:void(0);"
									class="page-link" aria-label="Previous"><span
										aria-hidden="false">«</span><span class="sr-only">이전</span></a></li>
								<c:forEach begin="0" end="${pageList.totalPages-1}" var="i">
									<c:choose>
										<c:when test="${pageList.number==i}">
											<li class="page-item active"><a
												href="${pageContext.request.contextPath}/admin/viewCounselorState?currentPage=${i}"
												class="page-link">${i+1}</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a
												href="${pageContext.request.contextPath}/admin/viewCounselorState?currentPage=${i}"
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
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/adminCss/assets/scripts/main.js"></script>
	<!-- Chart.js -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
	<script type="text/javascript"></script>
	<script>
		$(function() {
		
			
			
			$("button[tabindex='1']").click(function (){		
				var answer = confirm("상담사 자격을 승인하시겠습니까?"); 
				var memberCode = $(this).val();
				if(answer){
					location.href = "${pageContext.request.contextPath}/admin/updateCounselorState/" + memberCode +"/2";
				
				}		
			});	
			
			$("button[tabindex='2']").click(function (){
				var answer = confirm("상담사 자격 신청을 반려하시겠습니까?"); 
				var memberCode = $(this).val();
				alert(memberCode);
				if(answer){
					location.href = "${pageContext.request.contextPath}/admin/updateCounselorState/" + memberCode +"/1";
				}		
			});
			

			$("#all").click(function (){
				$(".active btn btn-focus").removeClass("active");
				$(this).addClass("active btn btn-focus");
				location.href = "${pageContext.request.contextPath}/admin/viewCounselorState/4";
			});

			$("#request").click(function (){
				$(".active btn btn-focus").removeClass("active");
				$(this).addClass("active btn btn-focus");
				location.href = "${pageContext.request.contextPath}/admin/viewCounselorState/0";
			});
			
			$("#denied").click(function (){
				$(".btn btn-focus active").removeClass("btn btn-focus active").addClass("btn btn-focus");
				$(this).addClass("btn btn-focus active");
				location.href = "${pageContext.request.contextPath}/admin/viewCounselorState/1";
			});
			
			$("#approval").click(function (){
				$(".btn btn-focus active").removeClass("btn btn-focus active").addClass("btn btn-focus");
				$(this).addClass("btn btn-focus active");
				location.href = "${pageContext.request.contextPath}/admin/viewCounselorState/2";
			});
			
			$("#revoked").click(function (){
				$(".btn btn-focus active").removeClass("btn btn-focus active").addClass("btn btn-focus");
				$(this).addClass("btn btn-focus active");
				location.href = "${pageContext.request.contextPath}/admin/viewCounselorState/3";
			});
			
			
		})//JQuery Ready 끝
	</script>
</body>
</html>