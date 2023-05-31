package kr.or.ddit.vo;

import lombok.Data;

@Data
public class NoticeVO {
	private int boNo;			// 공지사항 게시판 번호
	private String boTitle;		// 공지사항 게시판 제목
	private String boWriter;	// 공지사항 게시판 작성자
	private String boContent;	// 공지사항 게시판 내용
	private String boDate;		// 공지사항 게시판 작성일
	private int boHit;			// 공지사항 게시판 조회수
	
	@Override
	public String toString() {
		return "NoticeVO [boNo=" + boNo + ", boTitle=" + boTitle + ", boWriter=" + boWriter + ", boContent=" + boContent
				+ ", boDate=" + boDate + ", boHit=" + boHit + "]";
	}
	
	
}
