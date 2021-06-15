<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	href="${pageContext.request.contextPath}/assets/images/favicons/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/assets/images/favicons/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/assets/images/favicons/favicon-16x16.png">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/images/favicons/favicon.ico">
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
						src="${pageContext.request.contextPath}/assets/images/logo-dark.png"
						alt="" /></a>
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
		<section>
			<div>
				<div class="background-holder overlay"
					style="background-image:url(${pageContext.request.contextPath}/assets/images/background-2.jpg);background-position: center bottom;">
				</div>
				<!--/.background-holder-->
				<div class="container">
					<div class="row pt-6" data-inertia='{"weight":1.5}'>
						<div class="col-md-8 px-md-0 color-white" data-zanim-timeline="{}"
							data-zanim-trigger="scroll">
							<div class="overflow-hidden">
								<h1 class="color-white fs-4 fs-md-5 mb-0 zopacity"
									data-zanim='{"delay":0}'>상담신청</h1>
<!-- 								<div class="nav zopacity" aria-label="breadcrumb" -->
<!-- 									role="navigation" data-zanim='{"delay":0.1}'> -->
<!-- 									<ol class="breadcrumb fs-1 pl-0 fw-700"> -->
<!-- 										<li class="breadcrumb-item"><a class="color-white" -->
<!-- 											href="#">Home</a></li> -->
<!-- 										<li class="breadcrumb-item active" aria-current="page">About</li> -->
<!-- 									</ol> -->
<!-- 								</div> -->
							</div>
						</div>
					</div>
				</div>
				<!--/.row-->
			</div>
			<!--/.container-->
		</section>
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
						class="col-lg-8 px-5 py-6 my-lg-0 background-white radius-tr-lg-secondary radius-br-secondary radius-bl-secondary radius-bl-lg-0">
						<div class="d-flex align-items-center h-100">
							<div data-zanim-timeline="{}" data-zanim-trigger="scroll">
								<h5 data-zanim='{"delay":0}'>선택된 상 담 사 : ${counsel.counselor.counselorCode}</h5>
								<h5 data-zanim='{"delay":0}'>선택한 상담유형 : ${counsel.counselor.counselorCode}</h5>
								<p class="my-4" data-zanim='{"delay":0.1}'>apply Test :
									${counsel.counselor.counselorCode}</p>
								<h5 class="text-uppercase mt-3 fw-500 mb-1"
									data-zanim='{"delay":0.3}'>renal scott</h5>
								<h6 class="color-7 fw-600" data-zanim='{"delay":0.4}'>UK
									office</h6>
							</div>
						</div>
					</div>
				</div>
				<div class="row mt-6">
					<div class="col">
						<h3 class="text-center fs-2 fs-md-3">상담시간 선택</h3>
						<hr class="short"
							data-zanim='{"from":{"opacity":0,"width":0},"to":{"opacity":1,"width":"4.20873rem"},"duration":0.8}'
							data-zanim-trigger="scroll" />
					</div>
					<div class="col-12">
						<div
							class="background-white px-3 mt-6 px-0 py-5 px-lg-5 radius-secondary">
							<h5>Earning the right</h5>
							<p class="mt-3">As a first order business consulting firm, we
								help companies, foundations and individuals make a difference.
								Our work gets to the heart of the matter. We break silos because
								it takes more than any one check or policy or letter to tackle
								big issues like economic security, human rights or climate
								sustainability. We prescribe a custom formula of advocacy,
								collaboration, investment, philanthropy, policy and new ways of
								doing business in order to help you make progress.</p>
							<blockquote class="blockquote my-5 ml-lg-6"
								style="max-width: 700px;">
								<h5 class="fw-500 ml-3 mb-0">But how do we do it? We like
									to call it earning the right, walking the talk and playing the
									game &hellip;</h5>
							</blockquote>
							<p class="column-lg-2 dropcap">Elixir serves to help people
								with creative ideas succeed. Our platform empowers millions of
								people — from individuals and local artists to entrepreneurs
								shaping the world’s most iconic businesses — to share their
								stories and create an impactful, stylish, and easy-to-manage
								online presence. The Cambridge office is the home of the Risk
								management practice. We work to assure the safe performance of
								complex critical systems; develop safety leadership and culture;
								manage safety and risk in high-hazard industries; understand
								complex project risks, measure and report risk performance. We
								work across a wide range of industries and public sector
								organizations that include upstream and downstream oil and gas;
								rail and road transportation; construction; and gas utilities
								and distribution. We work worldwide in Europe, Middle East and
								Asia, Africa and South America based out of our offices in
								Cambridge, UK and Milan, Italy.</p>
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