<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>   
<!DOCTYPE html>
<html lang="UTF-8">
    <head profile="http://www.w3.org/2005/10/profile">
    <link rel="icon" type="image/png" href="http://example.com/myicon.png"> 

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
       	<script src="/assets/lib/jquery/dist/jquery.min.js"></script>
       	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script type="text/javascript">
        
        $(document).ready(function(){
        	//alert(1)
        	 var checkResultId="";		
        		
        	 $("#registerForm").submit(function(){
        		if($("#registerForm :input[name=email]").val().trim()==""){
        			alert("이메일 입력하세요");				
        			return false;
        		}
        	
        		
        	});//submit
        })
        
        	    
        	
        
        </script>
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
            <section class="text-center py">
                <div class="background-holder overlay overlay-1" style="background-image:url(/assets/images/배경화면21.jpg);">
                </div>
                <!--/.background-holder-->
                <div class="container">
                    <div class="row h-100vh align-items-center">
                        <div class="col-md-12 col-lg-8 mx-auto" data-zanim-timeline="{}" data-zanim-trigger="scroll">
                            <div data-zanim='{"delay":0}'><a href="${pageContext.request.contextPath}/"><img src="/assets/images/BUlogo_nobg.png" width="70" alt=""></a></div>
                            <div class="background-white radius-secondary p-4 p-md-5 mt-5" data-zanim='{"delay":0.1}'>
                                <h4 class="text-uppercase fs-0 fs-md-1">Update your account</h4>
								<sec:authorize access="isAuthenticated()">
                                <form class="mt-4 text-left" method="post" action="${pageContext.request.contextPath}/counselor/update" id="registerForm">
                             
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
                                    <div class="row align-items-center">
                                   		
                                   		<div class="col-12 mt-4">커리어
                                       <textarea rows="7" cols="70" name="career" placeholder="커리어 작성해주세요."></textarea><br>
                                        </div>
                                        <div class="col-12 mt-3">
										<h6>전문분야</h6>
										1.<input type="checkbox" name="specialityName" value="우울">우울
										2.<input type="checkbox" name="specialityName" value="불안">불안
										3.<input type="checkbox" name="specialityName" value="섭식장애">섭식장애
										4.<input type="checkbox" name="specialityName" value="청소년">청소년
										5.<input type="checkbox" name="specialityName" value="강박">강박
										6.<input type="checkbox" name="specialityName" value="스트레스">스트레스
										7.<input type="checkbox" name="specialityName" value="직장">직장
										8.<input type="checkbox" name="specialityName" value="진로">진로
										9.<input type="checkbox" name="specialityName" value="중독">중독
										9.<input type="checkbox" name="specialityName" value="감정조절">감정조절

										
									</div>
										<div class="col-12 mt-3">
										<h6>상담사 특징,성격 태그선택</h6>
										1.<input type="checkbox" name="tagName" value="열정">열정
										2.<input type="checkbox" name="tagName" value="상냥함">상냥함
										3.<input type="checkbox" name="tagName" value="공감">공감
										4.<input type="checkbox" name="tagName" value="긍정에너지">긍정에너지
										5.<input type="checkbox" name="tagName" value="경험">경험
										6.<input type="checkbox" name="tagName" value="이해">이해
										7.<input type="checkbox" name="tagName" value="해외생활">해외생활
										8.<input type="checkbox" name="tagName" value="친구">친구
										9.<input type="checkbox" name="tagName" value="따듯함">따듯함

										
									</div>
                                        <div class="col-12 mt-3">
										<h6>대면상담 가격 입력해주세요. (권장가격 10000 ~ 20000)</h6>
										<input type="text"  name = "price0"  ><p>
										<h6>전화상담 가격 입력해주세요. (권장가격 10000 ~ 15000)</h6>
										<input type="text"  name = "price1"  ><p>
										<h6>채팅상담 가격 입력해주세요. (권장가격 5000 ~ 15000)</h6>
										<input type="text"  name = "price2"  ><p>
										<h6>간편텍스트상담 가격 입력해주세요. (권장가격 5000 ~ 15000)</h6>
										<input type="text"  name = "price3"  >
										
										</div>
                                        
                                    </div>
                                    <div class="row align-items-center mt-3">
                                        <div class="col-md-6 mt-3">
                                           
                                        </div>
                                        <div class="col-md-6 mt-3">
                                            <button class="btn btn-primary btn-block" type="submit">Modify</button>
                                            <!-- <button class="btn btn-primary btn-block" type="reset">reset</button> -->
                                        </div>
                                    </div>
                                </form>
                                </sec:authorize>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
        
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