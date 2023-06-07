<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>
	<h2>Register</h2>
	<form action="/item3/register" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>상품명</td>
				<td>
					<input type="text" name="itemName" id="itemName">
				</td>
			</tr>
			<tr>
				<td>가격</td>
				<td>
					<input type="text" name="price" id="price">
				</td>
			</tr>
			<tr>
				<td>파일</td>
				<td>
					<input type="file"  id="inputFile">
					<div class="uploadedList"></div>
				</td>
			</tr>
			<tr>
				<td>개요</td>
				<td>
					<textarea rows="10" cols="20" name="description"></textarea>
				</td>
			</tr>
		</table>
		<div>
			<button type="submit" id="btnRegister">Register</button>
			<button type="button" id="btnList" onclick="javascript:location.href='/item3/list'">List</button>
		</div>
	</form>
</body>
<script type="text/javascript">
$(function(){
	let inputFile = $('#inputFile');
	
	//Open파일을 변경했을 떄 발동
	inputFile.on('change', function(event){
		console.log("change event...");
		let files = event.target.files;
		let file = files[0];
		
		console.log(file);	// 로그 출력(확인용)
		
		let formData = new FormData();
		formData.append("file", file);
		
		$.ajax({
			type : 'post',
			url : '/item3/uploadAjax',
			data : formData,
			dataType : 'text',
			processData : false,
			contentType : false,
			success : function(data){
				console.log(data);	// 결과 출력(확인용)
				
				let str = "";
				if(checkImageType(data)){	// 이미지면 이미지태그를 이용하여 출력
					str = "<div>";
					str += "	<a href='/item3/displayFile?fileName=" + data + "'>";
					str += "		<img src='/item3/displayFile?fileName=" + getThumbnailName(data) + "'/>";
					str += "	</a>";
					str += "	<span>X</span>";
					str += "</div>";
				}else{
					str += "<div>";
					str += "	<a href='item3/displayFile?fileName=" + data + "'>" + getOriginalName(data) + "</a>";
					str += "	<span>X</span>";
					str += "</div>";
				}
				
				$('.uploadedList').append(str);	// 추가된 파일(이미지, 파일)등을 div에 추가한다.
			}
		})
	})
})
</script>
</html>
















