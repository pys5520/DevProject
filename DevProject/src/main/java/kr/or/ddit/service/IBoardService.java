package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.vo.Board;

public interface IBoardService {

	public void register(Board board);

	public List<Board> list();
	
}
