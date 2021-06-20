<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix="sec"%>
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
		$("#sub").click(function () {
			if($("#date").val()==''){
				alert("상담 희망일을 선택하세요");
				return;
			}
			var d = $("#date").val();
			if(confirm(d+" 예약이 맞나요?")){
				if($("input[name = 'remainTicket'").val() <= 0){
					alert("보유중인 상담권이 없어 결제창으로 이동합니다.");
					$("#submitForm").attr("action", "${pageContext.request.contextPath}/ticket/ticketApp")
				}
				$("#submitForm").submit();
			}
		})
	})

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
		<section class="background-11">
			<div class="container">
				<div class="row no-gutters">
					<div class="col-lg-4 py-3 py-lg-0"
						style="min-height: 400px; background-position: top">
						<div
							class="background-holder radius-tl-secondary radius-bl-lg-secondary radius-tr-secondary radius-tr-lg-0"
							style="background-image:url(${pageContext.request.contextPath}/assets/images/ceo.jpg);">
						</div>
						<!--/.background-holder-->
					</div>
					<div
						class="col-lg-8 px-5 py-6 my-lg-0 background-white radius-tr-lg-secondary radius-br-secondary radius-bl-secondary radius-bl-lg-0"
						style="vertical-align: top;padding-top: 20px !important">
						<div data-zanim-timeline="{}" data-zanim-trigger="scroll"
							style="width: 100%; height: 100%;word-break:break-all">
							<h3 class="text-center fs-2 fs-md-3">상담사 정보</h3>
							<hr class="short"
								data-zanim='{"from":{"opacity":0,"width":0},"to":{"opacity":1,"width":"4.20873rem"},"duration":0.8}'
								data-zanim-trigger="scroll" />
							<br>
							
							
							<table style="width: 100%">
								<tr>
									<td style="width: 180px">
										<h5 data-zanim='{"delay":0}'>선택한 상담사</h5>
									</td>
									<td>
										<h5 data-zanim='{"delay":0}'>${counselor.member.name}</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5 data-zanim='{"delay":0}'>선택한 상담유형</h5>
									</td>
									<td>
										<h5 data-zanim='{"delay":0}'>
											<c:choose>
												<c:when test="${counselField==0 }">
													대면상담
												</c:when>
												<c:when test="${counselField==1 }">
													전화상담
												</c:when>
												<c:when test="${counselField==2 }">
													채팅상담
												</c:when>
											</c:choose>
										</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5 data-zanim='{"delay":0}'>상담사 학위</h5>
									</td>
									<td>
										<h5 data-zanim='{"delay":0}'>${counselor.degree}</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5 data-zanim='{"delay":0}'>상담센터 주소</h5>
									</td>
									<td>
										<h5 data-zanim='{"delay":0}'>${counselor.counselorAddr}</h5>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="height: 20px">
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<h5 data-zanim='{"delay":0}'>상담사 경력</h5>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<h5 data-zanim='{"delay":0}'>${counselor.career}</h5>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="height: 20px">
									</td>
								</tr>
								<tr>
									<td>
										<h5 data-zanim='{"delay":0}' >보유중인 상담권</h5>
									</td>
									<td>
										<h5 data-zanim='{"delay":0}' style="color: red">${remainTicket} 매</h5>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="row mt-6" style="margin-top: 10px !important">
					<div class="col"></div>
					<div class="col-12">
						<div
							class="background-white px-3 mt-6 px-0 py-5 px-lg-5 radius-secondary" style="margin-top: 20px !important">
							<h3 class="text-center fs-2 fs-md-3">상담일자 선택</h3>
							<hr class="short"
								data-zanim='{"from":{"opacity":0,"width":0},"to":{"opacity":1,"width":"4.20873rem"},"duration":0.8}'
								data-zanim-trigger="scroll" />
							<form action="${pageContext.request.contextPath}/counsel/submit012" method="post" id="submitForm">
								<input type="hidden" name="counselorCode" value="${counselor.counselorCode}"/>
								<input type="hidden" name="counselCategory" value="${counselField}"/>
								<input type="hidden" name="remainTicket" value="${remainTicket}"/>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
								<table style="width: 100%; vertical-align: middle;">
									<tr style="height: 150px;">
										<td>
											<h5>상담 희망일</h5>
										</td>
										<td><input type="date" name="counselDate" min="${tomorrow}" id="date" ></td>
										<td>
											<h5>상담 희망시간</h5>
										</td>
										<td><select name="counselTime">
												<option value="10:00:00">10:00 ~ 10:50</option>
												<option value="11:00:00">11:00 ~ 11:50</option>
												<option value="12:00:00">12:00 ~ 12:50</option>
												<option value="14:00:00">14:00 ~ 14:50</option>
												<option value="15:00:00">15:00 ~ 15:50</option>
												<option value="16:00:00">16:00 ~ 16:50</option>
										</select></td>
									</tr>
									<tr>
										<td colspan="4" style="text-align: right;">
											<input id="sub" type="button" class="btn btn-success" value="상담 신청"/>
										</td>
									</tr>
								</table>
							</form>
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