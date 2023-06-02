<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>공지사항 등록</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="#">DDIT HOME</a></li>
					<li class="breadcrumb-item active">공지사항 등록</li>
				</ol>
			</div>
		</div>
	</div>
</section>
<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="card card-primary">
				<form action="/notice/insert.do" method="post" id="noticeForm">
						
					
					<div class="card-header">
						<h3 class="card-title">공지사항 등록</h3>
						<div class="card-tools"></div>
					</div>
					<div class="card-body">
						<div class="form-group">
							<label for="inputName">제목을 입력해주세요</label> 
							<input type="text" id="boTitle" name="boTitle" class="form-control" placeholder="제목을 입력해주세요">
						</div>
						<div class="form-group">
							<label for="inputDescription">내용을 입력해주세요</label>
							<textarea id="boContent" name="boContent" class="form-control" rows="14"></textarea>
						</div>
						<div class="form-group">
							<div class="custom-file">
								<label for="inputDescription">파일 선택</label> <input type="file"
									class="custom-file-input" id="customFile"> <label
									class="custom-file-label" for="customFile">파일을 선택해주세요</label>
							</div>
						</div>
					</div>
					<div class="card-footer bg-white">
						<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
							<li><span class="mailbox-attachment-icon"><i
									class="far fa-file-pdf"></i></span>
	
								<div class="mailbox-attachment-info">
									<a href="#" class="mailbox-attachment-name"><i
										class="fas fa-paperclip"></i> Sep2014-report.pdf</a> <span
										class="mailbox-attachment-size clearfix mt-1"> <span>1,245
											KB</span> <a href="#" class="btn btn-default btn-sm float-right"><i
											class="fas fa-times"></i></a>
									</span>
								</div></li>
							<li><span class="mailbox-attachment-icon"><i
									class="far fa-file-word"></i></span>
	
								<div class="mailbox-attachment-info">
									<a href="#" class="mailbox-attachment-name"><i
										class="fas fa-paperclip"></i> App Description.docx</a> <span
										class="mailbox-attachment-size clearfix mt-1"> <span>1,245
											KB</span> <a href="#" class="btn btn-default btn-sm float-right"><i
											class="fas fa-times"></i></a>
									</span>
								</div></li>
							<li><span class="mailbox-attachment-icon has-img"><img
									src="../../dist/img/photo1.png" alt="Attachment"></span>
	
								<div class="mailbox-attachment-info">
									<a href="#" class="mailbox-attachment-name"><i
										class="fas fa-camera"></i> photo1.png</a> <span
										class="mailbox-attachment-size clearfix mt-1"> <span>2.67
											MB</span> <a href="#" class="btn btn-default btn-sm float-right"><i
											class="fas fa-times"></i></a>
									</span>
								</div></li>
							<li><span class="mailbox-attachment-icon has-img"><img
									src="../../dist/img/photo2.png" alt="Attachment"></span>
	
								<div class="mailbox-attachment-info">
									<a href="#" class="mailbox-attachment-name"><i
										class="fas fa-camera"></i> photo2.png</a> <span
										class="mailbox-attachment-size clearfix mt-1"> <span>1.9
											MB</span> <a href="#" class="btn btn-default btn-sm float-right"><i
											class="fas fa-times"></i></a>
									</span>
								</div></li>
						</ul>
					</div>
					<div class="card-footer bg-white">
						<div class="row">
							<div class="col-12">
								<input type="button" id="listBtn" value="목록" class="btn btn-success float-right">
								<input type="button" id="insertBtn" value="등록" class="btn btn-primary float-right">
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
		filebrowserUploadUrl: '/imageUpload.do'
	});
	
	var listBtn = $('#listBtn');
	var insertBtn = $('#insertBtn');
	var noticeForm = $('#noticeForm');
	
	listBtn.on('click', function(){
		location.href = "/notice/list.do";
	})
	insertBtn.on('click', function(){
		var title = $('#boTitle').val();
		var content = CKEDITOR.instances.boContent.getData();
		
		if(title == null || title == ""){
			alert("내용 입력해주세요");
			return false;
		}
		noticeForm.submit();
	})
})
</script>



















