<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
<title>자유게시판 목록</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">자유 게시판 목록</h1>
		</div>
	</div>
	<div class="container">
			<div>
				<div class="text-right">
					<span class="badge badge-success">전체 건	</span>
				</div>
			</div>
			<div style="padding-top: 50px">
				<div class="row" style="padding-bottom: 20px">
					<div class="col-md-7"></div>
					<div class="col-md-5">
						<div class="row">
							<div class="col-md-2"></div>
							<div class="col-md-10">
							<form method="post" id="searchForm" style="width: 440px;">
								<input type="hidden" name="page" id="page">
								<select class="form-control" name="searchType">
									<option value="title" <c:if test="${searchType == 'title'}"><c:out value="selected"/></c:if> >제목</option>
									<option value="writer" <c:if test="${searchType == 'writer'}"><c:out value="selected"/></c:if>>작성자</option>
									<option value="tw" <c:if test="${searchType == 'tw'}"><c:out value="selected"/></c:if>>제목+작성자</option>
								</select>
								<input type="text" name="searchWord" class="form-control float-right" value="${searchWord }" placeholder="search"/>
								<input type="submit" value="검색"/>
							</form>
							</div>
						</div>
					</div>
				</div>
				<table class="table">
					<thead class="table-dark">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일</th>
							<th>작성자</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
					<c:set value="${pagingVO.dataList }" var="freeList"/>
					<c:choose>
						<c:when test="${empty freeList }">
							<tr>
								<td colspan="5">조회하신 게시글이 존재하지 않습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${freeList }" var="free">
									
									<tr class="pys" data-pys="${free.boNo }">
										<td>${free.boNo }</td>
										<td>${free.boTitle }</td>
										<td>${free.boWriter }</td>
										<td>${free.boDate }</td>
										<td>${free.boHit }</td>
									</tr>
								</c:forEach>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</div>
			<div align="left">
				<button type="button" class="btn btn-primary" id="newBtn">글쓰기</button>
			</div>
			<div id="pagingArea">
				${pagingVO.pagingHTML}
			</div>
		<hr>
	</div>
	<script src="${pageContext.request.contextPath}/resources/plugins/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/dist/js/adminlte.min.js"></script>
</body>
<script type="text/javascript">
$(function(){
	let newBtn = $('#newBtn');
	let pagingArea = $('#pagingArea');
	let searchForm = $('#searchForm');
	
	$('.pys').on('click', function(){
		let boNo = $(this).data("pys");
// 		console.log(boNo);
		location.href = "/free/detail.do?boNo="+boNo;
	})
	
	pagingArea.on('click', "a", function(){
		event.preventDefault();
		let pageNo = $(this).data("page");
		searchForm.find('#page').val(pageNo);
		searchForm.submit();
	})
	
	newBtn.on('click', function(){
		location.href = "/free/form.do";
	})
})

</script>
</html>





