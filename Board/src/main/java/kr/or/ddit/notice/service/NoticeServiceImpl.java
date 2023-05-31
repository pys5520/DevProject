package kr.or.ddit.notice.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.notice.dao.INoticeDAO;
import kr.or.ddit.vo.NoticeVO;
import kr.or.ddit.vo.PaginationInfoVO;

@Service
public class NoticeServiceImpl implements INoticeService {
	
	@Inject
	private INoticeDAO noticeDao;
	
	@Override
	public ServiceResult insertNotice(NoticeVO noticeVO) {
		ServiceResult result = null;
		
		int status = noticeDao.insertNotice(noticeVO);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;	
		}
		
		return result;
	}

	@Override
	public NoticeVO selectNotice(int boNo) {
		noticeDao.incrementHit(boNo);
		return noticeDao.selectNotice(boNo);
	}

	@Override
	public int selectNoticeCount(PaginationInfoVO<NoticeVO> pagingVO) {
		
		return noticeDao.selectNoticeCount(pagingVO);
	}

	@Override
	public List<NoticeVO> selectNoticeList(PaginationInfoVO<NoticeVO> pagingVO) {
		
		return noticeDao.selectNoticeList(pagingVO);
	}

	@Override
	public ServiceResult deleteNotice(int boNo) {
		ServiceResult result = null;
		int status = noticeDao.deleteNotice(boNo);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult updateNotice(NoticeVO noticeVO) {
		ServiceResult result = null;
		int status = noticeDao.updateNotice(noticeVO);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
	
}
