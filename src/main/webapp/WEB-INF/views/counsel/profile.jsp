<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
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
	href="${pageContext.request.contextPath}/assets/lib/remodal/dist/remodal.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/lib/remodal/dist/remodal-default-theme.css"
	rel="stylesheet">
<!-- Main stylesheet and color file-->
<link href="${pageContext.request.contextPath}/assets/css/style.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/custom.css"
	rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function logout() {
		document.getElementById("logoutForm").submit();
	}
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
		<section class="background-11" style="padding-bottom: 10px !important">
			<div class="container">
				<div class="row text-center">
					<div class="col">
						<h3 class="fs-2 fs-md-3 fw-600">상담사 정보</h3>
						<hr class="short"
							data-zanim='{"from":{"opacity":0,"width":0},"to":{"opacity":1,"width":"4.20873rem"},"duration":0.8}'
							data-zanim-trigger="scroll">
					</div>
				</div>
				<div class="row no-gutters pos-relative mt-6">
					<div class="elixir-caret d-none d-lg-block"></div>
					<div class="col-lg-6 py-3 py-lg-0 mb-0" style="min-height: 400px;">
						<div
							class="background-holder radius-tl-secondary radius-tr-secondary radius-tr-lg-0"
							style="background-image:url(${pageContext.request.contextPath}/assets/counselor/${counselor.picture});">
						</div>
						<!--/.background-holder-->
					</div>
					<div
						class="col-lg-6 px-lg-5 py-lg-6 p-4 my-lg-0 background-white radius-bl-secondary radius-bl-lg-0 radius-br-secondary radius-br-lg-0 radius-tr-lg-secondary">
						<div class="d-flex align-items-center h-100">
								<table style="width: 100%">
									<tr>
										<td style="width: 200px">
											<h5 data-zanim='{"delay":0}'>상담사 이름</h5>
										</td>
										<td>
											<h5 data-zanim='{"delay":0}' style="color: #3680B3">${counselor.member.name}</h5>
										</td>
									</tr>
									<tr>
										<td colspan="2" style="height: 20px"></td>
									</tr>
									<tr>
										<td>
											<h5 data-zanim='{"delay":0}'>상담사 학위</h5>
										</td>
										<td>
											<h5 data-zanim='{"delay":0}' style="color: #3680B3">${counselor.degree}</h5>
										</td>
									</tr>
									<tr>
										<td colspan="2" style="height: 20px"></td>
									</tr>
									<tr>
										<td colspan="2">
											<h5 data-zanim='{"delay":0}'>상담사 전문분야</h5>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<h5 data-zanim='{"delay":0}' style="color: #3680B3">
												<c:forEach	items="${speList}" var="spe" >
													${spe.specialityName}
												</c:forEach>
											</h5>
										</td>
									</tr>
									<tr>
										<td colspan="2" style="height: 20px"></td>
									</tr>
									<tr>
										<td colspan="2">
											<h5 data-zanim='{"delay":0}'>상담사 태그</h5>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<h5 data-zanim='{"delay":0}' style="color: #3680B3">
												<c:forEach	items="${tagList}" var="tag" >
													${tag.tagName}
												</c:forEach>
											</h5>
										</td>
									</tr>
									<tr>
										<td colspan="2" style="height: 20px"></td>
									</tr>
									<tr>
										<td colspan="2">
											<h5 data-zanim='{"delay":0}'>상담사 경력</h5>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<h5 data-zanim='{"delay":0}' style="color: #3680B3">
												${counselor.career}
											</h5>
										</td>
									</tr>
								</table>
						</div>
					</div>
				</div>
				<div class="row no-gutters pos-relative mt-4 mt-lg-0">
					<div class="elixir-caret d-none d-lg-block"></div>
					<div class="col-lg-6 py-3 py-lg-0 mb-0 order-lg-2"
						style="min-height: 400px;">
						<div id="map" style="width: 100%; height: 400px;"></div>
						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ee2a08e1e6666ba0c1489f7bcaf6d75a"></script>
						<script type="text/javascript">
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							mapOption = {
								center : new kakao.maps.LatLng(${counselor.latitude},
										${counselor.longitude}), // 지도의 중심좌표
								level : 3
							// 지도의 확대 레벨
							};

							var map = new kakao.maps.Map(mapContainer,
									mapOption); // 지도를 생성합니다

							//마커가 표시될 위치입니다 
							var markerPosition = new kakao.maps.LatLng(
									${counselor.latitude}, ${counselor.longitude});

							//마커를 생성합니다
							var marker = new kakao.maps.Marker({
								position : markerPosition
							});

							//마커가 지도 위에 표시되도록 설정합니다
							marker.setMap(map);
						</script>
						<!--/.background-holder-->
					</div>
					<div
						class="col-lg-6 px-lg-5 py-lg-6 p-4 my-lg-0 background-white radius-bl-secondary radius-bl-lg-0 radius-br-secondary radius-br-lg-0">
						<div class="d-flex align-items-center h-100">
								<table style="width: 100%">
									<tr>
										<td colspan="2">
											<h5 data-zanim='{"delay":0}'>상담센터 주소</h5>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<h5 data-zanim='{"delay":0}' style="color: #3680B3">
												${counselor.counselorAddr}
											</h5>
										</td>
									</tr>
									<tr>
										<td colspan="2" style="height: 20px"></td>
									</tr>
									<tr>
										<td>
											<a href="${pageContext.request.contextPath}/counsel/apply?counselorCode=${counselor.counselorCode}&counselCategory=0" class="btn btn-outline-primary btn-capsule" style="width: 180px">대면상담 신청</a>				
										</td>
										<td>
											<a href="${pageContext.request.contextPath}/counsel/apply?counselorCode=${counselor.counselorCode}&counselCategory=1" class="btn btn-outline-primary btn-capsule" style="width: 180px">전화상담 신청</a>				
										</td>
									</tr>
									<tr>
										<td colspan="2" style="height: 20px"></td>
									</tr>
									<tr>
										<td>
											<a href="${pageContext.request.contextPath}/counsel/apply?counselorCode=${counselor.counselorCode}&counselCategory=2" class="btn btn-outline-primary btn-capsule" style="width: 180px">채팅상담 신청</a>				
										</td>
										<td>
											<a href="${pageContext.request.contextPath}/counsel/apply?counselorCode=${counselor.counselorCode}&counselCategory=3" class="btn btn-outline-primary btn-capsule" style="width: 180px">텍스트상담 신청</a>				
										</td>
									</tr>
								</table>
						</div>
					</div>
				</div>
				<!--/.row-->
			</div>
			<!--/.container-->
		</section>
	<form name="requestForm" method="post" id="requestForm">
	<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
		<input type="hidden" id="memberCode" name="memberCode" value="<sec:authentication property="principal.memberCode" />" />
		<input type="hidden" id="reviewCode" name="reviewCode" value=""/>
		<input type="hidden" id="reviewContent" name="reviewContent" value=""/>
		<input type="hidden" id="counselor" name="counselor" value=""/>
		<input type="hidden" id="counsel" name="counsel" value=""/>
		<input type="hidden" id="reportOption" name="reportOption" value=""/>
		<input type="hidden" id="star" name="star" value=""/>
		
		<section class="background-11" style="padding-top: 10px !important">
			<div class="container">
				<div class="row mt-6" style="margin-top: 10px !important">
					<div class="col"></div>
					<div class="col-12">
						<div
							class="background-white px-3 mt-6 px-0 py-5 px-lg-5 radius-secondary"
							style="margin-top: 20px !important">
							<h3 class="text-center fs-2 fs-md-3">상담사 리뷰</h3>
							<hr class="short"
								data-zanim='{"from":{"opacity":0,"width":0},"to":{"opacity":1,"width":"4.20873rem"},"duration":0.8}'
								data-zanim-trigger="scroll" />
								<div align="center">
									<c:choose>
										<c:when test="${empty review}">
											<div class="panel panel-default" style="width: 600px;">
												<!-- Table -->
												<table class="table" align="center">
													<tr>
														<td colspan="4">
															<p align="center"><b><span style="font-size: 12px;">등록된 리뷰가 없습니다.</span></b></p>
														</td>
													</tr>
													<tr></tr>
												</table>
											</div>
										</c:when>
									
									
									<c:otherwise>
										<c:forEach items="${review}" var="review" varStatus="num">
											<div class="panel panel-default" style="width: 1000px;">
												<!-- Default panel contents -->
												<div class="panel-heading" >리뷰 번호 : ${review.reviewCode}</div>
												
												<table class="table">
													<tr >
														<td>회원 번호 : ${review.member.memberCode}</td>
														<td>상담번호 : ${review.counsel.counselCode}</td>
														<td>별점 : ${review.star}</td>
														<td>리뷰날짜: ${review.reviewDate}</td>
														<td>상담사 번호 :${review.counselor.counselorCode}</td>
													</tr>
													<tr>
														<td colspan="5">${review.reviewContent}</td>
													</tr>
													<tr>
														<td style="border-top: hidden;" colspan="5" align="right">
															<input type="button" id="btn_${num.index}" name="btn" value="신고하기" > 
															<sec:authorize access="isAuthenticated()">
															<input type="button" id="reviewDelete_${num.index}" name="reviewDelete" value="리뷰삭제"> 
															<%-- <input type="button" id="reviewChange_${num.index}" name=reviewChange value="리뷰수정">  --%>
															</sec:authorize>
															<input type="hidden" id="reviewCode_${num.index}" value="${review.reviewCode}">
															<input type="hidden" id="reviewContent_${num.index}" value="${review.reviewContent}">
															<input type="hidden" id="counselor_${num.index}" value="${review.counselor.counselorCode}">
															<input type="hidden" id="counsel_${num.index}" value="${review.counsel.counselCode}">
															<input type="hidden" id="memberCode_${num.index}" value="${review.member.memberCode}">
														</td>
													</tr>
												</table>
											</div>
										</c:forEach>
												
									</c:otherwise>
								</c:choose>
								
								</div>
							</div>
					</div>
					<!--/.row-->
				</div>
			<!--/.container-->
		</section>
	</form>
	
	<!-- 모달창 시작 -->
	<div class="modal" id="modal1">
		<h5 align="center">신고</h2>
			
			<table border="1" style="align-content: center;">
				<tr>
					<td height="20" colspan="2" bgcolor="#DEDCDC">
						<p align="center">
							<font color="black" size="3"><b>신고내용</b></font>
						</p>
					</td>
				</tr>
				
				<tr>
					<td width="150" height="20" style="vertical-align: center;">
					신고자
					</td>
					<td width="150" height="20" align="left"><b><span style="font-size: 9pt; margin: 2px;">
								<input id="tgrmember" size="30" value="" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;">
						</span></b></td>
				</tr>
				
				<tr>
					<td width="150" height="20" style="vertical-align: center; margin: 2px;">
						리뷰번호
					</td>
					<td width="150" height="20"><b><span style="font-size: 9pt;">
						<input type="text" id="tgReviewNo" size="30" value="" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;">
					</span></b></td>
				</tr>
				
				<tr>
					<td width="150" height="20" style="vertical-align: center; margin: 2px;">
					신고사유
						
					</td>
					<td width="150" height="20"><b><span style="font-size: 9pt;">
								<select name="srcReportOption" id="srcReportOption" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;">
									<option value="">신고사유 선택</option>
									<option value="스팸홍보도배글">스팸홍보도배글</option>
									<option value="음란물">음란물</option>
									<option value="불법정보를 포함하고 있습니다">불법정보를 포함하고 있습니다</option>
									<option value="차별적표현">차별적표현</option>
									<option value="개인정보 노출">개인정보 노출</option>
									<option value="불쾌한 표현">불쾌한 표현</option>
								</select>
						</span></b></td>
				</tr>
				
				<tr>
					<td width="150" height="20" colspan="2" align="center">
						<b>
						<span style="font-size: 9pt;">
						<input type="button" id="reportBtn" value=신고등록 >
						<input type="button" id="backBtn" value="돌아가기">
						</span>
						</b>
					</td>
				</tr>
			</table>
		</div>
		
		<div class="modal" id="modal2">
			<h5 align="center" >리뷰수정</h5>
			<table border="1">
				<tr>
					<td height="20" colspan="2" bgcolor="#DEDCDC">
						<p align="center">
							<font color="black" size="3"><b>리뷰 수정하기</b></font>
						</p>
					</td>
				</tr>
				
				<tr>
					<td width="150" height="20" style="vertical-align: center;">
					작성자
					</td>
					<td width="150" height="20"><b><span style="font-size: 9pt; margin: 2px;">
						<input id="m2Member" size="30" value="" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;">
						</span></b></td>
				</tr>
				
				<tr>
					<td width="150" height="20" style="vertical-align: center; margin: 2px;">
						리뷰번호
					</td>
					<td width="150" height="20"><b><span style="font-size: 9pt;">
						<input type="text" id="tgreviewCode" size="30" value="" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;">
					</span></b></td>
				</tr>
				
				<tr>
					<td width="150" height="20">
						<p align="left">
							<b><span style="vertical-align: center;  margin: 2px;">평점</span></b>
						</p>
					</td>
					<td width="150" height="20"><b><span style="font-size: 9pt;">
							<select name="srcStar" id="srcStar">
								<option value="1.0">★</option>
								<option value="2.0">★★</option>
								<option value="3.0">★★★</option>
								<option value="4.0">★★★★</option>
								<option value="5.0">★★★★★</option>
							</select>
					</span></b></td>
				</tr>
				
				<tr>
					<td width="150" height="20" style="vertical-align: center; margin: 2px;" colspan="2">
					리뷰 내용
					</td>
				</tr>
				
				<tr>
					<td width="150" height="20" colspan="2"><b><span style="font-size: 9pt; margin: 2px;">
						<!-- <textarea cols="55" rows="5" id="tgreviewContent" name="reviewContent"></textarea> -->
						<textarea cols="55" rows="5" id="tgreviewContent" name="reviewContent22"></textarea>
					</span></b></td>
				</tr>
				
				<tr>
					<td width="150" height="20" colspan="2" align="center">
						<b>
						<span style="font-size: 9pt;">
						<input type="button" id="reviewBtn2" value=리뷰수정 >
						<input type="button" id="backBtn2" value="돌아가기">
						</span>
						</b>
					</td>
				</tr>
			</table>
		</div>
		<!-- 모달 끝 -->
		
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
		src="${pageContext.request.contextPath}/assets/lib/remodal/dist/remodal.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/core.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	
	<!-- 모달 제어 스크립트 -->
	<style>
		#modal1{position: absolute; width: 23%; height: 8%; background: rgba(236,255,255,255); top:58%; left:35%; padding-left:2%; padding-top:1%; display: none;}
		#modal2{position: absolute; width: 23%; height: 14%; background: rgba(236,255,255,255); top:58%; left:35%; padding-left:2%; padding-top:1%; display: none;}
		
	</style>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("input[name='btn']").click(function() {
				var s = $("input[name='btn']").index(this);
				$('#reviewCode').val($('#reviewCode_'+ s).val());
				$('#reviewContent').val($('#reviewContent_'+ s).val());
				$('#counselor').val($('#counselor_'+ s).val());
				$('#tgReviewNo').val($('#reviewCode').val());
				$('#tgrmember').val($('#memberCode').val());
				
				$('#modal1').fadeIn();
			});
			
			
			
			$("input[name='reviewDelete']").click(function() {
				var s = $("input[name='reviewDelete']").index(this);
				
				$('#reviewCode').val($('#reviewCode_'+ s).val());
				/* $('#reviewContent').val($('#reviewContent_'+ s).val());*/
				$('#counselor').val($('#counselor_'+ s).val()); 
				alert($('#reviewCode').val());
				
				 var param = document.getElementById('requestForm');
				param.method = "POST";
				param.action = "${pageContext.request.contextPath}/review/reviewDelete";
				param.submit(); 
	
			});
			
			
			$("#reportBtn").click(function() {
				var param = document.getElementById('requestForm');
				
				$('#reviewCode').val($('#tgReviewNo').val());
				$('#memberCode').val($('#tgrmember').val());
				$('#reportOption').val($("#srcReportOption option:selected").text());
				
				if($('#reportOption').val() == ''){
					alert("신고 사유를 선택하세요");
					return false;
				}
				
				param.method = "POST";
				param.action = "${pageContext.request.contextPath}/report/insert";
			    param.submit(); 
				
			}); 
					
			$("input[name='reviewChange']").click(function() {
				var s = $("input[name='reviewChange']").index(this);
				$('#tgreviewCode').val($('#reviewCode_'+ s).val());
				$('#tgreviewContent').val($('#reviewContent_'+ s).val());
				$('#memberCode').val($('#memberCode_'+s).val());
				$('#counselor').val($('#counselor_'+ s).val());
				$('#counsel').val($('#counsel_'+ s).val());
				$('#reviewCode').val($('#tgreviewCode').val());
				$('#reviewContent').val($('#tgreviewContent').val());
				
				
				$('#m2Member').val($('#memberCode').val());
				/* $('#reviewContent').val("");  */
				$('#modal2').fadeIn();
			});
			
			$("#reviewBtn2").click(function() {
				alert(2)
				var param = document.getElementById('requestForm');
				alert("33 ="+$('#reviewContent').val()+"/");
				$('#star').val($("#srcStar option:selected").val());
				
				param.method = "POST";
				param.action = "${pageContext.request.contextPath}/review/reviewUpdate";
				param.submit(); 
				$('.modal').fadeOut();
	
			});
			
			
			
			$('#backBtn2').click(function(){
				$('#modal2').fadeOut();
			});
			
			
		
			$('#backBtn').click(function(){
				$('.modal').fadeOut();
			});
			
		});
	</script>
	
	
</body>

</html>