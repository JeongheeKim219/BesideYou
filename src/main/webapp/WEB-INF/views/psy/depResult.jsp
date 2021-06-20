<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('1bb89eb38bd6e77094446a0ca39ac555');

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
        
        
</script>
    
    
<meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--  -->
        <!--    Document Title-->
        <!-- =============================================-->
        <title>Elixir | Beautiful Site Template for Agencies &amp; Professionals</title>
        <!--  -->
        <!--    Favicons-->
        <!--    =============================================-->
        <link rel="apple-touch-icon" sizes="180x180" href="/assets/images/favicons/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="/assets/images/favicons/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="/assets/images/favicons/favicon-16x16.png">
        <link rel="shortcut icon" type="image/x-icon" href="/assets/images/favicons/favicon.ico">
        <link rel="manifest" href="/assets/images/favicons/manifest.json">
        <link rel="mask-icon" href="/assets/images/favicons/safari-pinned-tab.svg" color="#5bbad5">
        <meta name="msapplication-TileImage" content="/assets/images/favicons/mstile-150x150.png">
        <meta name="theme-color" content="#ffffff">
        <!--  -->
        <!--    Stylesheets-->
        <!--    =============================================-->
        <!-- Default stylesheets-->
        <link href="/assets/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Template specific stylesheets-->
        <link href="/assets/lib/loaders.css/loaders.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700|Open+Sans:300,400,600,700,800" rel="stylesheet">
        <link href="/assets/lib/iconsmind/iconsmind.css" rel="stylesheet">
        <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet">
        <link href="/assets/lib/hamburgers/dist/hamburgers.min.css" rel="stylesheet">
        <link href="/assets/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <!-- Main stylesheet and color file-->
        <link href="/assets/css/style.css" rel="stylesheet">
        <link href="/assets/css/custom.css" rel="stylesheet">
        <style type="text/css">
        #testImg{width:290px; height:190px; }
        </style>
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
                    <nav class="navbar navbar-expand-lg"><a class="navbar-brand overflow-hidden pr-3" href="index.html"><img src="/assets/images/logo-dark.png" alt="" /></a>
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
                    
                    <div class="row mt-6">
                        <div class="col">
                            <h3 class="text-center fs-2 fs-md-3">우울증 자가진단 테스트 결과</h3>
                            <hr class="short" data-zanim='{"from":{"opacity":0,"width":0},"to":{"opacity":1,"width":"4.20873rem"},"duration":0.8}' data-zanim-trigger="scroll" />
                        </div>
                    </div>
                    <!--/.row-->
                </div>
                <section >
		                <div class="container">
		                    <div class="row">
		                        <div class="col-12">
			                        <c:choose>
			                        	<c:when test="${total>50}">
			                        		<div  style="text-align : center;" class="mb-6">
					                        	<img class="radius-tr-secondary radius-tl-secondary" src="/assets/images/psy/stress2.jpg" alt="70gratethan" width=400 height=300>
					                        </div>
					                        <h5 class="text-center">우울증 증세가 있는 편이에요.</h5>	
			                        		<div class="media pt-5"><span class="icon-Battery-50 fs-5 color-warning mr-3" style="transform: translateY(-1rem)"></span>
			                        	</c:when>
			                        	<c:when test="${total>60}">
			                        		<div  style="text-align : center;" class="mb-6">
					                        	<img class="radius-tr-secondary radius-tl-secondary" src="/assets/images/psy/stress2.jpg" alt="70gratethan" width=400 height=300>
					                        </div>
					                        <h5 class="text-center">중증 우울증 증세가 나타나고 있어요.</h5>	
			                        		<div class="media pt-5"><span class="icon-Battery-25 fs-5 color-warning mr-3" style="transform: translateY(-1rem)"></span>
			                        	</c:when>
			                        	<c:when test="${total>70}">
			                        		<div  style="text-align : center;" class="mb-6">
					                        	<img class="radius-tr-secondary radius-tl-secondary" src="/assets/images/psy/dep70.jpg" alt="70gratethan" width=400 height=300>
					                        </div>
					                        <h5 class="text-center">즉시 병원에 가서 약물치료를 받아야 해요.</h5>	
			                        		<div class="media pt-5"><span class="icon-Battery-0 fs-5 color-warning mr-3" style="transform: translateY(-1rem)"></span>
			                        	</c:when>
			                        	<c:otherwise>
			                        		<div  style="text-align : center;" class="mb-6">
					                        	<img class="radius-tr-secondary radius-tl-secondary" src="/assets/images/psy/stress0.jpg" alt="70gratethan" width=400 height=300>
					                        </div>
					                        <h5 class="text-center">우울증 증세는 없어요~!</h5>	
			                        		<div class="media pt-5"><span class="icon-Battery-100 fs-5 color-warning mr-3" style="transform: translateY(-1rem)"></span>
			                        	</c:otherwise>
			                        </c:choose>
									<div class="media-body">
				                    	<h2 class="color-primary fs-3 fs-lg-4">나의 우울증 지수는<br /><span class="color-warning">${total} 점</span></h2>
				                    </div></div>	
		                        
		                        </div>
		                    </div>
		                    <!--/.row-->
		                    
		                </div>
		                <!--/.container-->
		            </section>
                <!--/.container-->
               
                <div class="container">
                	<div style="text-align:center;">
	                	<a id="create-kakao-link-btn" href="javascript:;">
						  <img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"/>
						</a>
						<p class="fw-lighter mt-3">심리검사 공유하기</p>
                	</div>
					<script type="text/javascript">
					  Kakao.Link.createDefaultButton({
					    container: '#create-kakao-link-btn',
					    objectType: 'feed',
					    content: {
					      title: 'BU_당신의 우울증 점수는 몇 점?',
					      description: '간단한 심리검사로 알아보는 지금 나의 우울증 점수는 몇 점?',
					      imageUrl:
					        'https://ifh.cc/g/hyeUgx.jpg',
					      link: {
					        mobileWebUrl: 'https://developers.kakao.com',
					        webUrl: 'http://localhost:9000/psy/depResult?no='+${code},
					      },
					    },
					    social: {
					      likeCount: 286,
					      commentCount: 45,
					      sharedCount: 845,
					    },
					    buttons: [
					      {
					        title: '웹으로 보기',
					        link: {
					          mobileWebUrl: 'https://developers.kakao.com',
					          webUrl: 'http://localhost:9000/psy/depResult?no='+${code},
					        },
					      },
					      /*{
					        title: '앱으로 보기',
					        link: {
					          mobileWebUrl: 'https://developers.kakao.com',
					          webUrl: 'https://developers.kakao.com',
					        },
					      },*/
					    ],
					  })
					</script>
                    <div class="row mt-6">
                        <div class="col-12">
                            <div class="background-white px-3 mt-6 px-0 py-5 px-lg-5 radius-secondary">
                                
                                <blockquote class="blockquote my-5 ml-lg-6" style="max-width: 700px;">
                                <h5 class="ml-3">현대인에게 가장 무서운 마음의 병 우울증</h5>
                                    <h5 class="fw-500 ml-3 mb-0">혹시 우울증일까? 걱정된다면 BU 에서 전문가에게 상담받으세요!</h5><br>
                                	<div style="text-align:center;" >
                                		<a href="${pageContext.request.contextPath}/index" class="btn btn-outline-primary btn-capsule">심리상담 알아보기</a>
                                	</div>
                                </blockquote>
                            </div>
                        </div>
                    </div>
                    <!--/.row-->
                </div>
               
            </section>
          
            <section class="background-primary text-center py-4">
                <div class="container">
                    <div class="row align-items-center" style="opacity: 0.85">
                        <div class="col-sm-3 text-sm-left"><a href="index.html"><img src="/assets/images/logo-light.png" alt="" /></a></div>
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
        <script src="/assets/lib/jquery/dist/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="/assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="/assets/lib/imagesloaded/imagesloaded.pkgd.min.js"></script>
        <script src="/assets/lib/gsap/src/minified/TweenMax.min.js"></script>
        <script src="/assets/lib/gsap/src/minified/plugins/ScrollToPlugin.min.js"></script>
        <script src="/assets/lib/CustomEase.min.js"></script>
        <script src="/assets/js/config.js"></script>
        <script src="/assets/js/zanimation.js"></script>
        <script src="/assets/js/inertia.js"></script>
        <script src="/assets/js/core.js"></script>
        <script src="/assets/js/main.js"></script>
    </body>
</html>