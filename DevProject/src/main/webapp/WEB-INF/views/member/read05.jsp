<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>READ05</title>
</head>
<body>
	<h3>READ05 Result</h3>
	
	<p>user.address</p>
	user.address.postCode : ${user.address.postCode }<br/>
	user.address.location : ${user.address.location }<br/>
	
	<p>user.cardList</p>
	<c:forEach items="${user.cardList }" var="card">
		<c:out value="${card.no }"/>
		<c:out value="${card.validMonth }"/>
	</c:forEach>
</body>
</html>