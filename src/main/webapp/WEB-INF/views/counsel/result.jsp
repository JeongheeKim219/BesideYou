<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BU - Beside U</title>
        <!--  -->
        <!--    Favicons-->
        <!--    =============================================-->
        <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assets/images/BUlogo_nobg2.png">
        <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/assets/images/BUlogo_nobg2.png">
        <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assets/images/BUlogo_nobg2.png">
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/BUlogo_nobg2.png">
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
        <!-- Main stylesheet and color file-->
        <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/custom.css" rel="stylesheet">
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
            <section class="text-center py-0">
                <div class="background-holder overlay overlay-elixir" style="background-image:url(${pageContext.request.contextPath}/assets/images/background-14.jpg);">
                </div>
                <!--/.background-holder-->
                <div class="container">
                    <div class="row h-full align-items-center color-white">
                        <div class="col" data-zanim-timeline="{}" data-zanim-trigger="scroll"><a href="index.html" data-zanim='{"delay":0}'><img src="${pageContext.request.contextPath}/assets/images/BUlogo_nobg2.png" alt="" data-zanim='{"delay":0.1}' style="width: 300px; height: 300px"/></a>
                            <h5 class="text-uppercase mt-5 ls color-white fs-0 fs-md-1" data-zanim='{"delay":0.2}'>${message}</h5>
                            <div data-zanim='{"delay":0.4}'><a class="btn btn-lg btn-info btn-capsule mt-4" href="#">예약내역 확인하기</a></div>
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
        <script src="${pageContext.request.contextPath}/assets/js/core.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    </body>
</html>