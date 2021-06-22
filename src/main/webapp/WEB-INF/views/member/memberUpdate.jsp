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
        		if($("#registerForm :input[name=password]").val().trim()==""){
        			alert("패스워드 입력하세요");				
        			return false;
        		}
        			
        		
        		if($("#registerForm :input[name=alias]").val().trim()==""){
        			alert("닉네임를 입력하세요");				
        			return false;
        		}	
        		if($("#registerForm :input[name=phone]").val().trim()==""){
        			alert("핸드폰 번호를 입력하세요");				
        			return false;
        		}	
        		
        		
        		
        	});//submit
        	
        	//수정페이지 들어가기 전 인증절차
        	/* var goodURL  = "#"  
        	    alert("패스워드를 입력하셔야 합니다.")

        	var password =  prompt("패스워드 입력","")

        	    if (password == null)  {
        	        alert("출입금지")
        	        location  = "${pageContext.request.contextPath}/"       
        	    }
        	    else  {
        	        var  combo =  password
        	        var  total =  combo.toLowerCase()

        	    if  (total == "1234")  {                
        	        
        	        location  =  goodURL
        	    }
        	    else  {
        	        alert("출입금지")
        	        location  = "${pageContext.request.contextPath}/" 
        	    }
        	}
        	 */
    	
        	
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
                <div class="background-holder overlay overlay-1" style="background-image:url(/assets/images/배경화면21.jpg); padding-bottom: 0px;padding-top: 0px;height: 1000;height: 1500px;">
                </div>
                <!--/.background-holder-->
                <div class="container">
                    <div class="row h-100vh align-items-center">
                        <div class="col-md-12 col-lg-8 mx-auto" data-zanim-timeline="{}" data-zanim-trigger="scroll">
                            <div data-zanim='{"delay":0}'><a href="${pageContext.request.contextPath}/"><img src="/assets/images/BUlogo_nobg5.png" width="70" alt=""></a></div>
                            <div class="background-white radius-secondary p-4 p-md-5 mt-5" data-zanim='{"delay":0.1}'>
                                <h4 class="text-uppercase fs-0 fs-md-1">Update your account</h4>
                                <c:if test="${not empty requestScope.errorMessage}">
									<span style="color:red">${requestScope.errorMessage}</span>
								</c:if>
								<sec:authorize access="isAuthenticated()">
                                <form class="mt-4 text-left" method="post" action="${pageContext.request.contextPath}/member/update" id="registerForm">
                             
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
                                    <div class="row align-items-center">
                                   		
                                   		<div class="col-12 mt-4">번호
                                        <input class="form-control" type="text" name="memberCode" value="<sec:authentication property="principal.memberCode"/>" readonly>
                                        </div>
                                        <div class="col-12 mt-4">아이디
                                        <input class="form-control" type="text" name="id" value="<sec:authentication property="principal.id"/>" readonly>
                                        </div>
                                        <div class="col-12 mt-4">패스워드
                                            <input class="form-control" type="password" placeholder="password" name = "password" aria-label="Text input with dropdown button">
                                        </div>
                                        <div class="col-12 mt-4">이름
                                        <input class="form-control" type="text" name="name" value="<sec:authentication property="principal.name"/>" readonly>
                                        </div>
                                        <div class="col-12 mt-4">이메일
                                            <input class="form-control" type="text" placeholder="Email Address" name = "email" aria-label="Text input with dropdown button">
                                        </div>
                                        <div class="col-12 mt-4">주소
                                        <input class="form-control" type="text" name="memberAddr" value="<sec:authentication property="principal.memberAddr"/>" readonly>
                                        </div>

                                        <div class="col-12 mt-4">닉네임
                                            <input class="form-control" type="text" placeholder="Alias(닉네임)" name = "alias"aria-label="Text input with dropdown button">
                                        </div>
                                        <div class="col-12 mt-4">Phone
                                            <input class="form-control" type="text" placeholder="Phone" name = "phone"aria-label="Text input with dropdown button">
                                        </div>
                                        <div class="col-12 mt-4">생년월일
                                        <input class="form-control" type="text" name="beforeDateOfBirth" value="<sec:authentication property="principal.dateOfBirth"/>" readonly>
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