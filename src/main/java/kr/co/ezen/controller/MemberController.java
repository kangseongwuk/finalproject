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
import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	@Lazy
	MemberBean loginMemberBean;
	
	
	
	@GetMapping("/login")
	public String login(@ModelAttribute("loginMemberBean") MemberBean loginMemberBean, Model model) {
		
		model.addAttribute("loginMemberBean", loginMemberBean);
		
		return "member/login";
	}
	
	@PostMapping("/login_pro")
	public String login_pro(@ModelAttribute("loginMemberBean") MemberBean loginMemberBean, BindingResult result, HttpServletRequest request){
		if(result.hasErrors()) {
			return "member/login";
		}
		memberService.getLoginMember(loginMemberBean);
		
		if(loginMemberBean.isMemberlogin() == true) {
			 HttpSession session = request.getSession();
			 session.setAttribute("loginMemberBean", loginMemberBean);
			loginMemberBean.setMemberlogin(true);
			return "member/login_success";
		}else {
			loginMemberBean.setMemberlogin(false);
			return "member/login_fail";
		}
		
		
	}
	
	@GetMapping("/modify")
	public String modify(@ModelAttribute("modifyMemberBean") MemberBean modifyMemberBean) {
		
		memberService.getModifyMember(modifyMemberBean);
		
		return "member/modify";
	}
	@PostMapping("/modify_pro")
	public String modify_pro(@ModelAttribute("modifyMemberBean") MemberBean modifyMemberBean, BindingResult result) {
		if(result.hasErrors()) {
			return "member/modify";
		}
		memberService.updateMember(modifyMemberBean);
		return "modify_success";
	}
	@GetMapping("/delete")
	public String delete(int m_memberNo, HttpSession session) {
		
		memberService.deleteMemeber(loginMemberBean.getM_memberNo());
		session.invalidate();
		return "member/delete";
	}
	
	@GetMapping("/join")
	public String join(@ModelAttribute("joinMemberBean") MemberBean joinMemberBean) {
		
		
		return "member/join";
	}
	@PostMapping("/join_pro")
	public String join_pro(@ModelAttribute("joinMemberBean") MemberBean joinMemberBean, BindingResult result) {
		
		if(result.hasErrors()) {
			return "member/join";
		}
		memberService.joinMember(joinMemberBean);
		return "index";
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
}
