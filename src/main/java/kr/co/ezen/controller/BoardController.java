package kr.co.ezen.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.ezen.beans.AcademyMemberBean;
import kr.co.ezen.beans.AcademyReviewBean;
import kr.co.ezen.beans.AcademySubjectBean;
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
		
		List<AcademyMemberBean> gBoardList =  boardService.getGBoardList();
		
		model.addAttribute("gBoardList", gBoardList);
		
		
		return "board/gBoardList";
	}
	
	//종합 학원 게시판 상세보기
	@GetMapping("/gBoardRead")
	public String gBoardRead_temp(@RequestParam("a_memberNo") int a_memberNo, Model model) {
		
		AcademyMemberBean academyInfoBasic = boardService.getAcademyInfoBasic(a_memberNo);
		List<AcademyReviewBean> academyInfoReview = boardService.getAcademyInfoReview(a_memberNo);
		List<AcademySubjectBean> academyInfoSubject = boardService.getAcademyInfoSubject(a_memberNo);
		
		model.addAttribute("academyInfoBasic",academyInfoBasic);
		model.addAttribute("academyInfoReview",academyInfoReview);
		model.addAttribute("academyInfoSubject",academyInfoSubject);
		
		
		return "board/gBoardRead";
	}
	
	//임시 코드
	@GetMapping("/teacher")
	public String teacher() {
		
		
		return "teacher";
	}
	
	//문의게시판 목록 호출
	@GetMapping("/askBoard")
	public String askBoard() {
		return "board/askBoard";
	}
}
