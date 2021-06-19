<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en-US">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--  -->
        <!--    Document Title-->
        <!-- =============================================-->
        <title>Elixir | Beautiful Site Template for Agencies &amp; Professionals</title>
        <!--  -->
        <!--    Favicons-->
        <!--    =============================================-->
        <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assets/images/favicons/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/assets/images/favicons/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assets/images/favicons/favicon-16x16.png">
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/favicons/favicon.ico">
        <link rel="manifest" href="${pageContext.request.contextPath}/assets/images/favicons/manifest.json">
        <link rel="mask-icon" href="${pageContext.request.contextPath}/assets/images/favicons/safari-pinned-tab.svg" color="#5bbad5">
        <meta name="msapplication-TileImage" content="${pageContext.request.contextPath}/assets/images/favicons/mstile-150x150.png">
        <meta name="theme-color" content="#ffffff">
        <!--  -->
        <!--    Stylesheets-->
        <!--    =============================================-->
        <!-- Default stylesheets-->
        <link href="${pageContext.request.contextPath}/assets/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Template specific stylesheets-->
        <link href="${pageContext.request.contextPath}/assets/lib/loaders.css/loaders.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700|Open+Sans:300,400,600,700,800" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/lib/iconsmind/iconsmind.css" rel="stylesheet">
        <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/lib/hamburgers/dist/hamburgers.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
        <!-- Main stylesheet and color file-->
        <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/custom.css" rel="stylesheet">
        
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function() {
	$("#use").click(function() {
		if ($("#remain").text() == 0) {
			alert("소진된 상담권입니다. 더이상 사용할 수 없습니다.");
			return;
		} else {
			if(confirm("상담권을 사용하시겠습니까?")){
				location.href="${pageContext.request.contextPath}/ticket/use/${ticket.ticketCode}";
			}else{
				return;
			}
		}
	})
	
	$("#refund").click(function() {
		if ($("#remain").text() == 0) {
			alert("소진된 상담권입니다. 환불 신청이 불가합니다.");
			return;
		} else {
			location.href="${pageContext.request.contextPath}/refund/refundApp/${ticket.ticketCode}";
		}
	})
	
	$("#delete").click(function() {
		if ($("#remain").text() > 0) {
			alert("잔여량이 남아있는 상담권입니다. 삭제가 불가합니다.");
			return;
		} else {
			if(confirm("소진된 상담권을 삭제하시겠습니까?")){
				location.href="${pageContext.request.contextPath}/ticket/delete/${ticket.ticketCode}";
			}else{
				return;
			}
		}
	})
})

