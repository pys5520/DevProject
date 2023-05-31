<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
		y: 년 
		M: 월
		d: 일
		H: 시간
		m: 분
		s: 초
		z: 나라 표기 시
		a: 오전/오후
 -->
	<h4>12) pattern 속성을 지정하여 문자열을 Date 객체로 변환한다.</h4>
	<p>dataValue : ${dataValue }</p>
	<p><fmt:parseDate value="${dataValue }" pattern="yyyy-MM-dd HH:mm:ss" var="date"/> </p>
	<p>date : ${date }</p>
</body>
</html>