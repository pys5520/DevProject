<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<h2>Read</h2>
	<table border="1">
		<tr>
			<td>userId</td>
			<td>${member.userId }</td>
		</tr>
		<tr>
			<td>userName</td>
			<td>${member.userName }</td>
		</tr>
		<tr>
			<td>auth - 1</td>
			<td>${member.authList[0].auth }</td>
		</tr>
		<tr>
			<td>auth - 2</td>
			<td>${member.authList[1].auth }</td>
		</tr>
		<tr>
			<td>auth - 3</td>
			<td>${member.authList[2].auth }</td>
		</tr>
	</table>
	<form action="/crud/member/remove" method="post" id="delForm">
		<input type="hidden" name="userNo" value="${member.userNo }">
	</form>
	<button type="button" id="btnModify">Modify</button>
	<button type="button" id="btnRemove">Remove</button>
	<button type="button" id="btnList">List</button>
</body>
<script type="text/javascript">
$(function(){
	var delForm = $('#delForm');
	var btnModify = $('#btnModify');
	var btnRemove = $('#btnRemove');
	var btnList = $('#btnList');
	
	btnModify.on('click', function(){
		delForm.attr('action', '/crud/member/modify');
		delForm.attr('method', 'get');
		delForm.submit();
	})
	btnRemove.on('click', function(){
		if(confirm("정말로 삭제하시겠습니까?")){
			delForm.submit();
		}
	})
	btnList.on('click', function(){
		location.href = "/crud/member/list";
	})
})
</script>
</html>









