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

<title>Admin Page</title>
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

#rowWidget {
	display: flex;
	flex-direction: row;
}

#rowWidgetContainer {
	flex-wrap: wrap;
}

.direction {
	display: flex;
	flex-direction: column;
}

.list-group-item {
	padding: .75rem 1rem;
}

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
								<i class="fa fa-cog icon-gradient bg-deep-blue icon-gradient bg-deep-blue"></i>
							</div>
							<div>
								<b>관리자 대쉬보드</b>
								<div class="page-title-subheading">전체적인 운영상황을 요약해서 보여줍니다.</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
				<div>
					</div>
					<div class="col-md-6 col-xl-4">
					
						<div class="card mb-3 widget-content bg-midnight-bloom">
							<div class="widget-content-wrapper text-white">
								<div class="widget-content-left">
									<div class="widget-heading">신규 일반회원 가입</div>
									<div class="widget-subheading">${now}</div>
								</div>
								<div class="widget-content-right">
									<div class="widget-numbers text-white">
										<span>${newRegularCount}</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-xl-4">
						<div class="card mb-3 widget-content bg-amy-crisp">
							<div class="widget-content-wrapper text-white">
								<div class="widget-content-left">
									<div class="widget-heading">신규 상담사 회원 가입</div>
									<div class="widget-subheading">${now}</div>
								</div>
								<div class="widget-content-right">
									<div class="widget-numbers text-white">
										<span>${newCounselorCount}</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-xl-4">
						<div class="card mb-3 widget-content bg-grow-early">
							<div class="widget-content-wrapper text-white">
								<div class="widget-content-left">
									<div class="widget-heading">신규 상담 신청</div>
									<div class="widget-subheading">${now}</div>
								</div>
								<div class="widget-content-right">
									<div class="widget-numbers text-white">
										<span>${newCounselCount}</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-xl-4">
						<div class="card mb-3 widget-content bg-premium-dark">
							<div class="widget-content-wrapper text-white">
								<div class="widget-content-left">
									<div class="widget-heading">당일 매출액</div>
									<div class="widget-subheading">상담권 매출액</div>
								</div>
								<div class="widget-content-right">
									<div class="widget-numbers text-warning">
										<span><fmt:formatNumber currencyCode="KRW"
												currencySymbol="원" value="${dayIncome}" />원</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-xl-4">
						<div class="card mb-3 widget-content bg-tempting-azure">
							<div class="widget-content-wrapper text-gray">
								<div class="widget-content-left">
									<div class="widget-heading">미처리 문의 건수</div>
									<div class="widget-subheading">처리대기 문의</div>
								</div>
								<div class="widget-content-right">
									<div class="widget-numbers text-primary">
										<span>${pendingContactCount}</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 요약카드 끝 -->
				<!-- 상담상태 내역 위젯 시작 -->
				<div class="row">
					<div class="col-md-6">
						<div class="main-card mb-3 card" id="rowWidgetContainer">
							<div class="card-header">
								<h5>상담 신청 상황</h5>
							</div>
							<div class="card-body">
								<ul class="list-group" id="rowWidget">
									<li class="list-group-item">
										<div class="widget-content p-0">
											<div class="widget-content-outer">
												<div class="widget-content-wrapper">

													<div class="direction">
														<div class="widget-content-left">
															<c:set var="pending" value="${stateMap.pending}" />
															<div class="widget-heading">신청</div>
															<div class="widget-subheading">확정 전</div>
														</div>
														<div class="widget-content-right">
															<div class="widget-numbers text-success">${fn:length(pending)}</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</li>
									<li class="list-group-item">
										<div class="widget-content p-0">
											<div class="widget-content-outer">
												<div class="widget-content-wrapper">
													<div class="direction">
														<div class="widget-content-left">
															<c:set var="denied" value="${stateMap.denied}" />
															<div class="widget-heading">반려</div>
															<div class="widget-subheading">예약거절</div>
														</div>
														<div class="widget-content-right">
															<div class="widget-numbers text-primary">${fn:length(denied)}</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</li>
									<li class="list-group-item">
										<div class="widget-content p-0">
											<div class="widget-content-outer">
												<div class="widget-content-wrapper">
													<div class="direction">
														<div class="widget-content-left">
															<c:set var="approval" value="${stateMap.approval}" />
															<div class="widget-heading">승인</div>
															<div class="widget-subheading">예약완료</div>
														</div>
														<div class="widget-content-right">
															<div class="widget-numbers text-danger">${fn:length(approval)}</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</li>
									<li class="list-group-item">
										<div class="widget-content p-0">
											<div class="widget-content-outer">
												<div class="widget-content-wrapper">
													<div class="direction">
														<div class="widget-content-left">
															<c:set var="done" value="${stateMap.done}" />
															<div class="widget-heading">완료</div>
															<div class="widget-subheading">이번 달 누적</div>
														</div>
														<div class="widget-content-right">
															<div class="widget-numbers text-warning">${fn:length(done)}</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- 상담상태 내역 위젯 끝 -->
					<!-- 상담사 등록 상태 위젯 시작 -->
					<div class="col-md-6">
						<div class="main-card mb-3 card" id="rowWidgetContainer">
							<div class="card-header">
								<h5>상담사 등록 상황</h5>
							</div>
							<div class="card-body">
								<ul class="list-group" id="rowWidget">
									<li class="list-group-item">
										<div class="widget-content p-0">
											<div class="widget-content-outer">
												<div class="widget-content-wrapper">
													<div class="direction">
														<div class="widget-content-left">
															<c:set var="registerPending"
																value="${registerStateMap.counselorPending}" />
															<div class="widget-heading">신청</div>
															<div class="widget-subheading">검토대기</div>
														</div>
														<div class="widget-content-right">
															<div class="widget-numbers text-success">${fn:length(registerPending)}</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</li>
									<li class="list-group-item">
										<div class="widget-content p-0">
											<div class="widget-content-outer">
												<div class="widget-content-wrapper">
													<div class="direction">
														<div class="widget-content-left">
															<c:set var="registerDenied"
																value="${registerStateMap.counselorDenied}" />
															<div class="widget-heading">반려</div>
															<div class="widget-subheading">승인거절</div>
														</div>
														<div class="widget-content-right">
															<div class="widget-numbers text-primary">${fn:length(registerDenied)}</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</li>
									<li class="list-group-item">
										<div class="widget-content p-0">
											<div class="widget-content-outer">
												<div class="widget-content-wrapper">
													<div class="direction">
														<div class="widget-content-left">
															<c:set var="registerApproval"
																value="${registerStateMap.counselorApproval}" />
															<div class="widget-heading">승인</div>
															<div class="widget-subheading">등록완료</div>
														</div>
														<div class="widget-content-right">
															<div class="widget-numbers text-danger">${fn:length(registerApproval)}</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</li>
									<li class="list-group-item">
										<div class="widget-content p-0">
											<div class="widget-content-outer">
												<div class="widget-content-wrapper">
													<div class="direction">
														<div class="widget-content-left">
															<c:set var="registerRevoked"
																value="${registerStateMap.counselorRevoked}" />
															<div class="widget-heading">자격취소</div>
															<div class="widget-subheading">등록해제</div>
														</div>
														<div class="widget-content-right">
															<div class="widget-numbers text-warning">${fn:length(registerRevoked)}</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- 상담사 등록 상태 위젯 끝 -->
				<!-- 일별 신규 가입회원 차트 시작 -->
				<div class="row">
					<div class="col-md-12 col-lg-6">
						<div class="mb-3 card">
							<div
								class="card-header-tab card-header-tab-animation card-header">
								<div class="card-header-title">
									<i class="header-icon lnr-apartment icon-gradient bg-love-kiss">
									</i> 신규 회원 증가 추이
								</div>
							</div>
							<div class="card-body">
										<div class="widget-chart p-3">
													<canvas id="newMemeberChart"></canvas>
												</div>
											</div>
											</div>
						<!-- 일별 신규 가입회원 차트 끝 -->
						<!-- 상담사별 순위 조회 -->
						<div class="mb-3 card">
							<div
								class="card-header-tab card-header-tab-animation card-header">
								<div class="card-header-title">
									<i class="header-icon lnr-apartment icon-gradient bg-love-kiss">
									</i> 상담사 별 상담건수
									<c:out value="${requestScope.counselorList}"/>
								</div>
							</div>
							<div class="card-body">
								<div class="scroll-area-sm">
									<div class="scrollbar-container">
										<ul class="rm-list-borders rm-list-borders-scroll list-group list-group-flush" id="rank-table">
											<!-- Ajax로 구현될 영역-->
										
											<!-- ----------------- -->
										<ul class="rm-list-borders rm-list-borders-scroll list-group list-group-flush">
										<c:forEach  var="counselor" items="${requestScope.counselorList}">
											<li class="list-group-item">
												<div class="widget-content p-0">
													<div class="widget-content-wrapper">
														<div class="widget-content-left mr-3">
															<%-- <img width="42" class="rounded-circle"
																src="${pageContext.request.contextPath}/adminCss/assets/images/avatars/9.jpg"
																alt=""> --%>
														</div>
														</div>
														<div class="widget-content-right">
															<div class="widget-content-left">
															<div class="widget-heading">${counselor.member.name}</div>
														<c:forEach items="${counselor.speciality}" var="feild">	
															<div class="widget-subheading">${feild.specialityName}</div>
														</c:forEach>
														<div class="font-size-xlg text-muted">
																<small class="opacity-5 pr-1"></small> <span class="count"></span>
																<small class="text-danger pl-2"> <i
																	class="fa fa-angle-down"></i>
																</small>
															</div>
														</div>
													</div>
												</div>
											</li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
			<!-- 일별 신규 가입회원 차트 끝 -->
			<!-- 월별 상담/ 상담신청 건수 차트 시작 -->
			<div class="col-md-12 col-lg-6">
				<div class="mb-3 card">
					<div class="card-header-tab card-header">
						<div class="card-header-title">
							<i class="header-icon lnr-rocket icon-gradient bg-tempting-azure">
							</i> Bandwidth Reports
						</div>
						<div class="btn-actions-pane-right">
							<div class="nav">
								<a href="javascript:void(0);"
									class="border-0 btn-pill btn-wide btn-transition active btn btn-outline-alternate">Tab
									1</a> <a href="javascript:void(0);"
									class="ml-1 btn-pill btn-wide border-0 btn-transition  btn btn-outline-alternate second-tab-toggle-alt">Tab
									2</a>
							</div>
						</div>
					</div>
					<div class="tab-content">
						<div class="tab-pane fade active show" id="tab-eg-55">
							<div class="widget-chart p-3">
								<div style="height: 350px">
									<canvas id="newCounselByMonth"></canvas>
								</div>
								<div class="widget-chart-content text-center mt-5">
									<div class="widget-description mt-0 text-warning">
										<i class="fa fa-arrow-left"></i> <span class="pl-1">175.5%</span>
										<span class="text-muted opacity-8 pl-1">increased
											server resources</span>
									</div>
								</div>
							</div>
							<div class="pt-2 card-body">
								<div class="row">
									<div class="col-md-6">
										<div class="widget-content">
											<div class="widget-content-outer">
												<div class="widget-content-wrapper">
													<div class="widget-content-left">
														<div class="widget-numbers fsize-3 text-muted">63%</div>
													</div>
													<div class="widget-content-right">
														<div class="text-muted opacity-6">Generated Leads</div>
													</div>
												</div>
												<div class="widget-progress-wrapper mt-1">
													<div
														class="progress-bar-sm progress-bar-animated-alt progress">
														<div class="progress-bar bg-danger" role="progressbar"
															aria-valuenow="63" aria-valuemin="0" aria-valuemax="100"
															style="width: 63%;"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="widget-content">
											<div class="widget-content-outer">
												<div class="widget-content-wrapper">
													<div class="widget-content-left">
														<div class="widget-numbers fsize-3 text-muted">32%</div>
													</div>
													<div class="widget-content-right">
														<div class="text-muted opacity-6">Submitted Tickers</div>
													</div>
												</div>
												<div class="widget-progress-wrapper mt-1">
													<div
														class="progress-bar-sm progress-bar-animated-alt progress">
														<div class="progress-bar bg-success" role="progressbar"
															aria-valuenow="32" aria-valuemin="0" aria-valuemax="100"
															style="width: 32%;"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="widget-content">
											<div class="widget-content-outer">
												<div class="widget-content-wrapper">
													<div class="widget-content-left">
														<div class="widget-numbers fsize-3 text-muted">71%</div>
													</div>
													<div class="widget-content-right">
														<div class="text-muted opacity-6">Server Allocation</div>
													</div>
												</div>
												<div class="widget-progress-wrapper mt-1">
													<div
														class="progress-bar-sm progress-bar-animated-alt progress">
														<div class="progress-bar bg-primary" role="progressbar"
															aria-valuenow="71" aria-valuemin="0" aria-valuemax="100"
															style="width: 71%;"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="widget-content">
											<div class="widget-content-outer">
												<div class="widget-content-wrapper">
													<div class="widget-content-left">
														<div class="widget-numbers fsize-3 text-muted">41%</div>
													</div>
													<div class="widget-content-right">
														<div class="text-muted opacity-6">Generated Leads</div>
													</div>
												</div>
												<div class="widget-progress-wrapper mt-1">
													<div
														class="progress-bar-sm progress-bar-animated-alt progress">
														<div class="progress-bar bg-warning" role="progressbar"
															aria-valuenow="41" aria-valuemin="0" aria-valuemax="100"
															style="width: 41%;"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 월별 상담/ 상담신청 건수 차트 끝 -->
		<div class="row">
			<div class="col-md-12">
				<div class="main-card mb-3 card">
					<div class="card-header">
						상담사 등록 현황
						<div class="btn-actions-pane-right">
							<div role="group" class="btn-group-sm btn-group">
								<button class="active btn btn-focus">Last Week</button>
								<button class="btn btn-focus">All Month</button>
							</div>
						</div>
					</div>
					<div class="table-responsive">
						<table
							class="align-middle mb-0 table table-borderless table-striped table-hover">
							<thead>
								<tr>
									<th class="text-center">#</th>
									<th>Name</th>
									<th class="text-center">City</th>
									<th class="text-center">Status</th>
									<th class="text-center">Actions</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="text-center text-muted">#345</td>
									<td>
										<div class="widget-content p-0">
											<div class="widget-content-wrapper">
												<div class="widget-content-left mr-3">
													<div class="widget-content-left">
														<img width="40" class="rounded-circle"
															src="assets/images/avatars/4.jpg" alt="">
													</div>
												</div>
												<div class="widget-content-left flex2">
													<div class="widget-heading">John Doe</div>
													<div class="widget-subheading opacity-7">Web
														Developer</div>
												</div>
											</div>
										</div>
									</td>
									<td class="text-center">Madrid</td>
									<td class="text-center">
										<div class="badge badge-warning">Pending</div>
									</td>
									<td class="text-center">
										<button type="button" id="PopoverCustomT-1"
											class="btn btn-primary btn-sm">Details</button>
									</td>
								</tr>
								<tr>
									<td class="text-center text-muted">#347</td>
									<td>
										<div class="widget-content p-0">
											<div class="widget-content-wrapper">
												<div class="widget-content-left mr-3">
													<div class="widget-content-left">
														<img width="40" class="rounded-circle"
															src="assets/images/avatars/3.jpg" alt="">
													</div>
												</div>
												<div class="widget-content-left flex2">
													<div class="widget-heading">Ruben Tillman</div>
													<div class="widget-subheading opacity-7">Etiam sit
														amet orci eget</div>
												</div>
											</div>
										</div>
									</td>
									<td class="text-center">Berlin</td>
									<td class="text-center">
										<div class="badge badge-success">Completed</div>
									</td>
									<td class="text-center">
										<button type="button" id="PopoverCustomT-2"
											class="btn btn-primary btn-sm">Details</button>
									</td>
								</tr>
								<tr>
									<td class="text-center text-muted">#321</td>
									<td>
										<div class="widget-content p-0">
											<div class="widget-content-wrapper">
												<div class="widget-content-left mr-3">
													<div class="widget-content-left">
														<img width="40" class="rounded-circle"
															src="assets/images/avatars/2.jpg" alt="">
													</div>
												</div>
												<div class="widget-content-left flex2">
													<div class="widget-heading">Elliot Huber</div>
													<div class="widget-subheading opacity-7">Lorem ipsum
														dolor sic</div>
												</div>
											</div>
										</div>
									</td>
									<td class="text-center">London</td>
									<td class="text-center">
										<div class="badge badge-danger">In Progress</div>
									</td>
									<td class="text-center">
										<button type="button" id="PopoverCustomT-3"
											class="btn btn-primary btn-sm">Details</button>
									</td>
								</tr>
								<tr>
									<td class="text-center text-muted">#55</td>
									<td>
										<div class="widget-content p-0">
											<div class="widget-content-wrapper">
												<div class="widget-content-left mr-3">
													<div class="widget-content-left">
														<img width="40" class="rounded-circle"
															src="assets/images/avatars/1.jpg" alt="">
													</div>
												</div>
												<div class="widget-content-left flex2">
													<div class="widget-heading">Vinnie Wagstaff</div>
													<div class="widget-subheading opacity-7">UI Designer</div>
												</div>
											</div>
										</div>
									</td>
									<td class="text-center">Amsterdam</td>
									<td class="text-center">
										<div class="badge badge-info">On Hold</div>
									</td>
									<td class="text-center">
										<button type="button" id="PopoverCustomT-4"
											class="btn btn-primary btn-sm">Details</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="d-block text-center card-footer">
						<button class="mr-2 btn-icon btn-icon-only btn btn-outline-danger">
							<i class="pe-7s-trash btn-icon-wrapper"> </i>
						</button>
						<button class="btn-wide btn btn-success">Save</button>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 col-lg-3">
				<div
					class="card-shadow-danger mb-3 widget-chart widget-chart2 text-left card">
					<div class="widget-content">
						<div class="widget-content-outer">
							<div class="widget-content-wrapper">
								<div class="widget-content-left pr-2 fsize-1">
									<div class="widget-numbers mt-0 fsize-3 text-danger">71%</div>
								</div>
								<div class="widget-content-right w-100">
									<div class="progress-bar-xs progress">
										<div class="progress-bar bg-danger" role="progressbar"
											aria-valuenow="71" aria-valuemin="0" aria-valuemax="100"
											style="width: 71%;"></div>
									</div>
								</div>
							</div>
							<div class="widget-content-left fsize-1">
								<div class="text-muted opacity-6">Income Target</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-3">
				<div
					class="card-shadow-success mb-3 widget-chart widget-chart2 text-left card">
					<div class="widget-content">
						<div class="widget-content-outer">
							<div class="widget-content-wrapper">
								<div class="widget-content-left pr-2 fsize-1">
									<div class="widget-numbers mt-0 fsize-3 text-success">54%</div>
								</div>
								<div class="widget-content-right w-100">
									<div class="progress-bar-xs progress">
										<div class="progress-bar bg-success" role="progressbar"
											aria-valuenow="54" aria-valuemin="0" aria-valuemax="100"
											style="width: 54%;"></div>
									</div>
								</div>
							</div>
							<div class="widget-content-left fsize-1">
								<div class="text-muted opacity-6">Expenses Target</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-3">
				<div
					class="card-shadow-warning mb-3 widget-chart widget-chart2 text-left card">
					<div class="widget-content">
						<div class="widget-content-outer">
							<div class="widget-content-wrapper">
								<div class="widget-content-left pr-2 fsize-1">
									<div class="widget-numbers mt-0 fsize-3 text-warning">32%</div>
								</div>
								<div class="widget-content-right w-100">
									<div class="progress-bar-xs progress">
										<div class="progress-bar bg-warning" role="progressbar"
											aria-valuenow="32" aria-valuemin="0" aria-valuemax="100"
											style="width: 32%;"></div>
									</div>
								</div>
							</div>
							<div class="widget-content-left fsize-1">
								<div class="text-muted opacity-6">Spendings Target</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-3">
				<div
					class="card-shadow-info mb-3 widget-chart widget-chart2 text-left card">
					<div class="widget-content">
						<div class="widget-content-outer">
							<div class="widget-content-wrapper">
								<div class="widget-content-left pr-2 fsize-1">
									<div class="widget-numbers mt-0 fsize-3 text-info">89%</div>
								</div>
								<div class="widget-content-right w-100">
									<div class="progress-bar-xs progress">
										<div class="progress-bar bg-info" role="progressbar"
											aria-valuenow="89" aria-valuemin="0" aria-valuemax="100"
											style="width: 89%;"></div>
									</div>
								</div>
							</div>
							<div class="widget-content-left fsize-1">
								<div class="text-muted opacity-6">Totals Target</div>
							</div>
						</div>
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
	<script type="text/javascript">
		$(function() {

			var weekList = [];
			var monthList = [];
			var today = new Date();
			var newJoinMember = new Array();
			var countCounselList = new Array();
			var counselReqList = new Array();
		
			
			//날짜구하기
			var v = 1;
			for (var i = 0; i <= 6; i++) {
				var year = today.getFullYear().toString().substring(2);
				var month = today.getMonth() + 1;
				if (month < 10) {
					month = "0" + month;
				}
				var day = today.getDate();
				if (day < 10) {
					day = "0" + day;
				}

				var dateString = year + '/' + month + '/' + day;
				weekList.unshift(dateString);
				today.setDate(today.getDate() - v);
			}

			
			//현재일로부터 7일간 일자별 가입회원 수 
			function countNewMember() {
				$
						.ajax({
							url : "${pageContext.request.contextPath}/admin/countNewMember",
							type : "POST",
							data : JSON.stringify({
								weekList : weekList
							}),
							dataType : 'json',
							contentType : 'application/json',
							success : function(result) {
								$.each(result, function(index, item) {
									newJoinMember.push(item);
								});
								drawNewMemberChart();
							},
							error : function(err) {
								alert("error");
							}
						});
			}

			
			//월별 상담/상담신청 건수 데이터 가져오기
			function countCounselByMonth() {
				$.ajax({
					url : "${pageContext.request.contextPath}/admin/countCounselByMonth",
					type : "POST",
					dataType : "json",
					contentType : 'application/json',
					success : function(result) {
						$.each(result.counselCountList, function(index,
								item) {
							countCounselList.push(item);
						});

						$.each(result.counselReqList, function(index,
								item) {
							counselReqList.push(item);
						});

						$.each(result.yearMonthList, function(index,
								item) {
							monthList.push(item);
						});

						drawNewCounselByMonth();

					},
					error : function(err) {
						alert("error");
					}
				})

			}
			
			
			//상담사 순위 데이터 가져오기 + 목록 만들기
			function rankCounselor() {
				$.ajax({
					url : "${pageContext.request.contextPath}/admin/rankCounselor",
					type : "POST",
					dataType : "json",
					success : function(result) {
						var str = "";
						$.each(result.counselorNameList, function (index, item){
							str += "<li class='list-group-item'><div class='widget-content p-0'>" 
							str += "<div class='widget-content-wrapper'>"
							str += "<div class='widget-content-left' style='width:60%'><div class='widget-heading'>";
							str += item + "</div>";
				
							if (result.starList[index] == 0){
								if (result.starCountList[index]  == 0) {
									str += "<div class='mb-3 progress'>";
                            		str +=  "<div class='progress-bar bg-danger' role='progressbar' aria-valuenow='" + result.starList[index] +"' aria-valuemin='0' aria-valuemax='5' style='width: " + result.starList[index] * 20 + "%;'>등록된 별점이 없습니다.</div>";
                            		str += "</div>";
								}else {
									str += "<div class='mb-3 progress'>";
                            		str +=  "<div class='progress-bar bg-danger' role='progressbar' aria-valuenow='" + result.starList[index] +"' aria-valuemin='0' aria-valuemax='5' style='width: " + 100 + "%;'>" + result.starList[index] + "</div>";
                            		str += "</div>";
								}
							} else if (result.starList[index] < 2){
   	                            str += "<div class='mb-3 progress'>";
   	                            str +=  "<div class='progress-bar bg-warning' role='progressbar' aria-valuenow='" + result.starList[index] + " (" + result.starCountList[index] + ")' aria-valuemin='0' aria-valuemax='5' style='width: " + result.starList[index] * 20 + "%;'>" + result.starList[index] + " (" + result.starCountList[index] + ")</div>";
   	                            str += "</div>";
	    					} else if (result.starList[index] < 3){
	                            str += "<div class='mb-3 progress'>";
		                        str +=  "<div class='progress-bar' role='progressbar' aria-valuenow='" + result.starList[index] + " (" + result.starCountList[index] + ")' aria-valuemin='0' aria-valuemax='5' style='width: " + result.starList[index] * 20 + "%;'>" + result.starList[index] + " (" + result.starCountList[index] + ")</div>";
		                        str += "</div>";
		    				} else if (result.starList[index] < 4){
	                            str += "<div class='mb-3 progress'>";
			                    str +=  "<div class='progress-bar bg-info' role='progressbar' aria-valuenow='" + result.starList[index] + " (" + result.starCountList[index] + ")' aria-valuemin='0' aria-valuemax='5' style='width: " + result.starList[index] * 20 + "%;'>" + result.starList[index] +  "(" +  result.starCountList[index] + ")</div>";
			                    str += "</div>";
		    				} else if (result.starList[index] >= 4){
			 	                str += "<div class='mb-3 progress'>";
		                        str +=  "<div class='progress-bar bg-success' role='progressbar' aria-valuenow='" + result.starList[index] + " (" + result.starCountList[index] + ")' aria-valuemin='0' aria-valuemax='5' style='width: " + result.starList[index] * 20 + "%;'>" +  result.starList[index] + "(" + result.starCountList[index] + ")</div>";
		                        str += "</div>";
		    				}
        					str += "</div>";
							str += "<div class='widget-content-right'>";
											
							if(result.gapList[index] < 0){	
								str += "<div class='widget-subheading>" + " - " + result.gapList[index] +"   "+ "</div></div>";
								str += "<div class='font-size-xlg text-muted'>";
								str += "<small class='opacity-5 pr-5'></small> <span>"+ result.sessionList[index] + "</span>";
								str += "<small class='text-danger pl-2'> <i class='fa fa-angle-down fa-2x'></i></small>"
							} else if(result.gapList[index] == 0){
								str += "<div class='widget-subheading'>" + " - " + "</div></div>";
								str += "<div class='font-size-xlg text-muted'>";
								str += "<small class='opacity-5 pr-5'></small> <span>"+ result.sessionList[index] + "</span>";
								str += "<small class='text-warning pl-2'><i class='fa fa-dot-circle'></i></small>"
							} else if(result.gapList[index] > 0){
								str += "<div class='widget-subheading'>" + " + " + result.gapList[index] + "</div></div>";
								str += "<div class='font-size-xlg text-muted'>";
								str += "<small class='opacity-5 pr-5'></small> <span>"+ result.sessionList[index] + "</span>";
								str +="<small class='text-success pl-2'><i class='fa fa-angle-up fa-lg' ></i></small>"
							}
				
							str += "</div></div></div></div></li>"	
						
														
						});
		
						$("#rank-table").after(str);
						
														
					},
					error : function(err) {
						alert("error");
					}
				});
			}

			
			//신규 멤버 일자별 차트 그리기
			function drawNewMemberChart() {
				var newMemeberChart = $("#newMemeberChart");
				var barChart = new Chart(newMemeberChart, {
					type : 'bar',
					data : {
						labels : weekList,
						datasets : [ {
							label : '일별 신규 회원 수',
							data : newJoinMember,
							backgroundColor : [ 'rgba(255, 99, 132, 0.6)',
									'rgba(54, 162, 235, 0.6)',
									'rgba(255, 206, 86, 0.6)',
									'rgba(75, 192, 192, 0.6)',
									'rgba(153, 102, 255, 0.6)',
									'rgba(255, 159, 64, 0.6)',
									'rgba(255, 99, 132, 0.6)' ]
						} ]
					}
				});
			}

			
			// 상담/상담신청 월별 증감 추이 차트 그리기
			function drawNewCounselByMonth() {
				var newCounselByMonth = $("#newCounselByMonth");
				var lineChart = new Chart(newCounselByMonth, {
					type : 'line',
					data : {
						labels : monthList,
						datasets : [ {
							label : '상담신청 건수',
							data : counselReqList,
							borderColor : 'blue',
							fill : false,
							tooltip : true
						}, {
							label : '상담 건수',
							data : countCounselList,
							borderColor : 'red',
							fill : false,
							tooltip : true
						} ]
					},
					options : {
						responsive : true,
						plugins : {
							legend : {
								position : 'top',
							},
							title : {
								display : true,
								text : '월별 상담/상담신청 건수'
							}
						}
					}

				});
			}

			//신규 상담 타입별 증가 추이 차트 그리기
			function drawNewCounselByTypeChart() {
				var newCounselByType = $("#newCounselByType");
				var lineChart = new Chart(newCounselByType, {
					type : 'line',
					data : {
						labels : weekList,
						datasets : [ {
							label : '당일 신규 회원 수',
							data : newJoinMember,
							backgroundColor : [ 'rgba(255, 99, 132, 0.6)',
									'rgba(54, 162, 235, 0.6)',
									'rgba(255, 206, 86, 0.6)',
									'rgba(75, 192, 192, 0.6)',
									'rgba(153, 102, 255, 0.6)',
									'rgba(255, 159, 64, 0.6)',
									'rgba(255, 99, 132, 0.6)' ]
						} ]
					}
				});
			}

			countNewMember();
			countCounselByMonth();
			rankCounselor();

		})//JQuery Ready 끝
	</script>
</body>
</html>