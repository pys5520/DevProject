<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<li th:text="|인가코드 = ${code}|">code</li>
	<li th:text="|유효토큰 = ${access_token}|">code</li>
	<li th:text="|사용자정보 = ${userInfo}|">code</li>
	<li th:text="|동의정보 = ${agreementInfo}|">code</li>
<a href="https://kauth.kakao.com/oauth/logout?client_id=2aad40910868e3c5fa9594f8de34a07b&logout_redirect_uri=http://localhost:80/member/do">로그아웃</a>
</body>
</html>