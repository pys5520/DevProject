package kr.or.ddit.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeVO {
	private int boNo;
	private String boTitle;
	private String boContent;
	private String boWriter;
	private String boDate;
	private int boHit;
	
	private Integer[] delNoticeNo;	// 삭제할 파일번호를 저장
	private MultipartFile[] boFile;	
//	private List<NoticeFileVO> noticeFileList;
}