package kr.or.ddit.controller.file.item02;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.controller.file.item02.service.ItemService2;
import kr.or.ddit.vo.Item2;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/item2")
@Slf4j
public class FileUploadController02 {
	/*
	 * 3. 여러개의 이미지 업로드
	 * - 한번에 여러개의 이미지를 업로드하는 파일 업로드 기능을 구현한다.
	 * 
	 * 		1. 파일 업로드 구현 설명
	 * 		
	 * 			- 파일 업로드 목록 화면 컨트롤러 메소드 만들기(item2List:get)
	 * 			- 파일 업로드 목록 화면 서비스 인터페이스 메소드 만들기
	 * 			- 파일 업로드 목록 화면 서비스 클래스 메소드 만들기
	 * 			- 파일 업로드 목록 화면 Mapper 인터페이스 메소드 만들기
	 * 			- 파일 업로드 목록 화면 Mapper xml 쿼리 만들기
	 * 			- 파일 업로드 목록 화면 만들기(item2/list.jsp)
	 * 			- 여기까지 확인
	 */
	
	@Inject
	private ItemService2 itemService;
	
	@Resource(name = "uploadPath")
	private String resourcesPath;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) {
		List<Item2> itemList = itemService.list();
		model.addAttribute("itemList", itemList);
		return "item2/list";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String item2RegisterForm() {
		return "item2/register";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String item2Register(Item2 item, Model model) throws IOException {
		List<MultipartFile> pictures = item.getPictures();
		
		for(int i = 0; i < pictures.size(); i++) {
			MultipartFile file = pictures.get(i);
			
			log.info("name : " + file.getOriginalFilename());
			log.info("size : " + file.getSize());
			log.info("contentType : " + file.getContentType());
			
			String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
			
			if(i == 0) {	// 첫번째 url정보
				item.setPictureUrl(savedName);
			}else if(i == 1) {
				item.setPictureUrl2(savedName);
			}
		}
		
		itemService.register(item);
		model.addAttribute("msg", "등록이 완료되었습니다.");
		return "item2/success";
	}
	
	private String uploadFile(String originalName, byte[] fileData) throws IOException {
		System.out.println("resourcesPath : " + resourcesPath);
		UUID uuid = UUID.randomUUID();	// UUID 파일명 생성준비
		String createdFileName = uuid.toString()  + "_" + originalName;	// UUID + "_" + 원본파일명
		
		File file = new File(resourcesPath);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		File target = new File(resourcesPath, createdFileName);
		FileCopyUtils.copy(fileData, target);	// 파일 복사
		return createdFileName;
	}
}



















