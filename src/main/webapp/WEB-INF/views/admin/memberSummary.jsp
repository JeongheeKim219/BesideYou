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
					<div class="col-md-6 col-xl-4">
						<div class="card mb-3 widget-content bg-midnight-bloom">
							<div class="widget-content-wrapper text-white">
								<div class="widget-content-left">
									<div class="widget-heading">신규 회원 수</div>
									<div class="widget-subheading">${now}</div>
								</div>
								<div class="widget-content-right">
									<div class="widget-numbers text-white">
										<span>${newMemberCount}</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-xl-4">
						<div class="card mb-3 widget-content bg-arielle-smile">
							<div class="widget-content-wrapper text-white">
								<div class="widget-content-left">
									<div class="widget-heading">Clients</div>
									<div class="widget-subheading">Total Clients Profit</div>
								</div>
								<div class="widget-content-right">
									<div class="widget-numbers text-white">
										<span>$ 568</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-xl-4">
						<div class="card mb-3 widget-content bg-grow-early">
							<div class="widget-content-wrapper text-white">
								<div class="widget-content-left">
									<div class="widget-heading">Followers</div>
									<div class="widget-subheading">People Interested</div>
								</div>
								<div class="widget-content-right">
									<div class="widget-numbers text-white">
										<span>46%</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="d-xl-none d-lg-block col-md-6 col-xl-4">
						<div class="card mb-3 widget-content bg-premium-dark">
							<div class="widget-content-wrapper text-white">
								<div class="widget-content-left">
									<div class="widget-heading">Products Sold</div>
									<div class="widget-subheading">Revenue streams</div>
								</div>
								<div class="widget-content-right">
									<div class="widget-numbers text-warning">
										<span>$14M</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 col-lg-6">
						<div class="mb-3 card">
							<div
								class="card-header-tab card-header-tab-animation card-header">
								<div class="card-header-title">
									<i class="header-icon lnr-apartment icon-gradient bg-love-kiss">
									</i> Sales Report
								</div>
								<ul class="nav">
									<li class="nav-item"><a href="javascript:void(0);"
										class="active nav-link">Last</a></li>
									<li class="nav-item"><a href="javascript:void(0);"
										class="nav-link second-tab-toggle">Current</a></li>
								</ul>
							</div>
							<div class="card-body">
								<div class="tab-content">
									<div class="tab-pane fade show active" id="tabs-eg-77">
										<div
											class="card mb-3 widget-chart widget-chart2 text-left w-100">
											<div class="widget-chat-wrapper-outer">
												<div
													class="widget-chart-wrapper widget-chart-wrapper-lg opacity-10 m-0">
													<canvas id="canvas"></canvas>
												</div>
											</div>
										</div>
										<h6
											class="text-muted text-uppercase font-size-md opacity-5 font-weight-normal">Top
											Authors</h6>
										<div class="scroll-area-sm">
											<div class="scrollbar-container">
												<ul
													class="rm-list-borders rm-list-borders-scroll list-group list-group-flush">
													<li class="list-group-item">
														<div class="widget-content p-0">
															<div class="widget-content-wrapper">
																<div class="widget-content-left mr-3">
																	<img width="42" class="rounded-circle"
																		src="assets/images/avatars/9.jpg" alt="">
																</div>
																<div class="widget-content-left">
																	<div class="widget-heading">Ella-Rose Henry</div>
																	<div class="widget-subheading">Web Developer</div>
																</div>
																<div class="widget-content-right">
																	<div class="font-size-xlg text-muted">
																		<small class="opacity-5 pr-1">$</small> <span>129</span>
																		<small class="text-danger pl-2"> <i
																			class="fa fa-angle-down"></i>
																		</small>
																	</div>
																</div>
															</div>
														</div>
													</li>
													<li class="list-group-item">
														<div class="widget-content p-0">
															<div class="widget-content-wrapper">
																<div class="widget-content-left mr-3">
																	<img width="42" class="rounded-circle"
																		src="assets/images/avatars/5.jpg" alt="">
																</div>
																<div class="widget-content-left">
																	<div class="widget-heading">Ruben Tillman</div>
																	<div class="widget-subheading">UI Designer</div>
																</div>
																<div class="widget-content-right">
																	<div class="font-size-xlg text-muted">
																		<small class="opacity-5 pr-1">$</small> <span>54</span>
																		<small class="text-success pl-2"> <i
																			class="fa fa-angle-up"></i>
																		</small>
																	</div>
																</div>
															</div>
														</div>
													</li>
													<li class="list-group-item">
														<div class="widget-content p-0">
															<div class="widget-content-wrapper">
																<div class="widget-content-left mr-3">
																	<img width="42" class="rounded-circle"
																		src="assets/images/avatars/4.jpg" alt="">
																</div>
																<div class="widget-content-left">
																	<div class="widget-heading">Vinnie Wagstaff</div>
																	<div class="widget-subheading">Java Programmer</div>
																</div>
																<div class="widget-content-right">
																	<div class="font-size-xlg text-muted">
																		<small class="opacity-5 pr-1">$</small> <span>429</span>
																		<small class="text-warning pl-2"> <i
																			class="fa fa-dot-circle"></i>
																		</small>
																	</div>
																</div>
															</div>
														</div>
													</li>
													<li class="list-group-item">
														<div class="widget-content p-0">
															<div class="widget-content-wrapper">
																<div class="widget-content-left mr-3">
																	<img width="42" class="rounded-circle"
																		src="assets/images/avatars/3.jpg" alt="">
																</div>
																<div class="widget-content-left">
																	<div class="widget-heading">Ella-Rose Henry</div>
																	<div class="widget-subheading">Web Developer</div>
																</div>
																<div class="widget-content-right">
																	<div class="font-size-xlg text-muted">
																		<small class="opacity-5 pr-1">$</small> <span>129</span>
																		<small class="text-danger pl-2"> <i
																			class="fa fa-angle-down"></i>
																		</small>
																	</div>
																</div>
															</div>
														</div>
													</li>
													<li class="list-group-item">
														<div class="widget-content p-0">
															<div class="widget-content-wrapper">
																<div class="widget-content-left mr-3">
																	<img width="42" class="rounded-circle"
																		src="assets/images/avatars/2.jpg" alt="">
																</div>
																<div class="widget-content-left">
																	<div class="widget-heading">Ruben Tillman</div>
																	<div class="widget-subheading">UI Designer</div>
																</div>
																<div class="widget-content-right">
																	<div class="font-size-xlg text-muted">
																		<small class="opacity-5 pr-1">$</small> <span>54</span>
																		<small class="text-success pl-2"> <i
																			class="fa fa-angle-up"></i>
																		</small>
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
							</div>
						</div>
					</div>
					<div class="col-md-12 col-lg-6">
						<div class="mb-3 card">
							<div class="card-header-tab card-header">
								<div class="card-header-title">
									<i
										class="header-icon lnr-rocket icon-gradient bg-tempting-azure">
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
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/adminCss/assets/scripts/main.js"></script>
</body>
</html>