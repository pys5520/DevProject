<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<section class="content-header">
	<c:set value="등록" var="name"/>
	<c:if test="${status eq 'u' }">
		<c:set value="수정" var="name"/>
	</c:if>
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>공지사항 ${name }</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="#">DDIT HOME</a></li>
					<li class="breadcrumb-item active">공지사항  ${name }</li>
				</ol>
			</div>
		</div>
	</div>
</section>
<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="card card-primary">
				<form action="/notice/insert.do?${_csrf.parameterName }=${_csrf.token}" method="post" id="noticeForm" enctype="multipart/form-data">
					<c:if test="${status eq 'u' }">
						<input type="hidden" name="boNo" id="boNo" value="${notice.boNo }">
					</c:if>
					
					<div class="card-header">
						<h3 class="card-title">공지사항 ${name }</h3>
						<div class="card-tools"></div>
					</div>
					<div class="card-body">
						<div class="form-group">
							<label for="inputName">제목을 입력해주세요</label> 
							<input type="text" id="boTitle" name="boTitle" value="${notice.boTitle }" class="form-control" placeholder="제목을 입력해주세요">
						</div>
						<div class="form-group">
							<label for="inputDescription">내용을 입력해주세요</label>
							<textarea id="boContent" name="boContent" class="form-control" rows="14">${notice.boContent }</textarea>
						</div>
						<div class="form-group">
							<div class="custom-file">
								<label for="inputDescription">파일 선택</label> <input type="file"
									class="custom-file-input" id="boFile" name="boFile" multiple="multiple"> <label
									class="custom-file-label" for="customFile">파일을 선택해주세요</label>
							</div>
						</div>
					</div>
					<c:if test="${status eq 'u' }">
						<div class="card-footer bg-white">
							<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
								<c:if test="${not empty notice.noticeFileList }">
									<c:forEach items="${notice.noticeFileList }" var="noticeFile">
										<li>
											<span class="mailbox-attachment-icon">
												<i class="far fa-file-pdf"></i>
											</span>
											<div class="mailbox-attachment-info">
												<a href="#" class="mailbox-attachment-name">
													<i class="fas fa-paperclip"></i> ${noticeFile.fileName }
												</a> 
												<span class="mailbox-attachment-size clearfix mt-1">
													 <span>${noticeFile.fileFancysize }</span>
													 <span class="btn btn-default btn-sm float-right attachmentFileDel" id="span_${noticeFile.fileNo }">
													  	<i class="fas fa-times"></i>
													 </span>
												</span>
											</div>
										</li>
									</c:forEach>
								</c:if>
								
								
							</ul>
						</div>
					</c:if>
					
					<div class="card-footer bg-white">
						<div class="row">
							<div class="col-12">
								<!--
									 등록일때는 목록, 등록
									 수정일때는 수정, 취소
								 -->
									<input type="button" id="insertBtn" value="${name }" class="btn btn-primary float-right">
								<c:if test="${status eq 'u' }">
									<input type="button" id="cancelBtn" value="취소" class="btn btn-success float-right">
								</c:if>
								<c:if test="${status ne 'u' }">
									<input type="button" id="listBtn" value="목록" class="btn btn-success float-right">
								</c:if>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">
$(function(){
	CKEDITOR.replace("boContent", {
		footnotesPrefix: "a",
		filebrowserUploadUrl: '/imageUpload.do?${_csrf.parameterName }=${_csrf.token}'
	});
	
	var listBtn = $('#listBtn');
	var insertBtn = $('#insertBtn');
	var noticeForm = $('#noticeForm');
	var cancelBtn = $('#cancelBtn');
	
	listBtn.on('click', function(){
		location.href = "/notice/list.do";
	})
	insertBtn.on('click', function(){
		var title = $('#boTitle').val();
		var content = CKEDITOR.instances.boContent.getData();
		
		if(title == null || title == ""){
			alert("제목을 입력해주세요");
			return false;
		}
		
		if($(this).val() == "수정"){
			noticeForm.attr('action', '/notice/update.do?${_csrf.parameterName }=${_csrf.token}');
		}
		
		noticeForm.submit();
	})
	
	cancelBtn.on('click', function(){
		var boNo = $('#boNo');
		location.href = "/notice/detail.do?boNo=" + boNo;
	})
	
	$('.attachmentFileDel').on('click', function(){
		var id = $(this).prop("id");
		var idx = id.indexOf("_");
		var noticeFileNo = id.substring(idx + 1);	// fileNo 얻어오기
		var ptrn = "<input type='hidden' name='delNoticeNo' value='%V'/>";
		noticeForm.append(ptrn.replace("%V", noticeFileNo));
		$(this).parents("li:first").hide();
	})
})
</script>



















