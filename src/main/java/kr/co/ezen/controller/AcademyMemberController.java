package kr.co.ezen.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.validator.internal.util.stereotypes.Lazy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.ezen.beans.AcademyMemberBean;
import kr.co.ezen.service.AcademyMemberService;
@RequestMapping("/academymember")
@Controller
public class AcademyMemberController {
	
	@Autowired
	@Lazy
	private AcademyMemberBean loginAcademyMemberBean;
	
	@Autowired
	private AcademyMemberService academyMemberService;
	
	@GetMapping("/join")
	public String join(@ModelAttribute("joinAcademyMemberBean") AcademyMemberBean joinAcademyMemberBean) {
	 
		return "academymember/join";
	}
	
	@PostMapping("/join_pro")
	public String join_pro(@ModelAttribute("joinAcademyMemberBean") AcademyMemberBean joinAcademyMemberBean, BindingResult result){
	if(result.hasErrors()) {
		return "academymember/join";
	}
	academyMemberService.joinAcademyMember(joinAcademyMemberBean);
		return "index";
	}
	
	@GetMapping("/login")
	public String login(@ModelAttribute("loginAcademyMemberBean") AcademyMemberBean loginAcademyMemberBean, Model model){
		
		model.addAttribute("loginAcademyMemberBean", loginAcademyMemberBean);
		
		return "academymember/login";
	}
	
	@PostMapping("login_pro")
	public String login_pro(@ModelAttribute("loginAcademyMemberBean") AcademyMemberBean loginAcademyMemberBean, BindingResult result, HttpServletRequest request) {
		if(result.hasErrors()) {
			return "academymember/login";
		}
		academyMemberService.getloginAcademyMember(loginAcademyMemberBean);
		
		if(loginAcademyMemberBean.isAcademymemberlogin() == true) {
			HttpSession session = request.getSession();
			session.setAttribute("loginAcademyMemberBean", loginAcademyMemberBean);
			loginAcademyMemberBean.setAcademymemberlogin(true);
			return "academymember/login_success";
		}else {
			loginAcademyMemberBean.setAcademymemberlogin(false);
			return "index";
		}
		
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	
	@GetMapping("modify")
	public String modify(@ModelAttribute("modifyAcademyMemberBean") AcademyMemberBean modifyAcademyMemberBean) {
		modifyAcademyMemberBean.setA_memberNo(loginAcademyMemberBean.getA_memberNo());
		academyMemberService.getModifyAcademyMember(modifyAcademyMemberBean);
		return "academymember/modify";
	}
	
	@PostMapping("modify_pro")
	public String modify_pro(@ModelAttribute("modifyAcademyMemberBean") AcademyMemberBean modifyAcademyMemberBean, BindingResult result) {
		if(result.hasErrors()) {
			return "academymember/modify";
		}
		modifyAcademyMemberBean.setA_memberNo(loginAcademyMemberBean.getA_memberNo());
		academyMemberService.modifyAcademyMember(modifyAcademyMemberBean);
		return "academymember/login_success";
	}
	
	@GetMapping("delete")
	public String delete(HttpSession session) {
		academyMemberService.deleteAcademyMember(loginAcademyMemberBean.getA_memberNo());
		session.invalidate();
		return "index";
	}
	
	@GetMapping("/introduce")
	public String introduce(@ModelAttribute("introduceAcademyMemberBean")AcademyMemberController introduceAcademyMemberController) {
		
		return "academymember/introduce";
	}
}
