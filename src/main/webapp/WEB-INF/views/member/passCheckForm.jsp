<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
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
        <script type="text/javascript">
	function logout() {
		document.getElementById("logoutForm").submit();
	}
</script>
    </head>
    <body data-spy="scroll" data-target=".inner-link" data-offset="60">
     <%--  ${errorMessage} = ${errorMessage} --%>
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
            <section class="text-center py-0">
                <div class="background-holder overlay overlay-2" style="background-image:url(/assets/images/배경화면21.jpg);">
                </div>
                <!--/.background-holder-->
                <div class="container">
                    <div class="row h-full align-items-center">
                        <div class="col-md-8 col-lg-5 mx-auto" data-zanim-timeline="{}" data-zanim-trigger="scroll">
                            <div data-zanim='{"delay":0}'><a href="${pageContext.request.contextPath}/"><img src="/assets/images/BUlogo_nobg5.png" width="70" alt="" /></a></div>
                            <div class="background-white radius-secondary p-4 p-md-5 mt-5" data-zanim='{"delay":0.1}'>
                                <h4 class="text-uppercase fs-0 fs-md-1">비밀번호 찾기</h4>
                               <c:if test="${not empty requestScope.errorMessage}">
									<span style="color:red">${requestScope.errorMessage}</span>
								</c:if>
                                
                                <form class="text-left mt-4" method="post" action="${pageContext.request.contextPath}/member/passCheck">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>


                                    <div class="row align-items-center">
                                    <div class="col-12 mt-2 mt-sm-4">
                                            <div class="input-group">
                                                <div class="input-group-addon background-11 fs-2"><span class="color-1 fs-1 icon-Font-Window"></span></div>
                                                <input class="form-control" type="text" name = "id"placeholder="id" aria-label="Text input with dropdown button" />
                                            </div>
                                        </div>
                                        <div class="col-12 mt-2 mt-sm-4">
                                            <div class="input-group">
                                                <div class="input-group-addon background-11 fs-2"><span class="color-1 fs-1 icon-Cookie-Man"></span></div>
                                                <input class="form-control" type="text" name = "name"placeholder="name" aria-label="Text input with dropdown button" />
                                            </div>
                                        </div>
                                        <div class="col-12 mt-2 mt-sm-4">
                                            <div class="input-group">
                                                <div class="input-group-addon background-11 fs-2"><span class="color-1 fs-1 icon-Gentleman"></span></div>
                                                <input class="form-control" type="date" name="beforeDateOfBirth" placeholder="생년월일" aria-label="Text input with dropdown button" />
                                            </div>
                                        </div>
                                       
                                    </div>
                                    <div class="row align-items-center mt-3">
                                        <div class="col-6">
                                            <!-- <label class="form-check-label">
                                                <input class="form-check-input" type="checkbox" /><span class="color-7">Remember Me</span>
                                            </label> -->
                                        </div>
                                  
                                        <div class="col-12 mt-2 mt-sm-3">
                                  
                                      
                                            <button class="btn btn-primary btn-block" type="submit"> 비밀번호 찾기</button>
                                        </div>
                                        
                                    </div>
                                </form>
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