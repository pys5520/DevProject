package kr.or.ddit.main.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.main.dao.IMainDAO;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.FreeVO;
import kr.or.ddit.vo.NoticeVO;

@Service
public class MainServiceImpl implements IMainService {
	
	@Inject
	private IMainDAO mainDao;
	
	public List<BoardVO> selectBoardList(){
		return mainDao.selectBoardList();
	}

	@Override
	public List<NoticeVO> selectNoticeList() {
		return mainDao.selectNoticeList();
	}

	@Override
	public List<FreeVO> selectFreeList() {
		return mainDao.selectFreeList();
	}
}
