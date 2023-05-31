<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set value="${member.userId }" var="userId"/>
<c:set value="${member.password }" var="password"/>
<c:set value="${member.userName }" var="userName"/>
<c:set value="${member.email }" var="email"/>
<c:set value="${member.dateOfBirth}" var="dateOfBirth"/>
<c:set value="${ member.gender}" var="gender"/>
<c:set value="${ member.developer}" var="developer"/>
<c:set value="${ member.foreigner}" var="foreigner"/>
<c:set value="${ member.nationality}" var="nationality"/>
<c:set value="${member.cars }" var="cars"/>
<c:set value="${member.hobby }" var="hobby"/>
<c:set value="${ member.address.postCode}" var="postCode"/>
<c:set value="${ member.address.location}" var="location"/>
<c:set value="${ member.cardList[0].no}" var="no"/>
<c:set value="${ member.cardList[0].validMonth}" var="validMonth"/>
<c:set value="${ member.cardList[1].no}" var="no1"/>
<c:set value="${ member.cardList[1].validMonth}" var="validMonth1"/>
<c:set value="${ member.introduction}" var="introduction"/>

<table border="1">
	<tr>
		<td>아이디 :</td>
		<td>${userId }</td>
	</tr>
	<tr>
		<td>비밀번호 :</td>
		<td>${password}</td>
	</tr>
	<tr>
		<td>이름 :</td>
		<td>${userName}</td>
	</tr>
	<tr>
		<td>이메일 :</td>
		<td>${email}</td>
	</tr>
	<tr>
		<td>생년월일 :</td>
		<td>${dateOfBirth}</td>
	</tr>
	<tr>
		<td>성별 :</td>
		<td>${gender}</td>
	</tr>
	<tr>
		<td>개발자 여부 :</td>
		<td>${developer}</td>
	</tr>
	<tr>
		<td>외국인 여부 :</td>
		<td>${foreigner}</td>
	</tr>
	<tr>
		<td>국적 :</td>
		<td>${nationality}</td>
	</tr>
	<tr>
		<td>소유차량 :</td>
		<td>
			<c:forEach items="${cars }" var="cars" step = "1">
				${cars }
			</c:forEach>
		</td>
	</tr>
	<tr>
		<td>취미 :</td>
		<td>
			<c:forEach items="${ hobby}" var="hobby" step="1">
						${hobby }
			</c:forEach>
		</td>
	</tr>
	<tr>
		<td>주소 :</td>
		<td>${postCode} ${location}</td>
	</tr>
	<tr>
		<td>카드번호1 :</td>
		<td>${no} ${validMonth }</td>
	</tr>
	<tr>
		<td>카드번호2 :</td>
		<td>${no1} ${validMonth1 }</td>
	</tr>
	<tr>
		<td>소개 :</td>
		<td>${introduction}</td>
	</tr>
</table>
</body>
</html>













