<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
var f = window.document.requestForm;
	
	function sendUpdate(){
		document.requestForm.methodName.value ="report";
		document.requestForm.submit();
	}
	
	function sendDelete(){
		if(confirm("정말 삭제하시겠습니까?") == true){
		document.requestForm.methodName.value ="delete";
		document.requestForm.submit();
		}else{
			return;
		}
	}
</script>


<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>리뷰번호</td>
			<td>맴버코드</td>
			<td>상담사코드</td>
			<td>상담코드</td>
			<td>리뷰날짜</td>
			<td>별점</td>
			<td>리뷰내용</td>
		</tr>
		<c:choose>
		<c:when test = "${empty requestScope.reviewList}">
		<tr>
			<td>
				<p align="center"><b><span style="font-size:9pt;">등록된 리뷰 없습니다.</span></b></p>
			</td>
		</tr>
		
		</c:when>
		<c:otherwise>
		<c:forEach items = "${requestScope.reviewList }" var="review">
			<tr>
				<td>
					<p align="center"><span style="font-size:9pt;">
		            ${review.reviewCode}</span></p>
				</td>
				<td>
					<p align="center"><span style="font-size:9pt;">
		            ${review.memberCode.memberCode}</span></p>
				</td>
				<td>
					<p align="center"><span style="font-size:9pt;">
		            ${review.counselorCode.counselorCode}</span></p>
				</td>
				<td>
					<p align="center"><span style="font-size:9pt;">
					
		            ${review.counselCode.counselCode}</span></p>
				</td>
				<td>
					<p align="center"><span style="font-size:9pt;">
		            ${review.reviewDate}</span></p>
				</td>
				<td>
					<p align="center"><span style="font-size:9pt;">
		            ${review.star}</span></p>
				</td>
				<td>
					<p align="center"><span style="font-size:9pt;">
		            ${review.reviewContent}</span></p>
				</td>
			</tr>
			
		
		</c:forEach>
		
		</c:otherwise>
		</c:choose>
		
			
	</table>
	<ul>
			<li><a href="?page=${previous}">Previous</a></li>
			<li><a href="?page=${next}">Next</a></li>
		
		</ul>
		<hr>
<h3>평균 별점 ★ :${requestScope.avgStar} </h3>
</body>
</html>