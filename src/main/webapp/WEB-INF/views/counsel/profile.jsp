<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
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
<link
	href="${pageContext.request.contextPath}/assets/lib/remodal/dist/remodal.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/lib/remodal/dist/remodal-default-theme.css"
	rel="stylesheet">
<!-- Main stylesheet and color file-->
<link href="${pageContext.request.contextPath}/assets/css/style.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/custom.css"
	rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function logout() {
		document.getElementById("logoutForm").submit();
	}
</script>
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
					<a class="navbar-brand overflow-hidden pr-3" href="${pageContext.request.contextPath}/"><img
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
							<li><a href="${pageContext.request.contextPath}/counsel/counselorList">상담사검색</a>
								</li>
							<li><a href="#">테스트/검사</a>
								<ul class="dropdown fs--1">
									<li><a href="${pageContext.request.contextPath}/psy/list">자가진단 테스트</a></li>
									<li><a href="${pageContext.request.contextPath}/psy/art">그림 심리검사</a></li>
								</ul></li>
							<li><a href="#">마이페이지</a>
								<ul class="dropdown fs--1">
									<li><a href="${pageContext.request.contextPath}/member/read">내 정보</a></li>
									<sec:authorize access="!hasRole('ROLE_COUNSELOR')">
										<li><a href="${pageContext.request.contextPath}/counsel/myCounselList?field=-1">내 상담예약</a></li>
										<li><a href="${pageContext.request.contextPath}/counsel/myCounselList?field=3">내 상담글</a></li>
										<li><a href="${pageContext.request.contextPath}/ticket/mylist">상담권 구매내역</a></li>
										<li><a href="#">상담권 사용내역</a></li>
										<li><a href="${pageContext.request.contextPath}/psy/lo/result">테스트 결과</a></li>
										<li><a href="${pageContext.request.contextPath}/psy/lo/answerList">그림 심리검사 결과</a></li>
									</sec:authorize>
								</ul></li>
							<li><a href="#">고객센터</a>
								<ul class="dropdown fs--1">
									<li><a href="${pageContext.request.contextPath}/contact/list">1:1문의</a></li>
									<li><a href="${pageContext.request.contextPath}/faq/list">FAQ</a></li>
									<li><a href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
								</ul></li>
							<li><a href="#">상담사메뉴</a>
								<ul class="dropdown fs--1">
									<sec:authorize access="!hasRole('ROLE_COUNSELOR')">
										<li><a href="${pageContext.request.contextPath}/counselor/CounselorJoin">상담사 신청</a></li>
									</sec:authorize>
									<sec:authorize access="hasRole('ROLE_COUNSELOR')">
										<li><a href="${pageContext.request.contextPath}/counselor/read">상담사 등록 정보</a></li>
										<li><a href="${pageContext.request.contextPath}/psy/lo/signupArt">그림상담사 신청</a></li>
										<li><a href="${pageContext.request.contextPath}/psy/lo/cancle">그림상담사 해지</a></li>
										<li><a href="${pageContext.request.contextPath}/psy/lo/requestList">그림검사 요청목록</a></li>
										<li><a href="${pageContext.request.contextPath}/counsel/listForCounselor?field=-1">상담예약 요청목록</a></li>
										<li><a href="${pageContext.request.contextPath}/counsel/listForCounselor?field=3">상담글 요청목록</a></li>
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
										<sec:authentication property="principal.name"/>님 
										<sec:authorize access="hasRole('ROLE_COUNSELOR')">
											(상담사)
										</sec:authorize>
										</h6>
										<!-- Authentication의 getPrincipal().getName() -> Principal은 Provider에서 Authentication 에 넣어준 VO(생성자 첫 매개변수) -->
								</li>
								<li style="vertical-align: middle;"><a href="javascript:logout();" style="color: #2A3855;padding-top: 0 !important;padding-bottom: 0 !important">logout</a></li>
								
								
								<form id="logoutForm" action="${pageContext.request.contextPath}/member/logout" method="post" style="display: none">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								</form>
							</sec:authorize>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		<section class="background-11" style="padding-bottom: 10px !important">
			<div class="container">
				<div class="row text-center">
					<div class="col">
						<h3 class="fs-2 fs-md-3 fw-600">상담사 정보</h3>
						<hr class="short"
							data-zanim='{"from":{"opacity":0,"width":0},"to":{"opacity":1,"width":"4.20873rem"},"duration":0.8}'
							data-zanim-trigger="scroll">
					</div>
				</div>
				<div class="row no-gutters pos-relative mt-6">
					<div class="elixir-caret d-none d-lg-block"></div>
					<div class="col-lg-6 py-3 py-lg-0 mb-0" style="min-height: 400px;">
						<div
							class="background-holder radius-tl-secondary radius-tr-secondary radius-tr-lg-0"
							style="background-image:url(${pageContext.request.contextPath}/assets/images/ceo.jpg);">
						</div>
						<!--/.background-holder-->
					</div>
					<div
						class="col-lg-6 px-lg-5 py-lg-6 p-4 my-lg-0 background-white radius-bl-secondary radius-bl-lg-0 radius-br-secondary radius-br-lg-0 radius-tr-lg-secondary">
						<div class="d-flex align-items-center h-100">
								<table style="width: 100%">
									<tr>
										<td style="width: 200px">
											<h5 data-zanim='{"delay":0}'>상담사 이름</h5>
										</td>
										<td>
											<h5 data-zanim='{"delay":0}' style="color: #3680B3">${counselor.member.name}</h5>
										</td>
									</tr>
									<tr>
										<td colspan="2" style="height: 20px"></td>
									</tr>
									<tr>
										<td>
											<h5 data-zanim='{"delay":0}'>상담사 학위</h5>
										</td>
										<td>
											<h5 data-zanim='{"delay":0}' style="color: #3680B3">${counselor.degree}</h5>
										</td>
									</tr>
									<tr>
										<td colspan="2" style="height: 20px"></td>
									</tr>
									<tr>
										<td colspan="2">
											<h5 data-zanim='{"delay":0}'>상담사 전문분야</h5>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<h5 data-zanim='{"delay":0}' style="color: #3680B3">
												<c:forEach	items="${speList}" var="spe" >
													${spe.specialityName}
												</c:forEach>
											</h5>
										</td>
									</tr>
									<tr>
										<td colspan="2" style="height: 20px"></td>
									</tr>
									<tr>
										<td colspan="2">
											<h5 data-zanim='{"delay":0}'>상담사 태그</h5>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<h5 data-zanim='{"delay":0}' style="color: #3680B3">
												<c:forEach	items="${tagList}" var="tag" >
													${tag.tagName}
												</c:forEach>
											</h5>
										</td>
									</tr>
									<tr>
										<td colspan="2" style="height: 20px"></td>
									</tr>
									<tr>
										<td colspan="2">
											<h5 data-zanim='{"delay":0}'>상담사 경력</h5>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<h5 data-zanim='{"delay":0}' style="color: #3680B3">
												${counselor.career}
											</h5>
										</td>
									</tr>
								</table>
						</div>
					</div>
				</div>
				<div class="row no-gutters pos-relative mt-4 mt-lg-0">
					<div class="elixir-caret d-none d-lg-block"></div>
					<div class="col-lg-6 py-3 py-lg-0 mb-0 order-lg-2"
						style="min-height: 400px;">
						<div id="map" style="width: 100%; height: 400px;"></div>
						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ee2a08e1e6666ba0c1489f7bcaf6d75a"></script>
						<script type="text/javascript">
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							mapOption = {
								center : new kakao.maps.LatLng(${counselor.latitude},
										${counselor.longitude}), // 지도의 중심좌표
								level : 3
							// 지도의 확대 레벨
							};

							var map = new kakao.maps.Map(mapContainer,
									mapOption); // 지도를 생성합니다

							//마커가 표시될 위치입니다 
							var markerPosition = new kakao.maps.LatLng(
									${counselor.latitude}, ${counselor.longitude});

							//마커를 생성합니다
							var marker = new kakao.maps.Marker({
								position : markerPosition
							});

							//마커가 지도 위에 표시되도록 설정합니다
							marker.setMap(map);
						</script>
						<!--/.background-holder-->
					</div>
					<div
						class="col-lg-6 px-lg-5 py-lg-6 p-4 my-lg-0 background-white radius-bl-secondary radius-bl-lg-0 radius-br-secondary radius-br-lg-0">
						<div class="d-flex align-items-center h-100">
								<table style="width: 100%">
									<tr>
										<td colspan="2">
											<h5 data-zanim='{"delay":0}'>상담센터 주소</h5>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<h5 data-zanim='{"delay":0}' style="color: #3680B3">
												${counselor.counselorAddr}
											</h5>
										</td>
									</tr>
									<tr>
										<td colspan="2" style="height: 20px"></td>
									</tr>
									<tr>
										<td>
											<a href="${pageContext.request.contextPath}/counsel/apply?counselorCode=${counselor.counselorCode}&counselCategory=0" class="btn btn-outline-primary btn-capsule" style="width: 180px">대면상담 신청</a>				
										</td>
										<td>
											<a href="${pageContext.request.contextPath}/counsel/apply?counselorCode=${counselor.counselorCode}&counselCategory=1" class="btn btn-outline-primary btn-capsule" style="width: 180px">전화상담 신청</a>				
										</td>
									</tr>
									<tr>
										<td colspan="2" style="height: 20px"></td>
									</tr>
									<tr>
										<td>
											<a href="${pageContext.request.contextPath}/counsel/apply?counselorCode=${counselor.counselorCode}&counselCategory=2" class="btn btn-outline-primary btn-capsule" style="width: 180px">채팅상담 신청</a>				
										</td>
										<td>
											<a href="${pageContext.request.contextPath}/counsel/apply?counselorCode=${counselor.counselorCode}&counselCategory=3" class="btn btn-outline-primary btn-capsule" style="width: 180px">텍스트상담 신청</a>				
										</td>
									</tr>
								</table>
						</div>
					</div>
				</div>
				<!--/.row-->
			</div>
			<!--/.container-->
		</section>
		
		<section class="background-11" style="padding-top: 10px !important">
			<div class="container">
				<div class="row mt-6" style="margin-top: 10px !important">
					<div class="col"></div>
					<div class="col-12">
						<div
							class="background-white px-3 mt-6 px-0 py-5 px-lg-5 radius-secondary"
							style="margin-top: 20px !important">
							<h3 class="text-center fs-2 fs-md-3">상담사 리뷰</h3>
							<hr class="short"
								data-zanim='{"from":{"opacity":0,"width":0},"to":{"opacity":1,"width":"4.20873rem"},"duration":0.8}'
								data-zanim-trigger="scroll" />
						</div>
					</div>
				</div>
				<!--/.row-->
			</div>
			<!--/.container-->
		</section>
		
		<section class=" background-primary py-6">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-md">
						<h3 class="color-white mb-0">
							슬프고 우울한 날에도 당신의 곁에 Beside-U
						</h3>
					</div>
				</div>
				<!--/.row-->
				<br>
				<div>
					<h6 style="color: #949494">상호명:(주)BU | 대표:박기현</h6>
					<h6 style="color: #949494">사업장소재지:(13637) 경기도 성남시 분당구 성남대로 34 6층(구미동 하나프라자빌딩)</h6>
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
	<script
		src="${pageContext.request.contextPath}/assets/lib/remodal/dist/remodal.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/core.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>