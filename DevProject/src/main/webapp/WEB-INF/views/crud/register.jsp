<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>
	<h2>Register</h2>
	<form:form modelAttribute="board" method="post" action="/crud/board/register">
		<table>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" id="title" name="title" value="">
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" id="writer" name="writer" value="">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="10" cols="30" id="content" name="content"></textarea>
				</td>
			</tr>
		</table>
		<div>
			<input type="button" id="btnRegister" value="등록">
			<input type="button" id="btnList" value="목록">
		</div>
	</form:form>
</body>
<script type="text/javascript">
$(function(){
	var board = $('#board');
	var btnRegister = $('#btnRegister');
	var btnList = $('#btnList');
	
	btnRegister.on('click', function(){
		var title = $('#title').val();
		var content = $('#content').val();
		var writer = $('#writer').val();
		
		if(title == null || title == ""){
			alert("제목을 입력해주세요");
			return false;
		}
		if(content == null || content == ""){
			alert("내용을 입력해주세요");
			return false;
		}
		if(writer == null || writer == ""){
			alert("작성자를 입력해주세요");
			return false;
		}
		
		board.submit();	// submit이벤트를 날려 서버로 데이터를 전달한다.
	})
	
	btnList.on('click', function(){
		location.href = "/curd/board/list";
	})
})
</script>
</html>








