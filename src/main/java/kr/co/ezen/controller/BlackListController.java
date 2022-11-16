package kr.co.ezen.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.ezen.beans.BlackListBean;
import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.beans.PageCountBean;
import kr.co.ezen.service.BlackListService;

@Controller
@RequestMapping("/blackList")
public class BlackListController {
	
	@SuppressWarnings("unused")
	@Autowired
	private BlackListService blackListService;

	@Autowired
	private MemberBean loginMemberBean;


	@GetMapping("/blackListList") 
		public String main(
						   @RequestParam(value = "page", defaultValue = "1") int page,
						   Model model) {

		List<BlackListBean> bllist = blackListService.getBlList(page);
		model.addAttribute("bllist", bllist); 
			
		PageCountBean pageCountBean = blackListService.getContentCnt(page);
		model.addAttribute("pageCountBean", pageCountBean);
		
		model.addAttribute("page", page);
		
		return "blackList/blackListList";
	}
	
	//검색
	@GetMapping("/blackSearchList") 
	public String blackSearchList(@RequestParam("m_memberNo") int m_memberNo,
					   @RequestParam(value = "page", defaultValue = "1") int page,
					   Model model) {
	
		
	List<BlackListBean> blSearchlist = blackListService.getBlSearchList(m_memberNo, page);
	model.addAttribute("blSearchlist", blSearchlist); 
		
	PageCountBean pageCountBean = blackListService.getContentCnt(page);
	model.addAttribute("pageCountBean", pageCountBean);
	
	model.addAttribute("page", page);
	
	return "blackList/blackListList";
	}
	
	@GetMapping("/blackListRead")
	public String read(@RequestParam("m_memberNo") int m_memberNo, @RequestParam("a_memberNo") int a_memberNo,
			Model model) {

		// blackListService.viewCountBlInfo(m_memberNo);

		BlackListBean blReadBean = blackListService.getBlInfo(m_memberNo, a_memberNo);
		model.addAttribute("blReadBean", blReadBean);

		// login한 사람의 인덱스 번호
		return "blackList/blackListRead";
	}

	@GetMapping("/blackListWrite")
	public String write(@ModelAttribute("blWriteBean") BlackListBean blWriteBean

	) {

		return "blackList/blackListWrite";
	}

	@PostMapping("blackListWrite_pro")
	public String write_pro(@ModelAttribute("blWriteBean") BlackListBean blWriteBean, BindingResult result) {

		if (result.hasErrors()) {
			return "blackList/blackListWrite";
		}
		// upload 처리
		blackListService.addBlContent(blWriteBean);

		return "blackList/blackListWrite_success";
	}

	@GetMapping("/blackListWrite_fail")
	public String noticeBoardWrite_fail() {
		return "blackList/blackListWrite_fail";
	}

	// 수정
	@GetMapping("/blackListModify")
	public String blackListModify(@RequestParam("m_memberNo") int m_memberNo,
			@RequestParam("a_memberNo") int a_memberNo, @ModelAttribute("blModifyBean") BlackListBean blModifyBean,
			Model model) {

		model.addAttribute("m_memberNo", m_memberNo);
		model.addAttribute("a_memberNo", a_memberNo);

		blModifyBean = blackListService.getBlModifyPage(m_memberNo, a_memberNo);
		model.addAttribute("blModifyBean", blModifyBean);

		BlackListBean tempContentDataBean = blackListService.getBlInfo(m_memberNo, a_memberNo);

		blModifyBean.setBlack_contents(tempContentDataBean.getBlack_contents());
		blModifyBean.setUpload_file(tempContentDataBean.getUpload_file());

		// idx가 0인 오류는 아래처럼 해줍니다.
		blModifyBean.setM_memberNo(m_memberNo);
		blModifyBean.setA_memberNo(a_memberNo);

		return "blackList/blackListModify";
	}

	@PostMapping("/blackListModify_pro")
	public String blackListModify_pro(@ModelAttribute("blModifyBean") BlackListBean blModifyBean, BindingResult result,
			Model model) {
		if (result.hasErrors()) {
			return "blackList/blackListModify";
		}
		// upload 처리
		blackListService.modifyBlInfo(blModifyBean);

		return "blackList/blackListModify_success";
	}

	// 삭제
	@GetMapping("/blackListDelete")
	public String delete(@RequestParam("m_memberNo") int m_memberNo, @RequestParam("a_memberNo") int a_memberNo,
			Model model) {
		blackListService.delBlInfo(m_memberNo, a_memberNo);

		model.addAttribute("m_memberNo", m_memberNo);
		model.addAttribute("a_memberNo", a_memberNo);

		return "blackList/blackListDelete";
	}

}
