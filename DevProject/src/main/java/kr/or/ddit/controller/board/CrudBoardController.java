package kr.or.ddit.controller.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.service.IBoardService;
import kr.or.ddit.vo.Board;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/crud/board")
@Slf4j
public class CrudBoardController {
	
	@Inject
	private IBoardService service;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String crudRegisterForm(Model model) {
		log.info("crudRegisterForm()실행...!");
		model.addAttribute("board", new Board());
		return "crud/register";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String crudRegister(Board board, Model model) {
		log.info("crudRegister()실행...!");
		
		service.register(board);
		
		model.addAttribute("msg", "등록이 완료되었습니다.");
		return "crud/success";
	}
	
	@RequestMapping(value = "/list", method= RequestMethod.GET)
	public String crudList(Model model) {
		log.info("crudList()실행...!");
		List<Board> boardList = service.list();
		model.addAttribute("boardList", boardList);
		return "crud/list";
	}
}












