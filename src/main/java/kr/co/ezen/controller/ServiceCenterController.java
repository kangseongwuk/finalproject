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

import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.beans.ServiceCenterBean;
import kr.co.ezen.service.ServiceCenterService;

@Controller
@RequestMapping("/serviceBoard")
public class ServiceCenterController {

	@Autowired
	private ServiceCenterService serviceCenterService;		
	
	@Autowired
	private MemberBean loginMemberBean;
	
	
	@GetMapping("/noticeBoardList")
	public String main(Model model) {
	
		List<ServiceCenterBean> nblist =  serviceCenterService.getNbList();		
		model.addAttribute("nblist", nblist);
		
		return "serviceBoard/noticeBoardList";
	}
	
	@GetMapping("/noticeBoardRead")
	public String read(@RequestParam("nb_no") int nb_no,
						Model model) {
		
		ServiceCenterBean nbReadBean = serviceCenterService.getNbInfo(nb_no);
		model.addAttribute("nbReadBean", nbReadBean);
		
		//login한 사람의 인덱스 번호				
		return "serviceBoard/noticeBoardRead";
	}	
	
	@GetMapping("/noticeBoardWrite")
	public String write(@ModelAttribute("nbWriteBean") ServiceCenterBean nbWriteBean) {
				
		return "serviceBoard/noticeBoardWrite";
	}
	
	@PostMapping("/noticeBoardWrite_pro")
	public String write_pro(@ModelAttribute("nbWriteBean") ServiceCenterBean nbWriteBean, BindingResult result) {
		
		if(result.hasErrors()) {
			return "serviceBoard/noticeBoardWrite";
		}
		// upload 처리 
		serviceCenterService.addNbContent(nbWriteBean);
	
		return "serviceBoard/noticeBoardWrite_success";
	}	
	
	@GetMapping("/noticeBoardWrite_fail")
	public String noticeBoardWrite_fail() {
		return "serviceBoard/noticeBoardWrite_fail";
	}
	
	
	//수정
	@GetMapping("/noticeBoardModify")
	public String modify(@RequestParam("nb_no") int nb_no, 
						@ModelAttribute("nbModifyBean") ServiceCenterBean nbModifyBean,
						Model model) {
		
		nbModifyBean = serviceCenterService.getNbInfo(nb_no);
		model.addAttribute("modifyNbBean", nbModifyBean);
		
		model.addAttribute("loginMemberBean", loginMemberBean);
		
		//게시들 내용 수정 모드로 불러오기
		ServiceCenterBean serviceBean = serviceCenterService.getNbInfo(nb_no);
		
		nbModifyBean.setNb_writer(serviceBean.getNb_writer());
		nbModifyBean.setNb_modifyTime(serviceBean.getNb_writeTime());
		nbModifyBean.setNb_title(serviceBean.getNb_title());
		nbModifyBean.setNb_contents(serviceBean.getNb_contents());
		nbModifyBean.setNb_file(serviceBean.getNb_file());
		
		
		//idx가 0인 오류는 아래처럼 해줍니다.
		nbModifyBean.setNb_no(nb_no);	
		
		return "serviceBoard/noticeBoardModify";
	}
	
	@PostMapping("/noticeBoardModify_pro")
	public String modify_pro(@ModelAttribute("nbModifyBean") ServiceCenterBean nbModifyBean, 
																				BindingResult result,
																				Model model) {	
		if(result.hasErrors()) {
			return "serviceBoard/noticeBoardModify";
		}
		// upload 처리 
		serviceCenterService.modifyNbInfo(nbModifyBean);
		
		return "serviceBoard/noticeBoardModify_success";
	}
		
	
	//삭제
	@GetMapping("/noticeBoardDelete")
	public String delete(@RequestParam("nb_no") int nb_no,
						Model model) {
		
		serviceCenterService.delNbInfo(nb_no);
		
		return "serviceBoard/noticeBoardDelete";
	}
	
}
