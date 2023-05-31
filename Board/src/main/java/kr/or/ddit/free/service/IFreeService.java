package kr.or.ddit.free.service;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.FreeVO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface IFreeService {

	public ServiceResult deleteFree(int boNo);

	public FreeVO selectFree(int boNo);

	public ServiceResult updateFree(FreeVO freeVO);

	public ServiceResult insertFree(FreeVO freeVO);

	public int selectFreeCount(PaginationInfoVO<FreeVO> pagingVO);

	public List<FreeVO> selectFreeList(PaginationInfoVO<FreeVO> pagingVO);

}
