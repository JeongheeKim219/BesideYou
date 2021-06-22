<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

	$(function(){
	   $("#card").click(function(){
		   $("#artTestPay").attr("action", "${pageContext.request.contextPath}/psyPayment/inicis");
		   $("#artTestPay").submit();
	   })
	   
	   $("#phone").click(function(){
		   $("#artTestPay").attr("action", "${pageContext.request.contextPath}/psyPayment/danal");
		   $("#artTestPay").submit();
	   })
	   
	   $("#paypal").click(function(){
		   $("#artTestPay").attr("action", "${pageContext.request.contextPath}/psyPayment/paypal");
		   $("#artTestPay").submit();
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
            <section class="background-11">
                <div class="container">
                    <div class="row no-gutters pos-relative mt-6">
                        <div class="elixir-caret d-none d-lg-block"></div>
                        <div class="col-lg-6 py-3 py-lg-0 mb-0" style="min-height:400px;">
                            <div class="background-holder radius-tl-secondary radius-tr-secondary radius-tr-lg-0" style="background-image:url(${pageContext.request.contextPath}/assets/images/psy/arttherapy.png);">
                            </div>
                            <!--/.background-holder-->
                        </div>
                        <div class="col-lg-6 px-lg-5 py-lg-6 p-4 my-lg-0 background-white radius-bl-secondary radius-bl-lg-0 radius-br-secondary radius-br-lg-0 radius-tr-lg-secondary">
                            <div class="d-flex align-items-center h-100">
                                <div data-zanim-timeline="{}" data-zanim-trigger="scroll">
                                    <div class="overflow-hidden">
                                        <h4 data-zanim='{"delay":0}'>그림 심리 검사</h4>
                                    </div>
                                    <div class="overflow-hidden" style="float:left; margin-right: 50px">
	                                    <div class="mt-3" data-zanim='{"delay":0.1}'>Original Price</div>
	                                    <div class="mt-3" data-zanim='{"delay":0.2}' style="color:red">Discount</div>
	                                    <div class="mt-3" data-zanim='{"delay":0.3}'><h5>Purchase Price</h5></div>
                                    </div>
                                    
                                    <div class="overflow-hidden" align="right" style="margin-right: 20px">
	                                    <div class="mt-3" data-zanim='{"delay":0.1}'>50,000 원</div>
	                                    <div class="mt-3" data-zanim='{"delay":0.2}' style="color:red">-15,000 원</div>
	                                    <div class="mt-3" data-zanim='{"delay":0.3}'><h5>35,000 원</h5></div>
                                    </div>
                                    <br>
                                    <div class="overflow-hidden">
                                        <div data-zanim='{"delay":0.4}'>
                                        	<form name="artTestPay" id="artTestPay" method="post" action="">
                                        		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	                                        	<input type="hidden" name="category" value="1"/>
							            		<input type="hidden" name="counselor" value="1"/>
							            		<input type="hidden" name="id" value="aa"/>
							            		<input type="hidden" name="name" value="aaa"/>
							            		<input type="hidden" name="phone" value="111"/>
							            		<input type="hidden" name="email" value="aa@amail.com"/>
							            		<input type="hidden" name="price" value="1000"/>
            		
		                                        <input type="button" id="card" value="카드결제" class="btn btn-info mr-3 mb-3"/>
		                                        <input type="button" id="phone" value="휴대폰결제" class="btn btn-info mr-3 mb-3"/>
		                                        <input type="button" id="paypal" value="PayPal" class="btn btn-info mr-3 mb-3"/>
	                                        </form>
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