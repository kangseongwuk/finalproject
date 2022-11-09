package kr.co.ezen.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.co.ezen.beans.academyMemberBean;
import kr.co.ezen.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	//종합 학원 게시판 목록 호출
	@GetMapping("/gBoardList")
	public String main(Model model) {
		
		//ModelAndView 개념
		
		List<academyMemberBean> gBoardList =  boardService.getGBoardList();
		model.addAttribute("gBoardList", gBoardList);
		
		return "board/gBoardList";
	}
}
