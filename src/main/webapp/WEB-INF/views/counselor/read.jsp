<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script>
	function logout() {
		document.getElementById("logoutForm").submit();
	}
	function update() {
		var pass = prompt("비밀번호 입력하세요.", "password");
		if (!pass) {
			alert("수정하시려면 비밀번호는 필수 입니다.");
			return;
		}
		document.getElementById("updateForm").password.value = pass;

		document.getElementById("updateForm").submit();
	}
	function memberDelete() {
		alert("삭제하시면 모든 정보가 삭제 됩니다. 삭제하시겠습니까?")
		var pass1 = prompt("비밀번호 입력하세요.", "password");
		if (!pass1) {
			alert("삭제하시려면 비밀번호는 필수 입니다.");
			return;
		}
		document.getElementById("deleteForm").password.value = pass1;

		document.getElementById("deleteForm").submit();
	}
	
	
</script>

<!--  -->
<!--    Document Title-->
<!-- =============================================-->
<title>Elixir | Beautiful Site Template for Agencies &amp;
	Professionals</title>
<!--  -->
<!--    Favicons-->
<!--    =============================================-->
<link rel="apple-touch-icon" sizes="180x180"
	href="/assets/images/favicons/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="/assets/images/favicons/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="/assets/images/favicons/favicon-16x16.png">
<link rel="shortcut icon" type="image/x-icon"
	href="/assets/images/favicons/favicon.ico">
<link rel="manifest" href="/assets/images/favicons/manifest.json">
<link rel="mask-icon"
	href="/assets/images/favicons/safari-pinned-tab.svg" color="#5bbad5">
<meta name="msapplication-TileImage"
	content="/assets/images/favicons/mstile-150x150.png">
<meta name="theme-color" content="#ffffff">
<!--  -->
<!--    Stylesheets-->
<!--    =============================================-->
<!-- Default stylesheets-->
<link href="/assets/lib/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Template specific stylesheets-->
<link href="/assets/lib/loaders.css/loaders.min.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700|Open+Sans:300,400,600,700,800"
	rel="stylesheet">
<link href="/assets/lib/iconsmind/iconsmind.css" rel="stylesheet">
<link
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet">
<link href="/assets/lib/hamburgers/dist/hamburgers.min.css"
	rel="stylesheet">
