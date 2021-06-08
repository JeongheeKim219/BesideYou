<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script>

$(function(){
	//JQuery 연결 테스트
	alert("테스트");
	
})



</script>
<title>TEST</title>
</head>
<body>

<h3>태그 라이브러리 연결 확인</h3>
<c:set var="test" value="TEST"/>
<c:out value="${test}" />

<fmt:formatNumber pattern="#,###,###" value="10000000"/>

</body>
</html>