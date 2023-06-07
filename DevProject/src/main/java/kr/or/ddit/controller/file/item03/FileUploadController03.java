package kr.or.ddit.controller.file.item03;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/item3")
@Slf4j
public class FileUploadController03 {
	/*
	 * 13장 파일 업로드
	 * 
	 * 4. 비동기 방식 업로드
	 * - 비동기 방식으로 여러 개의 이미지를 업로드 하는 파일 업로드 기능을 구현한다.
	 * 
	 * 		1. 환경설정
	 * 
	 * 			1-1) 의존 관계 정의
	 * 			- commons-io : 파일을 처리하기 위한 의존 라이브러리
	 * 			- imgscalr-lib : 이미지 변환을 처리하기 위한 의존 라이브러리
	 * 			- jackson-databind : json 데이터 바인딩을 위한 의존 라이브러리
	 * 			*** MAVEN > Update Projects 진행하여 의존 등록 완료(설정)
	 * 
	 * 		2. 파일 업로드 구현 설명
	 * 			- 파일업로드 등록 화면 컨트롤러 만들기(FileUploadController03)
	 * 			- 파일업로드 등록 화면 컨트롤러 메소드 만들기(item3RegisterForm:get)
	 * 			- 파일업로드 등록 화면 만들기(item3/register.jsp)
	 * 			- 여기까지 확인
	 */
	
	// root-context.xml 에서 설정한 uploadPath 빈등록 path 경로를 사용한다.
	@Resource(name = "uploadPath")
	private String resourcePath;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String itemRegisterForm() {
		return "item3/register";
	}
	
	// uploadAjax 메소드는 브라우저에서 넘겨받은 파일을 업로드하는 기능
	@ResponseBody	// 서버에서 클라이언트로 응답 보낼떄 담아서 보내는 기능
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = "text/plain; charset=utf-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file){
		log.info("originalName : " + file.getOriginalFilename());
		
		String savedName = uploadFileUtils.uploadFile(resourcePath, file.getOriginalFilename(), file.getBytes());
		return new ResponseEntity<String>(savedName, HttpStatus.CREATED);
	}
}

















