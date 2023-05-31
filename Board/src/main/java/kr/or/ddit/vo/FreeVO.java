package kr.or.ddit.vo;

import lombok.Data;

@Data
public class FreeVO {
	private int boNo;			// 자유 게시판 번호
	private String boTitle;		// 자유 게시판 제목
	private String boWriter;	// 자유 게시판 작성자
	private String boContent;	// 자유 게시판 내용
	private String boDate;		// 자유 게시판 작성일
	private int boHit;			// 자유 게시판 조회수
}
