package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.Board;

public interface BoardMapper {
	public void create(Board board);

	public List<Board> list();

}
