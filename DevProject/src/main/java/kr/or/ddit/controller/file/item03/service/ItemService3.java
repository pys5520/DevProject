package kr.or.ddit.controller.file.item03.service;

import java.util.List;

import kr.or.ddit.vo.Item3;

public interface ItemService3 {

	public void register(Item3 item);

	public List<Item3> list();

	public Item3 read(int itemId);

	public List<String> getAttach(int itemId);
	
}
