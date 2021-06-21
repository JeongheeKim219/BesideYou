<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--  -->
<!--    Document Title-->
<!-- =============================================-->
<title>BU - Beside U</title>
<!--  -->
<!--    Favicons-->
<!--    =============================================-->
<link rel="apple-touch-icon" sizes="180x180"
	href="${pageContext.request.contextPath}/assets/images/BUlogo_nobg2.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/assets/images/BUlogo_nobg2.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/assets/images/BUlogo_nobg2.png">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/images/BUlogo_nobg2.png">
<link rel="manifest"
	href="${pageContext.request.contextPath}/assets/images/favicons/manifest.json">
<link rel="mask-icon"
	href="${pageContext.request.contextPath}/assets/images/favicons/safari-pinned-tab.svg"
	color="#5bbad5">
<meta name="msapplication-TileImage"
	content="${pageContext.request.contextPath}/assets/images/favicons/mstile-150x150.png">
<meta name="theme-color" content="#ffffff">
<!--  -->
<!--    Stylesheets-->
<!--    =============================================-->
<!-- Default stylesheets-->
<link
	href="${pageContext.request.contextPath}/assets/lib/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Template specific stylesheets-->
<link
	href="${pageContext.request.contextPath}/assets/lib/loaders.css/loaders.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700|Open+Sans:300,400,600,700,800"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/lib/iconsmind/iconsmind.css"
	rel="stylesheet">
<link
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/lib/hamburgers/dist/hamburgers.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/lib/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Main stylesheet and color file-->
<link href="${pageContext.request.contextPath}/assets/css/style.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/custom.css"
	rel="stylesheet">
