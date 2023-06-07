package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.Item3;

public interface ItemMapper3 {

	public void register(Item3 item);

	public void addAttach(String fileName);

	public List<Item3> list();

	public Item3 read(int itemId);

	public List<String> getAttach(int itemId);

}
