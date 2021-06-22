<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<link
	href="${pageContext.request.contextPath}/assets/lib/owl.carousel/dist/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css"
	rel="stylesheet">
<!-- Main stylesheet and color file-->
<link href="${pageContext.request.contextPath}/assets/css/style.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/custom.css"
	rel="stylesheet">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	function count(type) {
		const resultElement = document.getElementById('result'); // 결과를 표시할 element
		let number = resultElement.innerText; // 현재 화면에 표시된 값
	
		// 더하기/빼기
		if (type === 'plus') {
			number = parseInt(number) + 1;
		} else if (type === 'minus') {
			if (number > 0) number = parseInt(number) - 1;
		}
	
		// 결과 출력
		resultElement.innerText = number;
	}

	$(function(){
		// 결제 API 이동
	   $("#card").click(function(){
		   if($("input[name=ticketPrice]").val()==0){
			   alert("구매 정보가 미입력되었습니다. 상담권 수량을 선택해주세요.");
			   return;
		   }else{
			   $("#payment").attr("action", "${pageContext.request.contextPath}/payment/inicis");
			   $("#payment").submit();
			   
			   //전송되는 값 확인
			   /* console.log($("input[name=ticketField]").val());
			   console.log($("input[name=counselorCode]").val());
			   
			   console.log($("input[name=memberCode]").val());
			   console.log($("input[name=name]").val());
			   console.log($("input[name=email]").val());
			   console.log($("input[name=phone]").val());
			   console.log($("input[name=memberAddr]").val()); */
			   
			   console.log($("input[name=ticketAmount]").val());
			   console.log($("input[name=ticketRemain]").val());
			   console.log($("input[name=discountCode]").val());
			   console.log($("input[name=ticketPrice]").val());
			   
		   }
	   })
	   
	   $("#phone").click(function(){
		   if($("input[name=ticketPrice]").val()==0){
			   alert("구매 정보가 미입력되었습니다. 상담권 수량을 선택해주세요.");
			   return;
		   }else{
			   $("#payment").attr("action", "${pageContext.request.contextPath}/payment/danal");
			   $("#payment").submit();
		   }
	   })
	   
	   $("#paypal").click(function(){
		   if($("input[name=ticketPrice]").val()==0){
			   alert("구매 정보가 미입력되었습니다. 상담권 수량을 선택해주세요.");
			   return;
		   }else{
			   $("#payment").attr("action", "${pageContext.request.contextPath}/payment/paypal");
			   $("#payment").submit();
		   }
	   })
	   
	   // 할인가 산출
	   $("#plus, #minus").click(function(){
		   
		   const resultElement = document.getElementById('result');  //수량이 표시되는 Element
		   let number = resultElement.innerText;  //그 Element의 text 값
		   let num = parseInt(number);  //그 text값을 정수형으로 변환
		   let total = ${price} * num;  //원가 계산
		   $("#op").html(total+'&nbsp;원');  //계산된 원가를 #op Element에 html 형식으로 입력
		   
		   // 수량에 따른 할인율 (2~5개:5% / 6~10개:10% / 11개 이상~:20%)
		   let dc;
		   if(num >= 2 && num <= 5) {
			   dc = total * 0.05;
			   $("#dc").html('- '+dc+'&nbsp;원');
			   $("input[name=discountCode]").val(5);
		   }
		   else if(num > 5 && num <= 10) {
			   dc = total * 0.1;
			   $("#dc").html('- '+dc+'&nbsp;원');
			   $("input[name=discountCode]").val(10);
		   }
		   else if(num > 10) {
			   dc = total * 0.2;
			   $("#dc").html('- '+dc+'&nbsp;원');
			   $("input[name=discountCode]").val(20);
		   }
		   else {
			   dc = 0;
			   $("#dc").html(dc+'&nbsp;원');
			   $("input[name=discountCode]").val(1);
		   }
		   let price = total-dc;
		   $("#price").html('<h5>'+price+'&nbsp;원</h5>');
		   $("input[name=ticketPrice]").val(price);
		   $("input[name=ticketAmount]").val(number);
		   $("input[name=ticketRemain]").val(number);
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
		<section class="background-11">
			<div class="container">
				<div class="row no-gutters pos-relative mt-6">
					<div class="elixir-caret d-none d-lg-block"></div>
					<div class="col-lg-6 py-3 py-lg-0 mb-0" style="min-height: 400px;">
						<div
							class="background-holder radius-tl-secondary radius-tr-secondary radius-tr-lg-0"
							style="background-image:url(${pageContext.request.contextPath}/assets/images/image.webp);">
						</div>
						<!--/.background-holder-->
					</div>
					<div
						class="col-lg-6 px-lg-5 py-lg-6 p-4 my-lg-0 background-white radius-bl-secondary radius-bl-lg-0 radius-br-secondary radius-br-lg-0 radius-tr-lg-secondary">
						<div class="d-flex align-items-center h-100">
							<div data-zanim-timeline="{}" data-zanim-trigger="scroll">
								<div class="overflow-hidden">
									<c:choose>
										<c:when test="${counselCategory==0}">
											<h4 data-zanim='{"delay":0}'>대면상담</h4>
										</c:when>
										<c:when test="${counselCategory==1}">
											<h4 data-zanim='{"delay":0}'>전화상담</h4>
										</c:when>
										<c:when test="${counselCategory==2}">
											<h4 data-zanim='{"delay":0}'>채팅상담</h4>
										</c:when>
										<c:when test="${counselCategory==3}">
											<h4 data-zanim='{"delay":0}'>텍스트상담</h4>
										</c:when>
									</c:choose>
								</div>
								<div class="overflow-hidden"
									style="float: left; margin-right: 50px">
									<div class="mt-3" data-zanim='{"delay":0.1}'>Ticket
										Amount</div>
									<div class="mt-3" data-zanim='{"delay":0.2}'>Original
										Price</div>
									<div class="mt-3" data-zanim='{"delay":0.3}' style="color: red">Discount</div>
									<div class="mt-3" data-zanim='{"delay":0.4}'>
										<h5>Purchase Price</h5>
									</div>
								</div>

								<div class="overflow-hidden" align="right"
									style="margin-right: 20px">
									<div class="mt-3" data-zanim='{"delay":0.1}'>
										<input type='button' id="plus" onclick='count("plus")'
											value='+' /> <span id="result"
											style="padding: 0px 10px 0px 10px">0</span> <input
											type='button' id="minus" onclick='count("minus")' value='-' />
									</div>
									<div id="op" class="mt-3" data-zanim='{"delay":0.2}'>0&nbsp;원</div>
									<div id="dc" class="mt-3" data-zanim='{"delay":0.3}'
										style="color: red">0&nbsp;원</div>
									<div id="price" class="mt-3" data-zanim='{"delay":0.4}'>
										<h5>0&nbsp;원</h5>
									</div>
								</div>
								<br>
								<div class="overflow-hidden">
									<div data-zanim='{"delay":0.5}'>
										<form name="payment" id="payment" method="get" action="">
											<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
											<input type="hidden" name="ticketField" value="${counselCategory}" />
											<input type="hidden" name="counselorCode" value="${counselorCode}" />

											<%-- <input type="hidden" name="memberCode" value="${member.memberCode}"/>
							            	<input type="hidden" name="name" value="${member.name}"/>
							            	<input type="hidden" name="phone" value="${member.phone}"/>
							            	<input type="hidden" name="email" value="${member.email}"/>
							            	<input type="hidden" name="memberAddr" value="${member.memberAddr}"/> --%>

											<input type="hidden" name="ticketAmount" value="0" /> 
											<input type="hidden" name="ticketRemain" value="0" />
											<input type="hidden" name="discountCode" value="0" />
											<input type="hidden" name="ticketPrice" value="0" />
										</form>
										<input type="button" id="card" value="카드결제" class="btn btn-info mr-3 mb-3" />
										<input type="button" id="phone" value="휴대폰결제" class="btn btn-info mr-3 mb-3" />
										<input type="button" id="paypal" value="PayPal" class="btn btn-info mr-3 mb-3" />
										
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
				<div class="row mt-7">
					<div class="col-sm-6 col-lg-4 px-4 px-sm-3 text-lg-x"
						data-zanim-timeline="{}" data-zanim-trigger="scroll">
						<h5 data-zanim='{"delay":0}'>
							<span class="ion-card color-primary fs-2 icon-position-fix mr-3"></span>Special
							financing
						</h5>
						<p class="mt-3 pr-3 pr-lg-5 mb-0" data-zanim='{"delay":0.1}'>Apply
							for special financial support and earn exclusive rewards.</p>
					</div>
					<div class="col-sm-6 col-lg-4 px-4 px-sm-3 mt-4 mt-sm-0 text-lg-x"
						data-zanim-timeline="{}" data-zanim-trigger="scroll">
						<h5 data-zanim='{"delay":0}'>
							<span class="ion-chatbox-working color-primary mr-3"></span>Chat
							with team
						</h5>
						<p class="mt-3 pr-3 pr-lg-5 mb-0" data-zanim='{"delay":0.1}'>
							Have a question? Chat online with an expert. <a href="#">Start
								chatting<span class="fa fa-external-link ml-1 icon-position-fix"></span>
							</a>
						</p>
					</div>
					<div class="col-sm-6 col-lg-4 px-4 px-sm-3 mt-4 mt-lg-0 text-lg-x"
						data-zanim-timeline="{}" data-zanim-trigger="scroll">
						<h5 data-zanim='{"delay":0}'>
							<span class="ion-android-call color-primary mr-3"></span>Call a
							specialist
						</h5>
						<p class="mt-3 pr-3 pr-lg-5 mb-0" data-zanim='{"delay":0.1}'>Our
							24/7 support team is ready for you at 1-800-MY-Elixir.</p>
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
		<section class=" background-white">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="owl-carousel owl-theme owl-dot-round"
							data-options='{"nav":true,"dots":false,"loop":true,"autoplay":true,"autoplayHoverPause":true,"items":1}'>
							<div class="row px-lg-8">
								<div class="col-4 col-md-3 mx-auto">
									<img class="radius-secondary mx-auto"
										src="${pageContext.request.contextPath}/assets/images/client1.png"
										alt="Member" style="width: auto" />
								</div>
								<div class="col-md-9 ml-auto mt-4 mt-md-0 px-4 px-sm-3">
									<p class="lead fw-400">Their work on our website and
										Internet marketing has made a significant different to our
										business. We’ve seen a 425% increase in quote requests from
										the website which has been pretty remarkable – but I’d always
										like to see more!</p>
									<h6 class="fs-0 mb-1 mt-4">Michael Clarke</h6>
									<p class="mb-0 color-7">CEO, A.E.T Institute</p>
								</div>
							</div>
							<div class="row px-lg-8">
								<div class="col-4 col-md-3 mx-auto">
									<img class="radius-secondary mx-auto"
										src="${pageContext.request.contextPath}/assets/images/client2.png"
										alt="Member" style="width: auto" />
								</div>
								<div class="col-md-9 ml-auto mt-4 mt-md-0 px-4 px-sm-3">
									<p class="lead fw-400">Writing case studies was a daunting
										task for us. We didn’t know where to begin or what questions
										to ask, and clients never seemed to follow through when we
										asked. Elixir team did everything – with almost no time or
										effort for me!</p>
									<h6 class="fs-0 mb-1 mt-4">Maria Sharapova</h6>
									<p class="mb-0 color-7">Managing Director, Themewagon Inc.</p>
								</div>
							</div>
							<div class="row px-lg-8">
								<div class="col-4 col-md-3 mx-auto">
									<img class="radius-secondary mx-auto"
										src="${pageContext.request.contextPath}/assets/images/client3.png"
										alt="Member" style="width: auto" />
								</div>
								<div class="col-md-9 ml-auto mt-4 mt-md-0 px-4 px-sm-3">
									<p class="lead fw-400">As a sales gamification company, we
										were skeptical to work with a consultant to optimize our sales
										emails, but Elixir was highly recommended by many other
										Y-Combinator startups we knew. Elixir helped us run a ~6 week
										email campaign.</p>
									<h6 class="fs-0 mb-1 mt-4">David Beckham</h6>
									<p class="mb-0 color-7">Chairman, Harmony Corporation</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--/.row-->
			</div>
			<!--/.container-->
		</section>
		<section class="background-10 py-6">
			<div class="container">
				<div class="row align-items-center" data-zanim-timeline="{}"
					data-zanim-trigger="scroll">
					<div class="col-4 col-md-2 my-3 overflow-hidden">
						<img
							src="${pageContext.request.contextPath}/assets/images/partner/logo2.png"
							alt="" data-zanim="{}" />
					</div>
					<div class="col-4 col-md-2 my-3 overflow-hidden">
						<img
							src="${pageContext.request.contextPath}/assets/images/partner/logo1.png"
							alt="" data-zanim="{}" />
					</div>
					<div class="col-4 col-md-2 my-3 overflow-hidden">
						<img
							src="${pageContext.request.contextPath}/assets/images/partner/logo6.png"
							alt="" data-zanim="{}" />
					</div>
					<div class="col-4 col-md-2 my-3 overflow-hidden">
						<img
							src="${pageContext.request.contextPath}/assets/images/partner/logo3.png"
							alt="" data-zanim="{}" />
					</div>
					<div class="col-4 col-md-2 my-3 overflow-hidden">
						<img
							src="${pageContext.request.contextPath}/assets/images/partner/logo5.png"
							alt="" data-zanim="{}" />
					</div>
					<div class="col-4 col-md-2 my-3 overflow-hidden">
						<img
							src="${pageContext.request.contextPath}/assets/images/partner/logo4.png"
							alt="" data-zanim="{}" />
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
	<script
		src="${pageContext.request.contextPath}/assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/core.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>