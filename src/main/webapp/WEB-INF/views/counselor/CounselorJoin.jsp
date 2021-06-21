<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="UTF-8">
    <head profile="http://www.w3.org/2005/10/profile">
    <link rel="icon" type="image/png" href="http://example.com/myicon.png"> 

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
       	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ee2a08e1e6666ba0c1489f7bcaf6d75a&libraries=services"></script>
       	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
       	<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
        <script type="text/javascript">
        
        $(document).ready(function(){
        		
        	// var checkResultId="";		
        		$("#sub").click(function(){	
        		if($("#registerForm :input[type=file]").val().trim()==""){
        			alert("사진을 첨부해주세요");				
        			return false;
        		}
        		if($("#registerForm :input[name=career]").val().trim()==""){
        			alert("커리어를 입력하세요");				
        			return false;
        		}
        		/* if($("#registerForm :select[name=degree]").val().trim()==""){
        			alert("학위를 입력하세요");				
        			return false;
        		} */
        		 if($("#registerForm :input[id=ade]").val().trim()==""){
        			alert("자격증 입력하세요");				
        			return false;
        		} 
        		 if($("#registerForm :input[name=firstAddr]").val().trim()==""){
        			alert("주소를 입력하세요");				
        			return false;
        		}	 
        		var addr = "";
        		addr += $("#sample6_address").val();
        		addr += " ";
        		addr += $("#sample6_detailAddress").val();
        		$("input[name='counselorAddr']").val(addr);
        		
        		var geocoder = new kakao.maps.services.Geocoder();
       			var gotY;
       			var gotX;
        		geocoder.addressSearch($("#sample6_address").val(), function(result, status) {
        			    // 정상적으로 검색이 완료됐으면 
        			     if (status === kakao.maps.services.Status.OK) {
        			        gotY = result[0].y;
        			        gotX = result[0].x;
        			       }
   			    $("input[name='lat']").val(gotY); //lat = 위도
  			    $("input[name='longi']").val(gotX); //logni = 경도
        		$("#registerForm").submit();
        			});
        	});//submit
        	      	
        }) 
        function sample6_execDaumPostcode() {
        	        new daum.Postcode({
        	            oncomplete: function(data) {
        	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

        	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
        	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        	                var addr = ''; // 주소 변수
        	                var extraAddr = ''; // 참고항목 변수

        	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
        	                    addr = data.roadAddress;
        	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
        	                    addr = data.jibunAddress;
        	                }

        	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
        	                if(data.userSelectedType === 'R'){
        	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
        	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
        	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
        	                        extraAddr += data.bname;
        	                    }
        	                    // 건물명이 있고, 공동주택일 경우 추가한다.
        	                    if(data.buildingName !== '' && data.apartment === 'Y'){
        	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
        	                    }
        	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
        	                    if(extraAddr !== ''){
        	                        extraAddr = ' (' + extraAddr + ')';
        	                    }
        	                    // 조합된 참고항목을 해당 필드에 넣는다.
        	                    document.getElementById("sample6_extraAddress").value = extraAddr;
        	                
        	                } else {
        	                    document.getElementById("sample6_extraAddress").value = '';
        	                }

        	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
        	                document.getElementById('sample6_postcode').value = data.zonecode;
        	                document.getElementById("sample6_address").value = addr;
        	                // 커서를 상세주소 필드로 이동한다.
        	                document.getElementById("sample6_detailAddress").focus();
        	            }
        	        }).open();
        	    }
        	
        
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
                            <div data-zanim='{"delay":0}'><a href="${pageContext.request.contextPath}/"><img src="/assets/images/BUlogo_nobg.png" width="70" alt=""></a></div>
                            <div class="background-white radius-secondary p-4 p-md-5 mt-5" data-zanim='{"delay":0.1}'>
                                <h4 class="text-uppercase fs-0 fs-md-1">Create Counselor</h4>
                                <c:if test="${not empty requestScope.errorMessage}">
									<span style="color:red">${requestScope.errorMessage}</span>
								</c:if>
                                <form class="mt-4 text-left" method="post" action="${pageContext.request.contextPath}/counselor/join" id="registerForm" enctype="multipart/form-data">
                             
								   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
								   
                                    <div class="row align-items-center">
                                   		<div class="col-12 mt-4">
                                            프로필사진<p><input  type="file" placeholder="상담사사진"  name = "file" aria-label="Text input with dropdown button"> <br>  <br>  
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
                                       		<textarea rows="7" cols="70" name="career" placeholder="커리어 작성해주세요."></textarea><br>
                                        	<select name = "degree">
                                            	<option selected>--학사 선택--
                                            	<option value = "석사">석사
                                            	<option value = "박사">박사
                                            </select>
                                            <br>
                                            <br>
                                            자격증<br><input type="file" placeholder="자격증"  id = "ade" name = "file" aria-label="Text input with dropdown button">
                                            
                                            <div class="col-14 mt-1">
                                       			 <input type="text" id="sample6_postcode" name = "postcode" placeholder="우편번호" readonly="readonly">
												<input class="btn btn-secondary" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
											</div>
												<input class="form-control" type="text" id="sample6_address" name = "firstAddr" placeholder="주소" readonly="readonly">
												<input class="form-control" type="text" id="sample6_detailAddress" name = "detailAddress" placeholder="상세주소">
												<input type="hidden" name = "counselorAddr">
												<input type="hidden" name = "lat">
												<input type="hidden" name = "longi">
												<input  class="form-control" type="text" id="sample6_extraAddress" name = "extraAddress" placeholder="참고항목" readonly="readonly">
                                        </div>
                                     <div class="col-12 mt-3">
										<h6>전문분야</h6>
										1.<input type="checkbox" name="specialityName" value="우울">우울&nbsp;
										2.<input type="checkbox" name="specialityName" value="불안">불안&nbsp;
										3.<input type="checkbox" name="specialityName" value="섭식장애">섭식장애&nbsp;
										4.<input type="checkbox" name="specialityName" value="청소년">청소년&nbsp;
										5.<input type="checkbox" name="specialityName" value="강박">강박&nbsp;
									</div>	
									 <div class="col-12 mt-3">
										6.<input type="checkbox" name="specialityName" value="스트레스">스트레스&nbsp;
										7.<input type="checkbox" name="specialityName" value="직장">직장&nbsp;
										8.<input type="checkbox" name="specialityName" value="진로">진로&nbsp;
										9.<input type="checkbox" name="specialityName" value="중독">중독&nbsp;
										9.<input type="checkbox" name="specialityName" value="감정조절">감정조절&nbsp;

										
									</div>

									<div class="col-12 mt-3">
										<h6>상담사 특징,성격 태그선택</h6>
										1.<input type="checkbox" name="tagName" value="열정">열정&nbsp;
										2.<input type="checkbox" name="tagName" value="상냥함">상냥함&nbsp;
										3.<input type="checkbox" name="tagName" value="공감">공감&nbsp;
										4.<input type="checkbox" name="tagName" value="긍정에너지">긍정에너지&nbsp;
										5.<input type="checkbox" name="tagName" value="경험">경험&nbsp;
								</div>
								<div class="col-12 mt-3">
										6.<input type="checkbox" name="tagName" value="이해">이해&nbsp;
										7.<input type="checkbox" name="tagName" value="해외생활">해외생활&nbsp;
										8.<input type="checkbox" name="tagName" value="친구">친구&nbsp;
										9.<input type="checkbox" name="tagName" value="따듯함">따듯함&nbsp;
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
                                            <input class="btn btn-success" style = "float: right;" width="50" type="button" value="Create" id="sub"/>
                                            <!-- <button class="btn btn-primary btn-block" type="reset">reset</button> -->
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