<link href="/assets/lib/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Main stylesheet and color file-->
<link href="/assets/css/style.css" rel="stylesheet">
<link href="/assets/css/custom.css" rel="stylesheet">
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
					<a class="navbar-brand overflow-hidden pr-3"
						href="${pageContext.request.contextPath}/"><img
						src="/assets/images/logo-dark.png" alt="" /></a>
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
							<!-- 인증 안됐으면 -->
							<sec:authorize access="isAnonymous()">
								<!-- 또는 !isAuthenticated() 로 비교해도 된다.  로그인을 하지 않은 사용자-->


							</sec:authorize>

							<!-- 인증 됐으면 -->
							<sec:authorize access="isAuthenticated()">

								<!-- 일반회원인 경우 -->
								<sec:authorize access="hasRole('ROLE_MEMBER') and !hasRole('ROLE_ADMIN') and !hasRole('ROLE_COUNSELOR')">
									 <li>
									<p>
										<sec:authentication property="principal.name" />
										님 환영합니다.
										<!-- Authentication의 getPrincipal().getName() -> Principal은 Provider에서 Authentication 에 넣어준 VO(생성자 첫 매개변수) -->
								</li>
								<li><a href="javascript:logout();">로그아웃</a></li> 
								</sec:authorize>
								
								<!-- 관리자인 경우 -->
								 <sec:authorize access="hasRole('ROLE_ADMIN')">
									 <li>
									<p>
										<sec:authentication property="principal.name" />
										님 환영합니다.
										<!-- Authentication의 getPrincipal().getName() -> Principal은 Provider에서 Authentication 에 넣어준 VO(생성자 첫 매개변수) -->
								</li>
								<li><a href="admin/index">관리자페이지</a>
								<li><a href="javascript:logout();">로그아웃</a></li> 
								</sec:authorize>  
								
								<!--  상담사인 경우 -->
								<sec:authorize access="hasRole('ROLE_COUNSELOR')">
								  <sec:authentication property="principal.name" />상담사님 안녕하세요.
								   <li><a href="javascript:logout();">로그아웃</a></li> 
								</sec:authorize>
								
								
								<form id="logoutForm"
									action="${pageContext.request.contextPath}/member/logout"
									method="post" style="display: none">
									<input type="text" name="memberCode"
										value="<sec:authentication property="principal.memberCode" />" />
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</form>

							</sec:authorize>
						</ul>
					</div>
				</nav>
			</div>

		</div>

		<section class=" background-11 py-0 text-center">

			<div class="container">
				<br> <br> <br> <br>
				<div class="row h-full align-items-center">
					<div class="col-12 px-0">

						<table align="center" cellpadding="18" cellspacing="8" width="600">
							<h2>상담사 가입된 정보</h2>

							<tr>
								<td width="100" height="20">
									<p align="right">
										<b><span style="font-size: 9pt;">번호</span></b>
									</p>
								</td>
								<td width="450" height="20" colspan="3"><span
									style="font-size: 9pt;"><b>${counselor.counselorCode}</b></span></td>
							</tr>
							<tr>
								<td width="100" height="20">
									<p align="right">
										<b><span style="font-size: 9pt;">경력</span></b>
									</p>
								</td>
								<td width="450" height="20" colspan="3"><span
									style="font-size: 9pt;"><b>${requestScope.counselor.career}</b></span>
								</td>
							</tr>
							<tr>
								<td width="100" height="20">
									<p align="right">
										<b><span style="font-size: 9pt;">학위</span></b>
									</p>
								</td>
								<td width="450" height="20" colspan="3"><span
									style="font-size: 9pt;"><b>${requestScope.counselor.degree}</b></span>
								</td>
							</tr>
							<tr>
								<td width="150" height="20">
									<p align="right">
										<b><span style="font-size: 9pt;">상담센터 위치</span></b>
									</p>
								</td>
								<td width="450" height="20" colspan="3"><span
									style="font-size: 9pt;"><b>${requestScope.counselor.counselorAddr}</b></span>
								</td>
							</tr>
							<tr>
								<td width="100" height="20">
									<p align="right">
										<b><span style="font-size: 9pt;">자격증</span></b>
									</p>
								</td>
								<td width="450" height="20" colspan="3"><span
									style="font-size: 9pt;"><b>${requestScope.counselor.cerificate}</b></span>
								</td>
							</tr>
							<tr>
								<td width="100" height="20">
									<p align="right">
										<b><span style="font-size: 9pt;">프로필 사진</span></b>
									</p>
								</td>
								<td width="450" height="20" colspan="3"><span
									style="font-size: 9pt;"><b>${requestScope.counselor.picture}</b></span>
								</td>
							</tr>
							 <tr>
								<td width="100" height="20">
									<p align="right">
										<b><span style="font-size: 9pt;">전문분야</span></b>
									</p>
								</td>
								 <td width="450" height="20" colspan="3">
								 <span
									style="font-size: 9pt;">
									<c:forEach items="${speciality}" var= "s" >
									<b>${s.specialityName},</b>
								</c:forEach>
								</span>
								</td> 
							</tr>
							<tr>
								<td width="100" height="20">
									<p align="right">
										<b><span style="font-size: 9pt;">태그</span></b>
									</p>
								</td>
								 <td width="450" height="20" colspan="3">
								 <span
									style="font-size: 9pt;">
									<c:forEach items="${tag}" var= "t" >
									<b>${t.tagName},</b>
								</c:forEach>
								</span>
								</td> 
							</tr>
							<tr>
								<td width="100" height="20">
									<p align="right">
										<b><span style="font-size: 9pt;">상담 가격</span></b>
									</p>
								</td>
								 <td width="450" height="20" colspan="3">
								 <span
									style="font-size: 9pt;">
									<c:forEach items="${price}" var= "p" >
									<b><c:if test="${p.counselorField==0}">대면상담 : </c:if></b>
									<span
									style="font-size: 9pt;">
									<b><c:if test="${p.counselorField==1}">전화상담 : </c:if></b>
									</span>
									<span
									style="font-size: 9pt;">
									<b><c:if test="${p.counselorField==2}">채팅상담 : </c:if></b>
									</span>
									<span
									style="font-size: 9pt;">
									<b><c:if test="${p.counselorField==3}">간편텍스트상담 : </c:if></b>
									</span>
									
									${p.counselorPrice}원,</b>
								</c:forEach>
								</span>
								</td> 
							</tr>
							

						</table>
						<br>

						 <sec:authorize access="isAuthenticated()">

							<form id="updateForm"
								action="${pageContext.request.contextPath}/counselor/counselorUpdate"
								method="post" style="display: none;">
								<input type="hidden" name="memberCode"
									value='<sec:authentication property="principal.memberCode"/>' />
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> 
									 <input type="hidden" name="password" /> 
							</form>
							
							<!--<form id="deleteForm"
								action="${pageContext.request.contextPath}/member/memberDelete"
								method="post" style="display: none;">
								<input type="hidden" name="memberCode"
									value='<sec:authentication property="principal.memberCode"/>' />
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> 
									<input type="hidden" name="password" />
							</form>-->
						</sec:authorize> 
						

						<a href="javascript:update();">수정하기</a>
						
					</div>

				</div>

				<!--/.row-->
			</div>
			<!--/.container-->
		</section>
		<section class="background-primary text-center py-4">
			<div class="container">
				<div class="row align-items-center" style="opacity: 0.85">
					<div class="col-sm-3 text-sm-left">
						<a href="${pageContext.request.contextPath}/"><img src="/assets/images/logo-light.png"
							alt="" /></a>
					</div>
					<div class="col-sm-6 mt-3 mt-sm-0">
						<p class="color-white lh-6 mb-0 fw-600">&copy; Copyright 2018
							Elixir Inc.</p>
					</div>
					<div class="col text-sm-right mt-3 mt-sm-0">
						<a class="color-white" href="https://themewagon.com/"
							target="_blank"> Designed by Themewagon</a>
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
	<script src="/assets/lib/jquery/dist/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script src="/assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="/assets/lib/imagesloaded/imagesloaded.pkgd.min.js"></script>
	<script src="/assets/lib/gsap/src/minified/TweenMax.min.js"></script>
	<script
		src="/assets/lib/gsap/src/minified/plugins/ScrollToPlugin.min.js"></script>
	<script src="/assets/lib/CustomEase.min.js"></script>
	<script src="/assets/js/config.js"></script>
	<script src="/assets/js/zanimation.js"></script>
	<script src="/assets/js/inertia.js"></script>
	<script src="/assets/js/core.js"></script>
	<script src="/assets/js/main.js"></script>
</body>
</html>