<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(function(){
	
	var sum = 0;
	
	$('input:radio[name^="ques"]').on('click', function() {
	    //alert(1)
		var valueCheck = Number($('input:radio[name^="ques"]:checked').val()); // 체크된 Radio 버튼의 값을 가져옵니다.
	   	//alert(valueCheck);
		sum += valueCheck;
	    $("#test").html(sum);
	    $("#total").val(sum);
	    //$("#aa").val(sum);
	});
	
	 /*$('input:radio[name^="ques"]').click(function(){
		 //alert(1)
		 var valueCheck = Number($('input:radio[name^="ques"]:checked').val());
		 alert(valueCheck)
		 sum += valueCheck;
		 }).change(function(){
		  $('#test').trigger("blur");
		  $('#test').append(sum);
		 });*/
	
	/* $('input:radio[name^="ques"]').click( function(){
		  aa = Number($(this).val());
		  sum += aa
		 }).change(function(){
		  $('#test').append( "before value : "+ aa +"<br>" +"sum value :" +sum +"<br>"+"sum에서 변경되면 이전 값 빼기 : "+(sum-aa)+"<br>");
		 });*/
	
		 
		 
		$("#btn").on("click", function(){
			 var length = $('input:radio[name^="ques"]').length;
			 var len = length/4;
			 if(len != $('input:radio[name^="ques"]:checked').length){
				 alert("선택되지 않은 값이 있습니다.")
				 return false;
			 }
			})
			.prop("onclick", null);
	
	
})
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
            <section>
                <div>
                    <div class="background-holder overlay" style="background-image:url(/assets/images/background-2.jpg);background-position: center bottom;">
                    </div>
                    <!--/.background-holder-->
                    <div class="container">
                        <div class="row pt-6" data-inertia='{"weight":1.5}'>
                            <div class="col-md-12 px-md-0 color-white" data-zanim-timeline="{}" data-zanim-trigger="scroll">
                                <div class="overflow-hidden">
                                    <h1 class="color-white fs-4 fs-md-5 mb-5 zopacity text-center" data-zanim='{"delay":0}'>우울증 검사</h1>
                                    <div class="overflow-hidden text-center" data-zanim-timeline="{}" data-zanim-trigger="scroll">
                                		<h5 data-zanim='{"delay":0.1}'>나의 우울증 지수는 몇 점일까?</h5>
                            		</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--/.row-->
                </div>
                <!--/.container-->
            </section>
            <section class="background-11 text-center">
                <div class="container">
                  <div>
					<table class="table table-hover align-middle">
					  <thead>
					    <tr>
					      <th>질문</th>
					      <th>아니다 또는 거의 그렇지 않다.</th>
					      <th>때때로 그렇다.</th>
					      <th>자주 그렇다.</th>
					      <th>거의 항상 그렇다.</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <td>나는 의욕이 없고, 우울하고 슬프다.</td>
					      	<td><input class="form-check-input" type="radio" value="1" name="ques1"> </td>
							<td><input class="form-check-input"  type="radio" value="2" name="ques1"> </td>
							<td><input class="form-check-input"  type="radio" value="3" name="ques1"> </td>
							<td><input class="form-check-input"  type="radio" value="4" name="ques1"> </td>
					    </tr>
					    <tr>
					      <td>나는 하루 중 아침에 가장 기분이 좋다.</td>
					      	<td><input class="form-check-input" type="radio" value="4" name="ques2"> </td>
							<td><input class="form-check-input"  type="radio" value="3" name="ques2"> </td>
							<td><input class="form-check-input"  type="radio" value="2" name="ques2"> </td>
							<td><input class="form-check-input"  type="radio" value="1" name="ques2"> </td>
					    </tr>
					    <tr>
					      <td>나는 갑자기 울거나, 울고 싶을 때가 있다.</td>
					      	<td><input class="form-check-input" type="radio" value="1" name="ques3"> </td>
							<td><input class="form-check-input"  type="radio" value="2" name="ques3"> </td>
							<td><input class="form-check-input"  type="radio" value="3" name="ques3"> </td>
							<td><input class="form-check-input"  type="radio" value="4" name="ques3"> </td>
					    </tr>
					    <tr>
					      <td >나는 잠을 잘 못자거나 아침에 일찍 깬다.</td>
					      	<td><input class="form-check-input" type="radio" value="1" name="ques4"> </td>
							<td><input class="form-check-input"  type="radio" value="2" name="ques4"> </td>
							<td><input class="form-check-input"  type="radio" value="3" name="ques4"> </td>
							<td><input class="form-check-input"  type="radio" value="4" name="ques4"> </td>
					    </tr>
					    <tr>
					      <td id="ques1">나는 평상시와 같이 잘 먹는다.</td>
					      	<td><input class="form-check-input" type="radio" value="4" name="ques5"> </td>
							<td><input class="form-check-input"  type="radio" value="3" name="ques5"> </td>
							<td><input class="form-check-input"  type="radio" value="2" name="ques5"> </td>
							<td><input class="form-check-input"  type="radio" value="1" name="ques5"> </td>
					    </tr>
					    <tr>
					      <td id="ques1">나는 이성과 이야기하고 함께 있기를 좋아한다.</td>
					      	<td><input class="form-check-input" type="radio" value="4" name="ques6"> </td>
							<td><input class="form-check-input"  type="radio" value="3" name="ques6"> </td>
							<td><input class="form-check-input"  type="radio" value="2" name="ques6"> </td>
							<td><input class="form-check-input"  type="radio" value="1" name="ques6"> </td>
					    </tr>
					    <tr>
					      <td id="ques1">나는 체중이 준 것 같다.</td>
					      	<td><input class="form-check-input" type="radio" value="1" name="ques7"> </td>
							<td><input class="form-check-input"  type="radio" value="2" name="ques7"> </td>
							<td><input class="form-check-input"  type="radio" value="3" name="ques7"> </td>
							<td><input class="form-check-input"  type="radio" value="4" name="ques7"> </td>
					    </tr>
					    <tr>
					      <td id="ques1">나는 변비가 있다.</td>
					      	<td><input class="form-check-input" type="radio" value="1" name="ques8"> </td>
							<td><input class="form-check-input"  type="radio" value="2" name="ques8"> </td>
							<td><input class="form-check-input"  type="radio" value="3" name="ques8"> </td>
							<td><input class="form-check-input"  type="radio" value="4" name="ques8"> </td>
					    </tr>
					    <tr>
					      <td id="ques1">심장이 평상시보다 빨리 뛰거나 두근거린다.</td>
					      	<td><input class="form-check-input" type="radio" value="1" name="ques9"> </td>
							<td><input class="form-check-input"  type="radio" value="2" name="ques9"> </td>
							<td><input class="form-check-input"  type="radio" value="3" name="ques9"> </td>
							<td><input class="form-check-input"  type="radio" value="4" name="ques9"> </td>
					    </tr>
					    <tr>
					      <td id="ques1">나는 별 이유없이 몸이 나른하고 피곤하다.</td>
					      	<td><input class="form-check-input" type="radio" value="1" name="ques10"> </td>
							<td><input class="form-check-input"  type="radio" value="2" name="ques10"> </td>
							<td><input class="form-check-input"  type="radio" value="3" name="ques10"> </td>
							<td><input class="form-check-input"  type="radio" value="4" name="ques10"> </td>
					    </tr>
					    <tr>
					      <td id="ques1">내 정신은 이전처럼 맑다.</td>
					      	<td><input class="form-check-input" type="radio" value="4" name="ques11"> </td>
							<td><input class="form-check-input"  type="radio" value="3" name="ques11"> </td>
							<td><input class="form-check-input"  type="radio" value="2" name="ques11"> </td>
							<td><input class="form-check-input"  type="radio" value="1" name="ques11"> </td>
					    </tr>
					    <tr>
					      <td id="ques1">나는 어떤 일이든지 전처럼 쉽게 처리한다.</td>
					      	<td><input class="form-check-input" type="radio" value="4" name="ques12"> </td>
							<td><input class="form-check-input"  type="radio" value="3" name="ques12"> </td>
							<td><input class="form-check-input"  type="radio" value="2" name="ques12"> </td>
							<td><input class="form-check-input"  type="radio" value="1" name="ques12"> </td>
					    </tr>
					    <tr>
					      <td id="ques1">나는 안절부절해서 가만히 있을 수가 없다.</td>
					      	<td><input class="form-check-input" type="radio" value="1" name="ques13"> </td>
							<td><input class="form-check-input"  type="radio" value="2" name="ques13"> </td>
							<td><input class="form-check-input"  type="radio" value="3" name="ques13"> </td>
							<td><input class="form-check-input"  type="radio" value="4" name="ques13"> </td>
					    </tr>
					    <tr>
					      <td id="ques1">나의 장래는 희망적이라고 느낀다.</td>
					      	<td><input class="form-check-input" type="radio" value="4" name="ques14"> </td>
							<td><input class="form-check-input"  type="radio" value="3" name="ques14"> </td>
							<td><input class="form-check-input"  type="radio" value="2" name="ques14"> </td>
							<td><input class="form-check-input"  type="radio" value="1" name="ques14"> </td>
					    </tr>
					    <tr>
					      <td id="ques1">나는 평소보다 짜증이 많아졌다.</td>
					      	<td><input class="form-check-input" type="radio" value="1" name="ques15"> </td>
							<td><input class="form-check-input"  type="radio" value="2" name="ques15"> </td>
							<td><input class="form-check-input"  type="radio" value="3" name="ques15"> </td>
							<td><input class="form-check-input"  type="radio" value="4" name="ques15"> </td>
					    </tr>
					    <tr>
					      <td id="ques1">나는 매사에 결단력이 있다고 생각한다.</td>
					      	<td><input class="form-check-input" type="radio" value="4" name="ques16"> </td>
							<td><input class="form-check-input"  type="radio" value="3" name="ques16"> </td>
							<td><input class="form-check-input"  type="radio" value="2" name="ques16"> </td>
							<td><input class="form-check-input"  type="radio" value="1" name="ques16"> </td>
					    </tr>
					    <tr>
					      <td id="ques1">나는 유익하고 필요한 사람이라고 생각한다.</td>
					      	<td><input class="form-check-input" type="radio" value="4" name="ques17"> </td>
							<td><input class="form-check-input"  type="radio" value="3" name="ques17"> </td>
							<td><input class="form-check-input"  type="radio" value="2" name="ques17"> </td>
							<td><input class="form-check-input"  type="radio" value="1" name="ques17"> </td>
					    </tr>
					    <tr>
					      <td id="ques1">나는 내 삶이 충만하고 의의가 있다고 느낀다.</td>
					      	<td><input class="form-check-input" type="radio" value="4" name="ques18"> </td>
							<td><input class="form-check-input"  type="radio" value="3" name="ques18"> </td>
							<td><input class="form-check-input"  type="radio" value="2" name="ques18"> </td>
							<td><input class="form-check-input"  type="radio" value="1" name="ques18"> </td>
					    </tr>
					    <tr>
					      <td id="ques1">내가 죽어야 남들이 편할 것 같다.</td>
					      	<td><input class="form-check-input" type="radio" value="1" name="ques19"> </td>
							<td><input class="form-check-input"  type="radio" value="2" name="ques19"> </td>
							<td><input class="form-check-input"  type="radio" value="3" name="ques19"> </td>
							<td><input class="form-check-input"  type="radio" value="4" name="ques19"> </td>
					    </tr>
					    <tr>
					      <td id="ques1">나는 전과 같이 즐겁게 일한다.</td>
					      	<td><input class="form-check-input" type="radio" value="4" name="ques20"> </td>
							<td><input class="form-check-input"  type="radio" value="3" name="ques20"> </td>
							<td><input class="form-check-input"  type="radio" value="2" name="ques20"> </td>
							<td><input class="form-check-input"  type="radio" value="1" name="ques20"> </td>
					    </tr>
					    <tr>
					      <td id="ques1">나는 평소보다 짜증이 많아졌다.</td>
					      	<td><input class="form-check-input" type="radio" value="1" name="ques21"> </td>
							<td><input class="form-check-input"  type="radio" value="2" name="ques21"> </td>
							<td><input class="form-check-input"  type="radio" value="3" name="ques21"> </td>
							<td><input class="form-check-input"  type="radio" value="4" name="ques21"> </td>
					    </tr>
					    
					    
					  </tbody>
					</table>
					<div id="test"></div>
					<form name="inForm" method="post" id="inForm" action="${pageContext.request.contextPath}/psy/depInsert">
					<input type="hidden" name="testName" value="0">
					<input type="text" name="total" id="total" value="">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
					<input type="submit" id="btn" class="btn btn-outline-primary" value="결과보기">
					</form>
					
					</div>  
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