</head>
<body data-spy="scroll" data-target=".inner-link" data-offset="60">
	<main>
		<div class="loading" id="preloader">
			<div
				class="loader h-100 d-flex align-items-center justify-content-center">
				<div class="line-scale">
					<div></div>
					<div></div>
					<div></div>
					<div></div>
					<div></div>
				</div>
			</div>
		</div>
		<div class="znav-white znav-container sticky-top navbar-elixir"
			id="znav-container">
			<div class="container">
				<nav class="navbar navbar-expand-lg">
					<a class="navbar-brand overflow-hidden pr-3"
						href="${pageContext.request.contextPath}/"><img
						src="${pageContext.request.contextPath}/assets/images/BUlogo_nobg2.png"
						alt="" style="width: 50px; height: 50px" /></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
						aria-expanded="false" aria-label="Toggle navigation">
						<div class="hamburger hamburger--emphatic">
							<div class="hamburger-box">
								<div class="hamburger-inner"></div>
							</div>
						</div>
					</button>
					<div class="collapse navbar-collapse" id="navbarNavDropdown">
						<ul class="navbar-nav fs-0 fw-700">
							<li><a
								href="${pageContext.request.contextPath}/counsel/counselorList">상담사검색</a>
							</li>
							<li><a href="#">테스트/검사</a>
								<ul class="dropdown fs--1">
									<li><a href="${pageContext.request.contextPath}/psy/list">자가진단
											테스트</a></li>
									<li><a href="${pageContext.request.contextPath}/psy/art">그림
											심리검사</a></li>
								</ul></li>
							<li><a href="#">마이페이지</a>
								<ul class="dropdown fs--1">
									<li><a
										href="${pageContext.request.contextPath}/member/read">내 정보</a></li>
									<sec:authorize access="!hasRole('ROLE_COUNSELOR')">
										<li><a
											href="${pageContext.request.contextPath}/counsel/myCounselList?field=-1">내
												상담예약</a></li>
										<li><a
											href="${pageContext.request.contextPath}/counsel/myCounselList?field=3">내
												상담글</a></li>
										<li><a
											href="${pageContext.request.contextPath}/ticket/mylist">상담권
												구매내역</a></li>
										<li><a
											href="${pageContext.request.contextPath}/psy/lo/result">테스트
												결과</a></li>
										<li><a
											href="${pageContext.request.contextPath}/psy/lo/answerList">그림
												심리검사 결과</a></li>
									</sec:authorize>
								</ul></li>
							<li><a href="#">고객센터</a>
								<ul class="dropdown fs--1">
									<li><a
										href="${pageContext.request.contextPath}/contact/list">1:1문의</a></li>
									<li><a href="${pageContext.request.contextPath}/faq/list">FAQ</a></li>
									<li><a
										href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
								</ul></li>
							<li><a href="#">상담사메뉴</a>
								<ul class="dropdown fs--1">
									<sec:authorize access="!hasRole('ROLE_COUNSELOR')">
										<li><a
											href="${pageContext.request.contextPath}/counselor/CounselorJoin">상담사
												신청</a></li>
									</sec:authorize>
									<sec:authorize access="hasRole('ROLE_COUNSELOR')">
										<li><a
											href="${pageContext.request.contextPath}/counselor/read">상담사
												등록 정보</a></li>
										<li><a
											href="${pageContext.request.contextPath}/psy/lo/signupArt">그림상담사
												신청</a></li>
										<li><a
											href="${pageContext.request.contextPath}/psy/lo/cancle">그림상담사
												해지</a></li>
										<li><a
											href="${pageContext.request.contextPath}/psy/lo/requestList">그림검사
												요청목록</a></li>
										<li><a
											href="${pageContext.request.contextPath}/counsel/listForCounselor?field=-1">상담예약
												요청목록</a></li>
										<li><a
											href="${pageContext.request.contextPath}/counsel/listForCounselor?field=3">상담글
												요청목록</a></li>
									</sec:authorize>
								</ul></li>
						</ul>
						<ul class="navbar-nav ml-lg-auto">
							<sec:authorize access="isAnonymous()">
								<!-- 또는 !isAuthenticated() 로 비교해도 된다.  로그인을 하지 않은 사용자-->
								<li><a
									href="${pageContext.request.contextPath}/member/login">Login</a></li>
								<li><a
									href="${pageContext.request.contextPath}/member/joinForm">Join</a></li>
							</sec:authorize>

							<sec:authorize access="isAuthenticated()">
								<li style="vertical-align: middle;">
									<h6 style="margin-bottom: 0 !important; color: #2A3855">
										<sec:authentication property="principal.name" />
										님
										<sec:authorize access="hasRole('ROLE_COUNSELOR')">
                                 (상담사)
                              </sec:authorize>
									</h6> <!-- Authentication의 getPrincipal().getName() -> Principal은 Provider에서 Authentication 에 넣어준 VO(생성자 첫 매개변수) -->
								</li>
								<li style="vertical-align: middle;"><a
									href="javascript:logout();"
									style="color: #2A3855; padding-top: 0 !important; padding-bottom: 0 !important">logout</a></li>


								<form id="logoutForm"
									action="${pageContext.request.contextPath}/member/logout"
									method="post" style="display: none">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</form>
							</sec:authorize>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		<!-- <section>
                <div>
                    <div class="background-holder overlay" style="background-image:url(assets/images/background-2.jpg);background-position: center bottom;">
                    </div>
                    /.background-holder
                    <div class="container">
                        <div class="row pt-6" data-inertia='{"weight":1.5}'>
                            <div class="col-md-8 px-md-0 color-white" data-zanim-timeline="{}" data-zanim-trigger="scroll">
                                <div class="overflow-hidden">
                                    <h1 class="color-white fs-4 fs-md-5 mb-0 zopacity" data-zanim='{"delay":0}'>Counseling Tickets</h1>
                                    <div class="nav zopacity" aria-label="breadcrumb" role="navigation" data-zanim='{"delay":0.1}'>
                                        <ol class="breadcrumb fs-1 pl-0 fw-700">
                                            <li class="breadcrumb-item"><a class="color-white" href="#">Home</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">MyPage</li>
                                            <li class="breadcrumb-item active" aria-current="page">Tickets</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    /.row
                </div>
                /.container
            </section> -->
		<section class="background-11">
			<div class="container">
				<div class="row">
					<c:choose>
						<c:when test="${empty requestScope.tkList.content}">
							<div>
								<p align="center">
									<b><span style="font-size: 15pt;">상담권 구매 내역이 없습니다.</span></b>
								</p>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${requestScope.tkList.content}" var="ticket">
								<!-- tkList.getContent() : List<Ticket>를 리턴 -->
								<div class="col-md-6 col-lg-4 py-0 mt-4">
									<div class="background-white pb-4 h-100 radius-secondary">
										<img class="w-100 radius-tr-secondary radius-tl-secondary"
											src="${pageContext.request.contextPath}/assets/images/9.jpg"
											alt="${ticket.counselor.picture}" />
										<div class="px-4 pt-4" data-zanim-timeline="{}"
											data-zanim-trigger="scroll">
											<div class="overflow-hidden">
												<a
													href="${pageContext.request.contextPath}/ticket/read/${ticket.ticketCode}">
													<c:choose>
														<c:when test="${ticket.ticketField==0}">
															<h4 data-zanim='{"delay":0}'>대면 상담권</h4>
														</c:when>
														<c:when test="${ticket.ticketField==1}">
															<h4 data-zanim='{"delay":0}'>전화 상담권</h4>
														</c:when>
														<c:when test="${ticket.ticketField==2}">
															<h4 data-zanim='{"delay":0}'>채팅 상담권</h4>
														</c:when>
														<c:when test="${ticket.ticketField==3}">
															<h4 data-zanim='{"delay":0}'>간편 텍스트 상담권</h4>
														</c:when>
													</c:choose>
												</a>
											</div>
											<div class="overflow-hidden">
												<p class="color-7" data-zanim='{"delay":0.1}'>
													<span style="font-size: 15pt; font-weight: bold;">${ticket.counselor.member.alias}</span>
													상담사
												</p>
											</div>
											<div class="overflow-hidden">
												<p class="color-7" data-zanim='{"delay":0.2}'>Remain :
													${ticket.ticketRemain}</p>
											</div>
											<%-- <div class="overflow-hidden">
                                    	<c:choose>
                                    		<c:when test="${ticket.ticketRemain>0}">
                                    			<div class="d-inline-block" data-zanim='{"delay":0.3}'>
                                    				<a class="btn btn-outline-primary btn-xs mr-3 mb-3" 
                                    				href="${pageContext.request.contextPath}/ticket/use/${ticket.ticketCode}">사용하기 </a>
                                				</div>
                                    			<div class="d-inline-block" data-zanim='{"delay":0.3}' align="right">
                                    				<a class="btn btn-outline-primary btn-xs mr-3 mb-3" 
                                    				href="${pageContext.request.contextPath}/refund/refundApp/${ticket.ticketCode}" style="color:red">환불신청 </a>
                                    			</div>
                                    		</c:when>
                                    		<c:when test="${ticket.ticketRemain<=0}">
                                    			<div class="d-inline-block" data-zanim='{"delay":0.3}'>
	                                    			<a class="btn btn-outline-primary btn-xs mr-3 mb-3" 
	                                    			href="${pageContext.request.contextPath}/ticket/delete/${ticket.ticketCode}">삭제하기 </a>
                                    			</div>
                                    		</c:when>
                                    	</c:choose>
                                    </div> --%>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
				<c:if test="${not empty requestScope.tkList.content}">
					<!-- 페이징 처리 -->
					<div class="col-auto mx-auto mt-4">
						<nav class="font-1 mt-5" aria-label="Page navigation example">
							<ul class="pagination pagination justify-content-center">
								<c:choose>
									<c:when test="${requestScope.tkList.hasPrevious()==true}">
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/ticket/mylist?nowPage=${previous}"
											aria-label="Previous"><span aria-hidden="true">«</span></a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"><span
												aria-hidden="true">«</span></a></li>
									</c:otherwise>
								</c:choose>
								<c:forEach begin="0" end="${tkList.totalPages-1}" var="i">
									<!-- pageList.getTotalPages() : 페이지 수 만큼 반복문 돌기(0부터 시작하기 때문에 -1 해준다.) -->
									<li class="page-item"><c:choose>
											<c:when test="${tkList.number==i}">
												<!-- tkList.getNumber() 호출 : 현재 페이지 번호 -->
												<a class="page-link"
													href="${pageContext.request.contextPath}/ticket/mylist?nowPage=${i}"
													style="color: red">${i+1}</a>
												<!-- 현재 페이지만 빨간색으로 표시 -->
											</c:when>
											<c:otherwise>
												<a class="page-link"
													href="${pageContext.request.contextPath}/ticket/mylist?nowPage=${i}">${i+1}</a>
											</c:otherwise>
										</c:choose></li>
								</c:forEach>
								<c:choose>
									<c:when test="${requestScope.tkList.hasNext()==true}">
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/ticket/mylist?nowPage=${next}"
											aria-label="Next"><span aria-hidden="true">»</span></a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"><span
												aria-hidden="true">»</span></a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</nav>
					</div>
				</c:if>
				<!--/.row-->
			</div>
			<!--/.container-->
		</section>
		<section class=" background-primary py-6">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-md">
						<h3 class="color-white mb-0">슬프고 우울한 날에도 당신의 곁에 Beside-U</h3>
					</div>
				</div>
				<!--/.row-->
				<br>
				<div>
					<h6 style="color: #949494">상호명:(주)BU | 대표:박기현</h6>
					<h6 style="color: #949494">사업장소재지:(13637) 경기도 성남시 분당구 성남대로 34
						6층(구미동 하나프라자빌딩)</h6>
					<h6 style="color: #949494">사업자등록번호:199-4082-3</h6>
					<h6 style="color: #949494">대표메일:mooyaho@kosta.com</h6>
					<h6 style="color: #949494">© BU All rights reserved.</h6>
				</div>
			</div>
			<!--/.container-->
		</section>
	</main>
	<!--  -->
	<!--    JavaScripts-->
	<!--    =============================================-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/lib/jquery/dist/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/lib/imagesloaded/imagesloaded.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/lib/gsap/src/minified/TweenMax.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/lib/gsap/src/minified/plugins/ScrollToPlugin.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/lib/CustomEase.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/config.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/zanimation.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/inertia.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/core.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>