</script>
        
    </head>
    <body data-spy="scroll" data-target=".inner-link" data-offset="60">
        <main>
            <div class="loading" id="preloader">
                <div class="loader h-100 d-flex align-items-center justify-content-center">
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
                        <div class="col-auto d-none d-lg-block"><span class="fa fa-map-marker color-warning fw-800 icon-position-fix"></span>
                            <p class="ml-2 mb-0 fs--1 d-inline color-white fw-700">1010 Avenue, New York, NY 10018 US. </p>
                        </div>
                        <div class="col-auto ml-md-auto order-md-2 d-none d-sm-block"><span class="fa fa-clock-o color-warning fw-800 icon-position-fix"></span>
                            <p class="ml-2 mb-0 fs--1 d-inline color-white fw-700">Mon-Sat, 8.00-18.00. Sunday CLOSED</p>
                        </div>
                        <div class="col-auto"><span class="fa fa-phone color-warning fw-800 icon-position-fix"></span><a class="ml-2 mb-0 fs--1 d-inline color-white fw-700" href="tel:2123865575">212 386 5575, 212 386 5576</a></div>
                    </div>
                    <!--/.row-->
                </div>
                <!--/.container-->
            </section>
            <div class="znav-white znav-container sticky-top navbar-elixir" id="znav-container">
                <div class="container">
                    <nav class="navbar navbar-expand-lg"><a class="navbar-brand overflow-hidden pr-3" href="/"><img src="${pageContext.request.contextPath}/assets/images/logo-dark.png" alt="" /></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
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
                                        <li><a href="index--header-slider-classic.html">Slider Classic</a></li>
                                        <li><a href="index--header-static.html">Static Header</a></li>
                                        <li><a href="index--header-static-classic.html">Static Classic</a></li>
                                        <li><a href="index--header-youtube-video.html">Youtube Background </a></li>
                                        <li><a href="index--header-youtube-video-classic.html">Youtube Classic</a></li>
                                        <li><a href="index--header-selfhosted-video.html">Self-hosted Video</a></li>
                                        <li><a href="index--header-selfhosted-video-classic.html">Self-hosted Classic</a></li>
                                    </ul>
                                </li>
                                <li><a href="JavaScript:void(0)">Pages</a>
                                    <ul class="dropdown fs--1">
                                        <li><a href="services.html">Services</a></li>
                                        <li><a href="about.html">About</a></li>
                                        <li><a href="alumni.html">Alumni</a></li>
                                        <li><a href="blank.html">Blank Page</a></li>
                                        <li><a href="404.html">404 Page</a></li>
                                        <li><a href="login.html">Login</a></li>
                                        <li><a href="registration.html">Registration</a></li>
                                    </ul>
                                </li>
                                <li><a href="JavaScript:void(0)">News</a>
                                    <ul class="dropdown fs--1">
                                        <li><a href="newsroom.html">Newsroom</a></li>
                                        <li><a href="news.html">Single News</a></li>
                                    </ul>
                                </li>
                                <li><a href="JavaScript:void(0)">Elements</a>
                                    <ul class="dropdown fs--1">
                                        <li><a href="components-buttons.html">Buttons</a></li>
                                        <li><a href="components-colors.html">Colors</a></li>
                                        <li><a href="components-googlemap.html">Google Map</a></li>
                                        <li><a href="components-grid.html">Grid</a></li>
                                        <li><a href="components-icons.html">Icons</a></li>
                                        <li><a href="components-layouthelpers.html">Layout Helpers</a></li>
                                        <li><a href="components-modal-video.html">Modal Video</a></li>
                                        <li><a href="components-owlcarousal.html">Owl Carousal</a></li>
                                        <li><a href="components-slider.html">Slider</a></li>
                                        <li><a href="components-typography.html">Typography</a></li>
                                    </ul>
                                </li>
                                <li><a class="d-block mr-md-9" href="contact.html">Contact</a></li>
                            </ul>
                            <ul class="navbar-nav ml-lg-auto">
                                <li><a class="btn btn-outline-primary btn-capsule btn-sm border-2x fw-700" href="https://themewagon.com/themes/elixir/" target="_blank">Purchase</a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            <section class="background-11">
                <div class="container">
                    <div class="row no-gutters pos-relative mt-6">
                        <div class="elixir-caret d-none d-lg-block"></div>
                        <div class="col-lg-6 py-3 py-lg-0 mb-0" style="min-height:400px;">
                            <div class="background-holder radius-tl-secondary radius-tr-secondary radius-tr-lg-0" style="background-image:url(${pageContext.request.contextPath}/assets/images/6.jpg);">
                            </div>
                            <!--/.background-holder-->
                        </div>
                        <div class="col-lg-6 px-lg-5 py-lg-6 p-4 my-lg-0 background-white radius-bl-secondary radius-bl-lg-0 radius-br-secondary radius-br-lg-0 radius-tr-lg-secondary">
                            <div class="d-flex align-items-center h-100">
                                <div data-zanim-timeline="{}" data-zanim-trigger="scroll">
                                    <div class="overflow-hidden" align="right">
                                        <c:choose>
                                        	<c:when test="${ticket.ticketField==0}"><h3 data-zanim='{"delay":0}'><span class="color-1 fs-3 icon-Business-ManWoman"></span>&nbsp;&nbsp;대면 상담권</h3></c:when>
                                        	<c:when test="${ticket.ticketField==1}"><h3 data-zanim='{"delay":0}'><span class="color-1 fs-3 icon-Phone-2"></span>&nbsp;&nbsp;전화 상담권</h3></c:when>
                                        	<c:when test="${ticket.ticketField==2}"><h3 data-zanim='{"delay":0}'><span class="color-1 fs-3 icon-Phone-SMS"></span>&nbsp;&nbsp;채팅 상담권</h3></c:when>
                                        	<c:when test="${ticket.ticketField==3}"><h3 data-zanim='{"delay":0}'><span class="color-1 fs-3 icon-File-TXT"></span>&nbsp;&nbsp;간편 텍스트 상담권</h3></c:when>
                                        </c:choose>
                                    </div>
                                    <hr style="height:1px;">
                                    <div class="overflow-hidden" style="float:left; margin-right: 150px">
	                                    <div class="mt-3" data-zanim='{"delay":0.1}'><h5>담당 상담사</h5></div>
	                                    <div class="mt-3" data-zanim='{"delay":0.2}'>티켓 구매일</div>
	                                    <div class="mt-3" data-zanim='{"delay":0.3}'>최초 구매량</div>
	                                    <div class="mt-3" data-zanim='{"delay":0.4}'>현재 잔여량</div>
                                    </div>
                                    
                                    <div class="overflow-hidden" align="right">
                                    	<div class="mt-3" data-zanim='{"delay":0.1}'><h5>${counselor.member.name}</h5></div>
	                                    <div class="mt-3" data-zanim='{"delay":0.2}'>
	                                    <fmt:parseDate var="ticketDate" pattern="yyyy-MM-dd'T'HH:mm" value="${ticket.ticketDate}" type="both"/>
	                                    	<fmt:formatDate value="${ticketDate}" pattern="yyyy년 MM월 dd일"/>
	                                    </div>
	                                    <div class="mt-3" data-zanim='{"delay":0.3}'>${ticket.ticketAmount}</div>
	                                    <div class="mt-3" id="remain" data-zanim='{"delay":0.4}'>${ticket.ticketRemain}</div>
                                    </div>
                                    <br>
                                    <hr style="height:1px;">
                                    <div class="overflow-hidden" align="left" style="float:left; margin-right: 150px">
                                        <div data-zanim='{"delay":0.5}'>
                                        	<c:choose>
                                        		<c:when test="${refundState==0}"><span style="font-size: 18px; color: red">환불 처리 진행 중</span></c:when>
                                        		<c:when test="${refundState==1}"><span style="font-size: 18px; color: red">환불 불가</span></c:when>
                                        		<c:when test="${refundState==2}"><span style="font-size: 18px; color: blue">환불 완료</span></c:when>
                                        	</c:choose>
                                        </div>
                                    </div>
                                    
                                    <div class="overflow-hidden" align="right">
                                        <div data-zanim='{"delay":0.5}'>
           									<c:choose>
           										<c:when test="${refundState==0}">
           											<a href="${pageContext.request.contextPath}/ticket/mylist"><input type="button" id="mylist" value="목록으로" class="btn btn-outline-primary btn-xs"/></a>
           										</c:when>
           										<c:when test="${refundState==1}">
           											<a href="${pageContext.request.contextPath}/ticket/mylist"><input type="button" id="mylist" value="목록으로" class="btn btn-outline-primary btn-xs"/></a>
           										</c:when>
           										<c:when test="${refundState==2}">
           											<a href="${pageContext.request.contextPath}/ticket/mylist"><input type="button" id="mylist" value="목록으로" class="btn btn-outline-primary btn-xs"/></a>
           										</c:when>
           										<c:otherwise>
           											<form name="useticket" id="useticket" method="get" action="${pageContext.request.contextPath}/counsel/submit012">
			                                        	<input type="hidden" name="counselCategory" value="${ticket.ticketField}"/>
									            		<input type="hidden" name="counselorCode" value="${counselor.counselorCode}"/>
           												<input type="submit" id="usetk" value="사용하기" class="btn btn-outline-primary btn-sm"/>&nbsp;&nbsp;&nbsp;
	                                        		</form>
	                                        		<!-- <input type="button" id="use" value="사용하기" class="btn btn-outline-primary btn-sm"/>&nbsp;&nbsp;&nbsp; -->
	                                        		<input type="button" id="refund" value="환불신청" class="btn btn-outline-primary btn-sm"/>&nbsp;&nbsp;&nbsp;
	                                        		<a href="${pageContext.request.contextPath}/ticket/mylist"><input type="button" id="mylist" value="목록으로" class="btn btn-outline-primary btn-sm"/></a>
	                                        		<!-- <a href="#"><input type="button" id="delete" value="삭제하기" class="btn btn-outline-info"/></a> -->
           										</c:otherwise>
           									</c:choose>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-7">
                        <div class="col-sm-6 col-lg-4 px-4 px-sm-3 text-lg-x" data-zanim-timeline="{}" data-zanim-trigger="scroll">
                            <h5 data-zanim='{"delay":0}'><span class="ion-card color-primary fs-2 icon-position-fix mr-3"></span>Special financing</h5>
                            <p class="mt-3 pr-3 pr-lg-5 mb-0" data-zanim='{"delay":0.1}'>Apply for special financial support and earn exclusive rewards.</p>
                        </div>
                        <div class="col-sm-6 col-lg-4 px-4 px-sm-3 mt-4 mt-sm-0 text-lg-x" data-zanim-timeline="{}" data-zanim-trigger="scroll">
                            <h5 data-zanim='{"delay":0}'><span class="ion-chatbox-working color-primary mr-3"></span>Chat with team</h5>
                            <p class="mt-3 pr-3 pr-lg-5 mb-0" data-zanim='{"delay":0.1}'>Have a question? Chat online with an expert. <a href="#">Start chatting<span class="fa fa-external-link ml-1 icon-position-fix"></span></a></p>
                        </div>
                        <div class="col-sm-6 col-lg-4 px-4 px-sm-3 mt-4 mt-lg-0 text-lg-x" data-zanim-timeline="{}" data-zanim-trigger="scroll">
                            <h5 data-zanim='{"delay":0}'><span class="ion-android-call color-primary mr-3"></span>Call a specialist</h5>
                            <p class="mt-3 pr-3 pr-lg-5 mb-0" data-zanim='{"delay":0.1}'>Our 24/7 support team is ready for you at 1-800-MY-Elixir.</p>
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
                            <h4 class="color-white mb-0">If you have any query related investment... <br class="d-md-none" />we are available 24/7</h4>
                        </div>
                        <div class="col-md-auto mt-md-0 mt-4"><a class="btn btn-white btn-capsule" href="contact.html">Contact Us</a></div>
                    </div>
                    <!--/.row-->
                </div>
                <!--/.container-->
            </section>
            <section class=" background-white">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="owl-carousel owl-theme owl-dot-round" data-options='{"nav":true,"dots":false,"loop":true,"autoplay":true,"autoplayHoverPause":true,"items":1}'>
                                <div class="row px-lg-8">
                                    <div class="col-4 col-md-3 mx-auto"><img class="radius-secondary mx-auto" src="${pageContext.request.contextPath}/assets/images/client1.png" alt="Member" style="width: auto" /></div>
                                    <div class="col-md-9 ml-auto mt-4 mt-md-0 px-4 px-sm-3">
                                        <p class="lead fw-400">Their work on our website and Internet marketing has made a significant different to our business. We’ve seen a 425% increase in quote requests from the website which has been pretty remarkable – but I’d always like to see more!</p>
                                        <h6 class="fs-0 mb-1 mt-4">Michael Clarke</h6>
                                        <p class="mb-0 color-7">CEO, A.E.T Institute</p>
                                    </div>
                                </div>
                                <div class="row px-lg-8">
                                    <div class="col-4 col-md-3 mx-auto"><img class="radius-secondary mx-auto" src="${pageContext.request.contextPath}/assets/images/client2.png" alt="Member" style="width: auto" /></div>
                                    <div class="col-md-9 ml-auto mt-4 mt-md-0 px-4 px-sm-3">
                                        <p class="lead fw-400">Writing case studies was a daunting task for us. We didn’t know where to begin or what questions to ask, and clients never seemed to follow through when we asked. Elixir team did everything – with almost no time or effort for me!</p>
                                        <h6 class="fs-0 mb-1 mt-4">Maria Sharapova</h6>
                                        <p class="mb-0 color-7">Managing Director, Themewagon Inc.</p>
                                    </div>
                                </div>
                                <div class="row px-lg-8">
                                    <div class="col-4 col-md-3 mx-auto"><img class="radius-secondary mx-auto" src="${pageContext.request.contextPath}/assets/images/client3.png" alt="Member" style="width: auto" /></div>
                                    <div class="col-md-9 ml-auto mt-4 mt-md-0 px-4 px-sm-3">
                                        <p class="lead fw-400">As a sales gamification company, we were skeptical to work with a consultant to optimize our sales emails, but Elixir was highly recommended by many other Y-Combinator startups we knew. Elixir helped us run a ~6 week email campaign.</p>
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
                    <div class="row align-items-center" data-zanim-timeline="{}" data-zanim-trigger="scroll">
                        <div class="col-4 col-md-2 my-3 overflow-hidden"><img src="${pageContext.request.contextPath}/assets/images/partner/logo2.png" alt="" data-zanim="{}" /></div>
                        <div class="col-4 col-md-2 my-3 overflow-hidden"><img src="${pageContext.request.contextPath}/assets/images/partner/logo1.png" alt="" data-zanim="{}" /></div>
                        <div class="col-4 col-md-2 my-3 overflow-hidden"><img src="${pageContext.request.contextPath}/assets/images/partner/logo6.png" alt="" data-zanim="{}" /></div>
                        <div class="col-4 col-md-2 my-3 overflow-hidden"><img src="${pageContext.request.contextPath}/assets/images/partner/logo3.png" alt="" data-zanim="{}" /></div>
                        <div class="col-4 col-md-2 my-3 overflow-hidden"><img src="${pageContext.request.contextPath}/assets/images/partner/logo5.png" alt="" data-zanim="{}" /></div>
                        <div class="col-4 col-md-2 my-3 overflow-hidden"><img src="${pageContext.request.contextPath}/assets/images/partner/logo4.png" alt="" data-zanim="{}" /></div>
                    </div>
                    <!--/.row-->
                </div>
                <!--/.container-->
            </section>
            <section style="background-color: #3D4C6F">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-6">
                            <div class="background-primary color-white p-5 p-lg-6 radius-secondary">
                                <h4 class="color-white fs-1 fs-lg-2 mb-1">Sign up for email alerts</h4>
                                <p class="color-white">Stay current with our latest insights</p>
                                <form class="mt-4">
                                    <div class="row align-items-center">
                                        <div class="col-md-7 pr-md-0">
                                            <div class="input-group">
                                                <input class="form-control" type="email" placeholder="Enter Email Here" />
                                            </div>
                                        </div>
                                        <div class="col-md-5 mt-3 mt-md-0">
                                            <button class="btn btn-warning btn-block" type="submit"><span class="color-primary fw-600">Submit</span></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-6 mt-4 mt-lg-0">
                            <div class="row">
                                <div class="col-6 col-lg-4 color-white ml-lg-auto">
                                    <ul class="list-unstyled">
                                        <li class="mb-3"><a class="color-white" href="#">Contact Us</a></li>
                                        <li class="mb-3"><a class="color-white" href="#">FAQ</a></li>
                                        <li class="mb-3"><a class="color-white" href="#">Privacy Policy</a></li>
                                        <li class="mb-3"><a class="color-white" href="#">Terms of Use</a></li>
                                        <li class="mb-3"><a class="color-white" href="#">Global Office</a></li>
                                        <li class="mb-3"><a class="color-white" href="#">Local Office</a></li>
                                    </ul>
                                </div>
                                <div class="col-6 col-sm-5 ml-sm-auto"><a href="#">
                                        <div class="row mb-3 align-items-center no-gutters">
                                            <div class="col-auto">
                                                <div class="background-primary text-center d-flex align-items-center radius-primary" style="height: 40px; width: 40px;"><span class="w-100 fa fa-linkedin color-white"></span></div>
                                            </div>
                                            <div class="col-6 pl-3">
                                                <h5 class="fs-0 color-white mb-0 d-inline-block">Linkedin</h5>
                                            </div>
                                        </div>
                                    </a><a href="#">
                                        <div class="row mb-3 align-items-center no-gutters">
                                            <div class="col-auto">
                                                <div class="background-primary text-center d-flex align-items-center radius-primary" style="height: 40px; width: 40px;"><span class="w-100 fa fa-twitter color-white"></span></div>
                                            </div>
                                            <div class="col-6 pl-3">
                                                <h5 class="fs-0 color-white mb-0 d-inline-block">Twitter</h5>
                                            </div>
                                        </div>
                                    </a><a href="#">
                                        <div class="row mb-3 align-items-center no-gutters">
                                            <div class="col-auto">
                                                <div class="background-primary text-center d-flex align-items-center radius-primary" style="height: 40px; width: 40px;"><span class="w-100 fa fa-facebook color-white"></span></div>
                                            </div>
                                            <div class="col-6 pl-3">
                                                <h5 class="fs-0 color-white mb-0 d-inline-block">Facebook</h5>
                                            </div>
                                        </div>
                                    </a><a href="#">
                                        <div class="row mb-3 align-items-center no-gutters">
                                            <div class="col-auto">
                                                <div class="background-primary text-center d-flex align-items-center radius-primary" style="height: 40px; width: 40px;"><span class="w-100 fa fa-google-plus color-white"></span></div>
                                            </div>
                                            <div class="col-6 pl-3">
                                                <h5 class="fs-0 color-white mb-0 d-inline-block">Google+</h5>
                                            </div>
                                        </div>
                                    </a></div>
                            </div>
                        </div>
                    </div>
                    <!--/.row-->
                </div>
                <!--/.container-->
            </section>
            <section class="background-primary text-center py-4">
                <div class="container">
                    <div class="row align-items-center" style="opacity: 0.85">
                        <div class="col-sm-3 text-sm-left"><a href="index.html"><img src="assets/images/logo-light.png" alt="" /></a></div>
                        <div class="col-sm-6 mt-3 mt-sm-0">
                            <p class="color-white lh-6 mb-0 fw-600">&copy; Copyright 2018 Elixir Inc.</p>
                        </div>
                        <div class="col text-sm-right mt-3 mt-sm-0"><a class="color-white" href="https://themewagon.com/" target="_blank"> Designed by Themewagon</a></div>
                    </div>
                    <!--/.row-->
                </div>
                <!--/.container-->
            </section>
        </main>
        <!--  -->
        <!--    JavaScripts-->
        <!--    =============================================-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/lib/jquery/dist/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/lib/imagesloaded/imagesloaded.pkgd.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/lib/gsap/src/minified/TweenMax.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/lib/gsap/src/minified/plugins/ScrollToPlugin.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/lib/CustomEase.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/zanimation.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/inertia.js"></script>
        <script src="${pageContext.request.contextPath}/assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/core.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    </body>
</html>