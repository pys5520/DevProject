<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
<title>공지게시판 상세보기</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h3 class="display-3">공지게시판 상세보기 / 수정 / 삭제</h3>
		</div>
	</div>

	<div class="container">
		<form name="newUpdate" action="" class="form-horizontal" method="post">
0			<div class="form-group row">
				<label class="col-sm-2 control-label" >${notice.boTitle}</label>
				<div class="col-sm-5">
<!-- 					<input name="subject" class="form-control"	value="" > -->
						${notice.boWriter} ${notice.boDate } ${notice.boHit }
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label" >내용</label>
				<div class="col-sm-8" style="word-break: break-all;">
					${notice.boContent }
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<p>
						<button type="button" id="deleteBtn" class="btn btn-danger"> 삭제</button> 
						<button type="button" class="btn btn-success" value="수정 " id="updateBtn">수정</button>
						<button type="button" class="btn btn-primary" id="listBtn">목록</button>
					</p>
				</div>
			</div>
		</form>
		<hr>
	</div>
	<script src="${pageContext.request.contextPath}/resources/plugins/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/dist/js/adminlte.min.js"></script>
</body>
<script type="text/javascript">
$(function(){
	let updateBtn = $('#updateBtn');
	let listBtn = $('#listBtn');
	let deleteBtn = $('#deleteBtn');
	
	listBtn.on('click', function(){
		location.href = "/notice/list.do";
	})
	
	updateBtn.on('click', function(){
		location.href = "/notice/update.do?boNo=${notice.boNo}";
	})
	
	deleteBtn.on('click', function(){
		if(confirm("정말 삭제하시겠습니까?")){
			location.href = "/notice/delete.do?boNo=${notice.boNo}";
		}else{
			location.href = "/notice/detail.do?boNo=${notice.boNo}";
		}
	})
})
</script>
</html>


