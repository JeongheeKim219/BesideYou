<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<c:forEach items="${pageList.content}" var="counsel" varStatus="status">
		<a href="#"> ${counsel.counselCode} </a>		
		<a href="#"> ${counsel.counselState} </a>		
		<a href="#"> ${status.index+1} </a>		
	</c:forEach>
</body>
</html>