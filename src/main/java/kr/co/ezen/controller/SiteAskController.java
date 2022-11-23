package kr.co.ezen.controller;

import java.sql.Timestamp;
import java.util.List;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import kr.co.ezen.beans.SiteAskBean;
import kr.co.ezen.service.SiteAskService;

@Controller
@RequestMapping("/serviceBoard")
public class SiteAskController {

	@Autowired
	private SiteAskService siteAskService;		


	@GetMapping("/siteAskList")
	public String main(Model model) {
			
		List<SiteAskBean> salist =  siteAskService.getSaList();		
		model.addAttribute("salist", salist);
		
		return "serviceBoard/siteAskList";
	}
	
	@GetMapping("/siteAskRead")
	public String read(@RequestParam("sa_time") Timestamp sa_time,
						Model model) {
		
		SiteAskBean saReadBean = siteAskService.getSaInfo(sa_time);
		model.addAttribute("saReadBean", saReadBean);
		
		//login한 사람의 인덱스 번호				
		return "serviceBoard/siteAskRead";
	}	
	
	@GetMapping("/siteAskWrite")
	public String write(@RequestParam("m_memberNo") int m_memberNo,
						@ModelAttribute("saWriteBean") SiteAskBean saWriteBean,
						Model model) {
				
		//saWriteBean = siteAskService.getSaContentPage(m_memberNo);
		model.addAttribute("saWriteBean", saWriteBean);
		
		return "serviceBoard/siteAskWrite";
	}
	
	@PostMapping("/siteAskWrite_pro")
	public String write_pro(@ModelAttribute("saWriteBean") SiteAskBean saWriteBean, BindingResult result) {
		
		if(result.hasErrors()) {
			return "serviceBoard/siteAskWrite";
		}
		// upload 처리 
		siteAskService.addSaContent(saWriteBean);
	
		return "serviceBoard/siteAskWrite_success";
	}	
	
	@GetMapping("/siteAskWrite_fail")
	public String siteABoardWrite_fail() {
		return "serviceBoard/siteAskWrite_fail";
	}
	
}
