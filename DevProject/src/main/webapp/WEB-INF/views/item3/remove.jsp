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
	<h2>Remove</h2>
	<form id="item3" action="/item3/remove" method="post" enctype="multipart/form-data">
		<input type="hidden" name="itemId" value="${item.itemId }">
		<table>
			<tr>
				<td>상품명</td>
				<td>
					<input type="text" name="itemName" id="itemName" value="${item.itemName }" disabled="disabled">
				</td>
			</tr>
			<tr>
				<td>가격</td>
				<td>
					<input type="text" name="price" id="price" value="${item.price }" disabled="disabled">
				</td>
			</tr>
			<tr>
				<td>파일</td>
				<td>
					<div class="uploadedList"></div>
				</td>
			</tr>
			<tr>
				<td>개요</td>
				<td>
					<textarea rows="10" cols="30" name="description" disabled="disabled">${item.description }</textarea>
				</td>
			</tr>
		</table>
		<div>
			<button type="submit" id="btnRemove">Remove</button>
			<button type="button" id="btnList" onclick="javascript:location.href='/item3/list'">List</button>
		</div>
	</form>
</body>
<script type="text/javascript">
$(function(){
	let itemId = ${item.itemId};
	console.log("itemId : " + itemId);
	
	$.getJSON("/item3/getAttach/" + itemId, function(list){
		$(list).each(function(){
			console.log("data : " + this);
			let data = this;
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
			$('.uploadedList').append(str);
			
		})
	})
	
	// 업로드한 이미지 'x'클릭
	$('.uploadedList').on('click', 'span', function(){
		$(this).parent('div').remove();
	});
	
	$('#item3').submit(function(event){
		event.preventDefault();
		
		let that = $(this);	// 현재 눌른 form 태그
		let str = "";
		
		$('.uploadedList a').each(function(index){
			let value = $(this).attr('href');
			value = value.substr(28);	// '?fileName=' 다음에 나오는 값
			
			str += "<input type='hidden' name='files["+ index + "]' value='" + value + "'>";		
		})
		
		console.log("str : " + str);
		
		that.append(str);
		that.get(0).submit();	// form의 첫번째를 가져와서 submit() 처리
	})
	
	//Open파일을 변경했을 떄 발동
	inputFile.on('change', function(event){
		console.log("change event...");
		let files = event.target.files;
		let file = files[0];
		
		console.log(file);	// 로그 출력(확인용)
		
		let formData = new FormData();	// 폼을 쉽게 보내도록 도와주는 객체
		formData.append("file", file);
		
		$.ajax({
			type : 'post',
			url : '/item3/uploadAjax',
			data : formData,
			dataType : 'text',
			processData : false,	// 파일 전송시에 사용(기본값은 true)
			contentType : false,
			success : function(data){
				console.log("data : " + data);	// 결과 출력(확인용)
				
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
	
	function getThumbnailName(fileName){
		let front = fileName.substr(0,12);	// /2023/06/07 폴터
		let end = fileName.substr(12);		// 뒤 파일명
		
		console.log("front : " + front);
		console.log("end : " + end);
		
		return front + "s_" + end;
	}

	function getOriginalName(fileName){
		if(checkImageType(fileName)){
			return;
		}
		
		let idx = fileName.indexOf("_") + 1;
		return fileName.substr(idx);
	}

	// 이미지 파일인지 확인한다.
	function checkImageType(fileName){
		let pattern = /jpg|gif|png|jpeg/;
		return fileName.match(pattern);	// 패턴과 일치하면 true (이미지구나?)
	}
})
</script>
</html>










