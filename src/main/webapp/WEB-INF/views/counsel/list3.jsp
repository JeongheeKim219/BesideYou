<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<script type="text/javascript" src = "${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		
	})

</script>

<style>
  table {
    width: 100%;
    border-top: 1px solid #ffffff;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #ffffff;
    padding: 10px;
    text-align: center;
    height: 50px;
  }
  thead tr {
    background-color: #3680B3;
    color: #ffffff;
  }
  tbody tr:nth-child(2n) {
    background-color: #F2F2F2;
  }
  tbody tr:nth-child(2n+1) {
    background-color: #E1E1E1;
  }
</style>
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
		<section class="background-primary py-3 d-none d-sm-block">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-auto d-none d-lg-block">
						<span
							class="fa fa-map-marker color-warning fw-800 icon-position-fix"></span>
						<p class="ml-2 mb-0 fs--1 d-inline color-white fw-700">1010
							Avenue, New York, NY 10018 US.</p>
					</div>
					<div class="col-auto ml-md-auto order-md-2 d-none d-sm-block">
						<span class="fa fa-clock-o color-warning fw-800 icon-position-fix"></span>
						<p class="ml-2 mb-0 fs--1 d-inline color-white fw-700">Mon-Sat,
							8.00-18.00. Sunday CLOSED</p>
					</div>
					<div class="col-auto">
						<span class="fa fa-phone color-warning fw-800 icon-position-fix"></span><a
							class="ml-2 mb-0 fs--1 d-inline color-white fw-700"
							href="tel:2123865575">212 386 5575, 212 386 5576</a>
					</div>
				</div>
				<!--/.row-->
			</div>
			<!--/.container-->
		</section>
		<div class="znav-white znav-container sticky-top navbar-elixir"
			id="znav-container">
			<div class="container">
				<nav class="navbar navbar-expand-lg">
					<a class="navbar-brand overflow-hidden pr-3" href="index.html"><img
						src="${pageContext.request.contextPath}/assets/images/BUlogo_nobg2.png"
						alt=""  style="width: 50px; height: 50px"/></a>
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
							<li><a href="JavaScript:void(0)">Home</a>
								<ul class="dropdown fs--1">
									<li><a href="index.html">Slider Header</a></li>
									<li><a href="index--header-slider-classic.html">Slider
											Classic</a></li>
									<li><a href="index--header-static.html">Static Header</a></li>
									<li><a href="index--header-static-classic.html">Static
											Classic</a></li>
									<li><a href="index--header-youtube-video.html">Youtube
											Background </a></li>
									<li><a href="index--header-youtube-video-classic.html">Youtube
											Classic</a></li>
									<li><a href="index--header-selfhosted-video.html">Self-hosted
											Video</a></li>
									<li><a href="index--header-selfhosted-video-classic.html">Self-hosted
											Classic</a></li>
								</ul></li>
							<li><a href="JavaScript:void(0)">Pages</a>
								<ul class="dropdown fs--1">
									<li><a href="services.html">Services</a></li>
									<li><a href="about.html">About</a></li>
									<li><a href="alumni.html">Alumni</a></li>
									<li><a href="blank.html">Blank Page</a></li>
									<li><a href="404.html">404 Page</a></li>
									<li><a href="login.html">Login</a></li>
									<li><a href="registration.html">Registration</a></li>
								</ul></li>
							<li><a href="JavaScript:void(0)">News</a>
								<ul class="dropdown fs--1">
									<li><a href="newsroom.html">Newsroom</a></li>
									<li><a href="news.html">Single News</a></li>
								</ul></li>
							<li><a href="JavaScript:void(0)">Elements</a>
								<ul class="dropdown fs--1">
									<li><a href="components-buttons.html">Buttons</a></li>
									<li><a href="components-colors.html">Colors</a></li>
									<li><a href="components-googlemap.html">Google Map</a></li>
									<li><a href="components-grid.html">Grid</a></li>
									<li><a href="components-icons.html">Icons</a></li>
									<li><a href="components-layouthelpers.html">Layout
											Helpers</a></li>
									<li><a href="components-modal-video.html">Modal Video</a></li>
									<li><a href="components-owlcarousal.html">Owl Carousal</a></li>
									<li><a href="components-slider.html">Slider</a></li>
									<li><a href="components-typography.html">Typography</a></li>
								</ul></li>
							<li><a class="d-block mr-md-9" href="contact.html">Contact</a></li>
						</ul>
						<ul class="navbar-nav ml-lg-auto">
							<li><a
								class="btn btn-outline-primary btn-capsule btn-sm border-2x fw-700"
								href="https://themewagon.com/themes/elixir/" target="_blank">Purchase</a></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		<section class="background-11" style="padding-top : 50px !important">
			<div class="container">
				<div class="row mt-6" style="margin-top: 10px !important">
					<div class="col"></div>
					<div class="col-12">
						<div
							class="background-white px-3 mt-6 px-0 py-5 px-lg-5 radius-secondary" style="margin-top: 20px !important">
							<h3 class="text-center fs-2 fs-md-3">내 상담글</h3>
							<hr class="short"
								data-zanim='{"from":{"opacity":0,"width":0},"to":{"opacity":1,"width":"4.20873rem"},"duration":0.8}'
								data-zanim-trigger="scroll" />
							<br>
							<table>
								<thead>
									<tr>
										<th>상담사</th>
										<th>신청일</th>
										<th>상세보기</th>
										<th>진행 상황</th>
										<th>리뷰작성</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${pageList.content}" var="counsel" varStatus="status">
										<tr>
											<td>${counsel.counselor.member.name}</td>
											<td>${fn:substring(counsel.counselReqDate,0,10)}</td>
											<td><a class="btn btn-outline-primary btn-xs" href="${pageContext.request.contextPath}/requests/read?counselCode=${counsel.counselCode}">상세보기</a></td>
											<c:choose>
												<c:when test="${counsel.counselState==0}">
													<td><button class="btn btn-warning btn-xs" disabled="disabled">답변대기</button></td>
												</c:when>
												<c:when test="${counsel.counselState==3}">
													<td><button class="btn btn-info btn-xs" disabled="disabled">답변완료</button></td>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${counsel.counselState==3}">
													<td>
														<form action="#" method="get">
															<input type="hidden" name="memberCode" value="<sec:authentication property="principal.memberCode" />">
															<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
															<input type="hidden" name="counselorCode" value="${counsel.counselor.counselorCode}">
															<input type="hidden" name="counselCode" value="${counsel.counselCode}">
															<input type="submit" class="btn btn-outline-primary btn-xs" value="리뷰작성">
														</form>
													</td>
												</c:when>
												<c:otherwise>
													<td> </td>
												</c:otherwise>
											</c:choose>
										</tr>		
									</c:forEach>									
								</tbody>
							</table>
							<nav class="font-1 mt-5" aria-label="Page navigation example">
								<ul class="pagination pagination justify-content-center">
									<c:forEach begin="0" end="${pageList.totalPages-1}" var="i">
										<c:choose>
											<c:when test="${pageList.number==i}">
												<li class="page-item active">
													<a class="page-link" href="${pageContext.request.contextPath}/counsel/myCounselList?nowPage=${i}&field=${field}">${i+1}</a>
												</li>
											</c:when>
											<c:otherwise>
												<li class="page-item">
													<a class="page-link" href="${pageContext.request.contextPath}/counsel/myCounselList?nowPage=${i}&field=${field}">${i+1}</a>
												</li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</ul>
							</nav>
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
						<h4 class="color-white mb-0">
							If you have any query related investment... <br class="d-md-none" />we
							are available 24/7
						</h4>
					</div>
					<div class="col-md-auto mt-md-0 mt-4">
						<a class="btn btn-white btn-capsule" href="contact.html">Contact
							Us</a>
					</div>
				</div>
				<!--/.row-->
			</div>
			<!--/.container-->
		</section>
		<section style="background-color: #3D4C6F">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-6">
						<div
							class="background-primary color-white p-5 p-lg-6 radius-secondary">
							<h4 class="color-white fs-1 fs-lg-2 mb-1">Sign up for email
								alerts</h4>
							<p class="color-white">Stay current with our latest insights</p>
							<form class="mt-4">
								<div class="row align-items-center">
									<div class="col-md-7 pr-md-0">
										<div class="input-group">
											<input class="form-control" type="email"
												placeholder="Enter Email Here" />
										</div>
									</div>
									<div class="col-md-5 mt-3 mt-md-0">
										<button class="btn btn-warning btn-block" type="submit">
											<span class="color-primary fw-600">Submit</span>
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="col-lg-6 mt-4 mt-lg-0">
						<div class="row">
							<div class="col-6 col-lg-4 color-white ml-lg-auto">
								<ul class="list-unstyled">
									<li class="mb-3"><a class="color-white" href="#">Contact
											Us</a></li>
									<li class="mb-3"><a class="color-white" href="#">FAQ</a></li>
									<li class="mb-3"><a class="color-white" href="#">Privacy
											Policy</a></li>
									<li class="mb-3"><a class="color-white" href="#">Terms
											of Use</a></li>
									<li class="mb-3"><a class="color-white" href="#">Global
											Office</a></li>
									<li class="mb-3"><a class="color-white" href="#">Local
											Office</a></li>
								</ul>
							</div>
							<div class="col-6 col-sm-5 ml-sm-auto">
								<a href="#">
									<div class="row mb-3 align-items-center no-gutters">
										<div class="col-auto">
											<div
												class="background-primary text-center d-flex align-items-center radius-primary"
												style="height: 40px; width: 40px;">
												<span class="w-100 fa fa-linkedin color-white"></span>
											</div>
										</div>
										<div class="col-6 pl-3">
											<h5 class="fs-0 color-white mb-0 d-inline-block">Linkedin</h5>
										</div>
									</div>
								</a><a href="#">
									<div class="row mb-3 align-items-center no-gutters">
										<div class="col-auto">
											<div
												class="background-primary text-center d-flex align-items-center radius-primary"
												style="height: 40px; width: 40px;">
												<span class="w-100 fa fa-twitter color-white"></span>
											</div>
										</div>
										<div class="col-6 pl-3">
											<h5 class="fs-0 color-white mb-0 d-inline-block">Twitter</h5>
										</div>
									</div>
								</a><a href="#">
									<div class="row mb-3 align-items-center no-gutters">
										<div class="col-auto">
											<div
												class="background-primary text-center d-flex align-items-center radius-primary"
												style="height: 40px; width: 40px;">
												<span class="w-100 fa fa-facebook color-white"></span>
											</div>
										</div>
										<div class="col-6 pl-3">
											<h5 class="fs-0 color-white mb-0 d-inline-block">Facebook</h5>
										</div>
									</div>
								</a><a href="#">
									<div class="row mb-3 align-items-center no-gutters">
										<div class="col-auto">
											<div
												class="background-primary text-center d-flex align-items-center radius-primary"
												style="height: 40px; width: 40px;">
												<span class="w-100 fa fa-google-plus color-white"></span>
											</div>
										</div>
										<div class="col-6 pl-3">
											<h5 class="fs-0 color-white mb-0 d-inline-block">Google+</h5>
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
				<!--/.row-->
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