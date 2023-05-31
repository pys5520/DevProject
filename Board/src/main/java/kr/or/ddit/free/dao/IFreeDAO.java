package kr.or.ddit.free.dao;

import java.util.List;

import kr.or.ddit.vo.FreeVO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface IFreeDAO {

	public int selectFreeCount(PaginationInfoVO<FreeVO> pagingVO);

	public int deleteFree(int boNo);

	public void incrementHit(int boNo);

	public FreeVO selectFree(int boNo);

	public int updateFree(FreeVO freeVO);

	public int insertFree(FreeVO freeVO);

	public List<FreeVO> selectFreeList(PaginationInfoVO<FreeVO> pagingVO);

}
