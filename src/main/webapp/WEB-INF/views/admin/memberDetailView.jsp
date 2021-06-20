<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(function(){
	if(${member.memberType}==0){
		$("#memberType").val("회원");
	}else if(${member.memberType}==1){
		$("#memberType").val("상담사");
	}else{
		$("#memberType").val("관리자");
	}

	
	
})
</script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Language" content="ko">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Analytics Dashboard - This is an example dashboard
	created using build-in elements and components.</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
<meta name="description"
	content="This is an example dashboard created using build-in elements and components.">
<meta name="msapplication-tap-highlight" content="no">
<!--
    =========================================================
    * ArchitectUI HTML Theme Dashboard - v1.0.0
    =========================================================
    * Product Page: https://dashboardpack.com
    * Copyright 2019 DashboardPack (https://dashboardpack.com)
    * Licensed under MIT (https://github.com/DashboardPack/architectui-html-theme-free/blob/master/LICENSE)
    =========================================================
    * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
    -->
<link href="${pageContext.request.contextPath}/adminCss/main.css"
	rel="stylesheet">
<style>
#rowWidget {
	display: flex;
	flex-direction: row;
}

#rowWidgetContainer {
	flex-wrap: wrap;
}

.direction {
	display: flex;
	flex-direction: column;
}
</style>
</head>
<body>
	<%@include file="./header.jsp"%>
	<%@include file="./menu.jsp"%>
	<div class="app-main">
		<div class="app-main__outer">
			<div class="app-main__inner">
				<ul
					class="body-tabs body-tabs-layout tabs-animated body-tabs-animated nav">
					<li class="nav-item"><a role="tab" class="nav-link active"
						id="tab-0" data-toggle="tab" href="#tab-content-0"> <span>상세조회</span>
					</a></li>
					<li class="nav-item"><a role="tab" class="nav-link" id="tab-1"
						data-toggle="tab" href="#tab-content-1"> <span>회원정보수정</span>
					</a></li>
					<li class="nav-item"><a role="tab" class="nav-link" id="tab-2"
						data-toggle="tab" href="#tab-content-2"> <span>Custom
								Controls</span>
					</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane tabs-animation fade show active"
						id="tab-content-0" role="tabpanel">
						<div class="row">
							<div class="col-md-6">
								<div class="main-card mb-3 card">
									<div class="card-body">
										<form class="">
											<h5 class="card-title">기본 정보</h5>
											<div class="position-relative form-group">
												<label for="id" class="">회원코드</label><input
													name="memberCode" id="memberCode" type="text"
													readonly="readonly" class="form-control"
													value="${member.memberCode}">
											</div>
											<div class="position-relative form-group">
												<label for="id" class="">ID</label><input name="id" id="id"
													type="text" readonly="readonly" class="form-control"
													value="${member.id}">
											</div>
											<div class="position-relative form-group">
												<label for="name" class="">이름</label><input name="name"
													id="name" type="text" readonly="readonly"
													class="form-control" value="${member.name}">
											</div>
											<div class="position-relative form-group">
												<label for="alias" class="">가명</label><input name="alias"
													id="alias" type="text" readonly="readonly"
													class="form-control" value="${member.alias}">
											</div>
											<div class="position-relative form-group">
												<label for="address" class="">주소</label><input
													name="address" id="address" type="text" readonly="readonly"
													class="form-control" value="${member.memberAddr}">
											</div>
											<div class="position-relative form-group">
												<label for="email" class="">이메일</label><input name="email"
													id="email" type="email" readonly="readonly"
													class="form-control" value="${member.email}">
											</div>
											<div class="position-relative form-group">
												<label for="phone" class="">핸드폰 번호</label><input
													name="phone" id="phone" type="tel" readonly="readonly"
													class="form-control" value="${member.phone}">
											</div>
											<div class="position-relative form-group">
												<label for="birth" class="">생년월일</label><input name="birth"
													id="birth" placeholder="birth" type="date"
													class="form-control" readonly="readonly"
													value="${member.dateOfBirth}">
											</div>
											<div class="position-relative form-group">
												<fmt:parseDate var="parseDate" pattern="yyyy-MM-dd'T'HH:mm"
													value="${member.dateOfReg}" type="both" />
												<label for="registerDate" class="">가입일</label><input
													name="registerDate" id="registerDate"
													placeholder="registerDate" type="datetime"
													class="form-control" readonly="readonly"
													value="<fmt:formatDate value="${parseDate}" pattern="yyyy-MM-dd"/>">
											</div>
										</form>
									</div>
								</div>
								<div class="main-card mb-3 card">
									<div class="card-body">
										<form name="inForm" method="post" id="inForm"
											action="${pageContext.request.contextPath}/admin/update/${member.memberCode}">
											<h5 class="card-title"></h5>
											<div class="position-relative form-group">
												<label for="exampleSelect" class="">회원 활동 상태</label><select
													name="state" id="exampleSelect" class="form-control">
													<option value="0">정상</option>
													<option value="1">경고</option>
													<option value="2">정지</option>
													<option value="3">탈퇴</option>
												</select>
											</div>
											<div class="position-relative form-group">
												<label for="exampleSelectMulti" class="">회원유형</label> <input
													name="memberType" id="memberType" type="text"
													readonly="readonly" class="form-control" value="">
											</div>
											<button class="mt-1 btn btn-secondary" type="submit">변경</button>
										</form>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<c:choose>
									<c:when test="${fn:length(contact) == 0}">
										<div class="main-card mb-3 card">
											<div class="card">
												<div class="card-header">문의내역</div>
												<div class="card-body">문의내역이 없습니다.</div>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div id="accordion" class="accordion-wrapper mb-3">
											<c:forEach items="${contact}" var="contact"
												varStatus="status">
												<div class="card">
													<div id="heading${status.index}" class="card-header">
														<button type="button" data-toggle="collapse"
															data-target="#collapseOne${status.index}"
															aria-expanded="false"
															aria-controls="collapseOne${status.index}"
															class="text-left m-0 p-0 btn btn-link btn-block">
															<div class="widget-content-wrapper">
																<div class='widget-content-left'>
																	<h5 class="m-0 p-0"># ${contact.contactCode}
																		${contact.contactTitle}</h5>
																</div>
																<div class='widget-content-right'>
																	<c:choose>
																		<c:when test="${contact.contactState == 0}">
																			<div class="mb-2 mr-2 badge badge-secondary"
																				style="float: right; display: inline-block;">미처리</div>
																		</c:when>
																		<c:otherwise>
																			<div class="mb-2 mr-2 badge badge-info"
																				style="float: right; display: inline-block;">처리</div>
																		</c:otherwise>
																	</c:choose>
																</div>
															</div>
														</button>
													</div>
													<div data-parent="#accordion"
														id="collapseOne${status.index}"
														aria-labelledby="heading${status.index}" class="collapse">
														<div class="card-body">

															<table class="mb-0 table table-borderless">
																<tr>
																	<td>${contact.contactCategory}</td>
																</tr>
																<tr>
																	<td>${contact.contactContent}</td>
																</tr>
																<tr>
																	<td>${contact.contactDate}</td>
																</tr>
																<c:choose>
																	<c:when test="${contact.contactState == 1}">
																		<tr>
																			<th>문의답변</th>
																		</tr>
																		<tr>
																			<td>${contact.contactReply.contactReplyContent}</td>
																		</tr>
																		<tr>
																			<td>${contact.contactReply.contactReplyDate}</td>
																		</tr>
																	</c:when>
																	<c:otherwise>
																		<tr>
																			<td><a href="#" class="btn btn-primary">답변하기</a>
																			<td>
																		</tr>
																	</c:otherwise>
																</c:choose>
															</table>

														</div>
													</div>
												</div>
											</c:forEach>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="tab-pane tabs-animation fade" id="tab-content-1" role="tabpanel">
							<div class="row">
								<div class="col-md-6">
									<div class="main-card mb-3 card">
										<div class="card-body">
											<h5 class="card-title">Input Groups</h5>
											<div>
												<div class="input-group">
													<div class="input-group-prepend">
														<span class="input-group-text">@</span>
													</div>
													<input placeholder="username" type="text"
														class="form-control">
												</div>
												<br>
												<div class="input-group">
													<div class="input-group-prepend">
														<span class="input-group-text"><input
															aria-label="Checkbox for following text input"
															type="checkbox" class=""></span>
													</div>
													<input placeholder="Check it out" type="text"
														class="form-control">
												</div>
												<br>
												<div class="input-group">
													<input placeholder="username" type="text"
														class="form-control">
													<div class="input-group-append">
														<span class="input-group-text">@example.com</span>
													</div>
												</div>
												<br>
												<div class="input-group">
													<div class="input-group-prepend">
														<span class="input-group-text">$</span><span
															class="input-group-text">$</span>
													</div>
													<input placeholder="Dolla dolla billz yo!" type="text"
														class="form-control">
													<div class="input-group-append">
														<span class="input-group-text">$</span><span
															class="input-group-text">$</span>
													</div>
												</div>
												<br>
												<div class="input-group">
													<div class="input-group-prepend">
														<span class="input-group-text">$</span>
													</div>
													<input placeholder="Amount" step="1" type="number"
														class="form-control">
													<div class="input-group-append">
														<span class="input-group-text">.00</span>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="main-card mb-3 card">
										<div class="card-body">
											<h5 class="card-title">Input Group Button Dropdown</h5>
											<div class="input-group">
												<div class="input-group-prepend">
													<button type="button" data-toggle="dropdown"
														aria-haspopup="true" aria-expanded="false"
														class="dropdown-toggle btn btn-secondary">Button
														Dropdown</button>
													<div tabindex="-1" role="menu" aria-hidden="true"
														class="dropdown-menu">
														<h6 tabindex="-1" class="dropdown-header">Header</h6>
														<button type="button" disabled="" tabindex="-1"
															class="disabled dropdown-item">Action</button>
														<button type="button" tabindex="0" class="dropdown-item">Another
															Action</button>
														<div tabindex="-1" class="dropdown-divider"></div>
														<button type="button" tabindex="0" class="dropdown-item">Another
															Action</button>
													</div>
												</div>
												<input type="text" class="form-control">
											</div>
										</div>
									</div>
									<div class="main-card mb-3 card">
										<div class="card-body">
											<h5 class="card-title">Input Group Button Shorthand</h5>
											<div>
												<div class="input-group">
													<div class="input-group-prepend">
														<button class="btn btn-secondary">To the Left!</button>
													</div>
													<input type="text" class="form-control">
												</div>
												<br>
												<div class="input-group">
													<input type="text" class="form-control">
													<div class="input-group-append">
														<button class="btn btn-secondary">To the Right!</button>
													</div>
												</div>
												<br>
												<div class="input-group">
													<div class="input-group-prepend">
														<button class="btn btn-danger">To the Left!</button>
													</div>
													<input placeholder="and..." type="text"
														class="form-control">
													<div class="input-group-append">
														<button class="btn btn-success">To the Right!</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="main-card mb-3 card">
										<div class="card-body">
											<h5 class="card-title">Input Group Sizing</h5>
											<div>
												<div class="input-group input-group-lg">
													<div class="input-group-prepend">
														<span class="input-group-text">@lg</span>
													</div>
													<input type="text" class="form-control">
												</div>
												<br>
												<div class="input-group">
													<div class="input-group-prepend">
														<span class="input-group-text">@normal</span>
													</div>
													<input type="text" class="form-control">
												</div>
												<br>
												<div class="input-group input-group-sm">
													<div class="input-group-prepend">
														<span class="input-group-text">@sm</span>
													</div>
													<input type="text" class="form-control">
												</div>
											</div>
										</div>
									</div>
									<div class="main-card mb-3 card">
										<div class="card-body">
											<h5 class="card-title">Input Group Addon</h5>
											<div>
												<div class="input-group">
													<div class="input-group-prepend">
														<span class="input-group-text">To the Left!</span>
													</div>
													<input type="text" class="form-control">
												</div>
												<br>
												<div class="input-group">
													<input type="text" class="form-control">
													<div class="input-group-append">
														<span class="input-group-text">To the Right!</span>
													</div>
												</div>
												<br>
												<div class="input-group">
													<div class="input-group-prepend">
														<span class="input-group-text">To the Left!</span>
													</div>
													<input placeholder="and..." type="text"
														class="form-control">
													<div class="input-group-append">
														<span class="input-group-text">To the Right!</span>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="main-card mb-3 card">
										<div class="card-body">
											<h5 class="card-title">Input Group Button</h5>
											<div>
												<div class="input-group">
													<div class="input-group-prepend">
														<button class="btn btn-secondary">I'm a button</button>
													</div>
													<input type="text" class="form-control">
												</div>
												<br>
												<div class="input-group">
													<input type="text" class="form-control">
													<div class="input-group-append">
														<button type="button" data-toggle="dropdown"
															aria-haspopup="true" aria-expanded="false"
															class="dropdown-toggle btn btn-secondary">Button
															Dropdown</button>
														<div tabindex="-1" role="menu" aria-hidden="true"
															class="dropdown-menu">
															<h6 tabindex="-1" class="dropdown-header">Header</h6>
															<button type="button" disabled="" tabindex="-1"
																class="disabled dropdown-item">Action</button>
															<button type="button" tabindex="0" class="dropdown-item">Another
																Action</button>
															<div tabindex="-1" class="dropdown-divider"></div>
															<button type="button" tabindex="0" class="dropdown-item">Another
																Action</button>
														</div>
													</div>
												</div>
												<br>
												<div class="input-group">
													<div class="input-group-prepend">
														<button class="btn btn-outline-secondary">Split
															Button</button>
														<button type="button" data-toggle="dropdown"
															aria-haspopup="true" aria-expanded="false"
															class="dropdown-toggle dropdown-toggle-split btn btn-outline-secondary">
															<span class="sr-only">Toggle Dropdown</span>
														</button>
														<div tabindex="-1" role="menu" aria-hidden="true"
															class="dropdown-menu">
															<h6 tabindex="-1" class="dropdown-header">Header</h6>
															<button type="button" disabled="" tabindex="-1"
																class="disabled dropdown-item">Action</button>
															<button type="button" tabindex="0" class="dropdown-item">Another
																Action</button>
															<div tabindex="-1" class="dropdown-divider"></div>
															<button type="button" tabindex="0" class="dropdown-item">Another
																Action</button>
														</div>
													</div>
													<input placeholder="and..." type="text"
														class="form-control">
													<div class="input-group-append">
														<button class="btn btn-secondary">I'm a button</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane tabs-animation fade" id="tab-content-2"
							role="tabpanel">
							<form class="">
								<div class="row">
									<div class="col-md-6">
										<div class="main-card mb-3 card">
											<div class="card-body">
												<h5 class="card-title">Checkboxes</h5>
												<div class="position-relative form-group">
													<div>
														<div class="custom-checkbox custom-control">
															<input type="checkbox" id="exampleCustomCheckbox"
																class="custom-control-input"><label
																class="custom-control-label" for="exampleCustomCheckbox">Check
																this custom checkbox</label>
														</div>
														<div class="custom-checkbox custom-control">
															<input type="checkbox" id="exampleCustomCheckbox2"
																class="custom-control-input"><label
																class="custom-control-label"
																for="exampleCustomCheckbox2">Or this one</label>
														</div>
														<div class="custom-checkbox custom-control">
															<input type="checkbox" id="exampleCustomCheckbox3"
																disabled="" class="custom-control-input"><label
																class="custom-control-label"
																for="exampleCustomCheckbox3">But not this
																disabled one</label>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="main-card mb-3 card">
											<div class="card-body">
												<h5 class="card-title">Inline</h5>
												<div class="position-relative form-group">
													<div>
														<div
															class="custom-checkbox custom-control custom-control-inline">
															<input type="checkbox" id="exampleCustomInline"
																class="custom-control-input"><label
																class="custom-control-label" for="exampleCustomInline">An
																inline custom input</label>
														</div>
														<div
															class="custom-checkbox custom-control custom-control-inline">
															<input type="checkbox" id="exampleCustomInline2"
																class="custom-control-input"><label
																class="custom-control-label" for="exampleCustomInline2">and
																another one</label>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="main-card mb-3 card">
											<div class="card-body">
												<h5 class="card-title">Radios</h5>
												<div class="position-relative form-group">
													<div>
														<div class="custom-radio custom-control">
															<input type="radio" id="exampleCustomRadio"
																name="customRadio" class="custom-control-input"><label
																class="custom-control-label" for="exampleCustomRadio">Select
																this custom radio</label>
														</div>
														<div class="custom-radio custom-control">
															<input type="radio" id="exampleCustomRadio2"
																name="customRadio" class="custom-control-input"><label
																class="custom-control-label" for="exampleCustomRadio2">Or
																this one</label>
														</div>
														<div class="custom-radio custom-control">
															<input type="radio" id="exampleCustomRadio3" disabled=""
																class="custom-control-input"><label
																class="custom-control-label" for="exampleCustomRadio3">But
																not this disabled one</label>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="main-card mb-3 card">
											<div class="card-body">
												<h5 class="card-title">Form Select</h5>
												<div class="row">
													<div class="col-md-6">
														<div class="position-relative form-group">
															<label for="exampleCustomSelect" class="">Custom
																Select</label><select type="select" id="exampleCustomSelect"
																name="customSelect" class="custom-select">
																<option value="">Select</option>
																<option>Value 1</option>
																<option>Value 2</option>
																<option>Value 3</option>
																<option>Value 4</option>
																<option>Value 5</option>
															</select>
														</div>
														<div class="position-relative form-group">
															<label for="exampleCustomMutlipleSelect" class="">Custom
																Multiple Select</label><select multiple="" type="select"
																id="exampleCustomMutlipleSelect" name="customSelect"
																class="custom-select">
																<option value="">Select</option>
																<option>Value 1</option>
																<option>Value 2</option>
																<option>Value 3</option>
																<option>Value 4</option>
																<option>Value 5</option>
															</select>
														</div>
													</div>
													<div class="col-md-6">
														<div class="position-relative form-group">
															<label for="exampleCustomSelectDisabled" class="">Custom
																Select Disabled</label><select type="select"
																id="exampleCustomSelectDisabled" name="customSelect"
																disabled="" class="custom-select">
																<option value="">Select</option>
																<option>Value 1</option>
																<option>Value 2</option>
																<option>Value 3</option>
																<option>Value 4</option>
																<option>Value 5</option>
															</select>
														</div>
														<div class="position-relative form-group">
															<label for="exampleCustomMutlipleSelectDisabled" class="">Custom
																Multiple Select Disabled</label><select multiple=""
																type="select" id="exampleCustomMutlipleSelectDisabled"
																name="customSelect" disabled="" class="custom-select">
																<option value="">Select</option>
																<option>Value 1</option>
																<option>Value 2</option>
																<option>Value 3</option>
																<option>Value 4</option>
																<option>Value 5</option>
															</select>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<script src="http://maps.google.com/maps/api/js?sensor=true"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/adminCss/assets/scripts/main.js"></script>
		<script
			src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
		<script type="text/javascript">
		
	</script>
</body>
</html>