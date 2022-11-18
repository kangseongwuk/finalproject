package kr.co.ezen.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.service.BoardService;

//HTML형태의 데이터가 아니라면 사용합니다. 아니라면 json으로 처리를 합니다.
@RestController
public class RestApiController {
	
	@Autowired
	MemberBean loginMemberBean;
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/board/boardListWish/{a_memberNo}")
	public String boardListWish(@PathVariable int a_memberNo, HttpSession session) {
		
		boolean wishCheck = false;
		
		MemberBean mBean = (MemberBean) session.getAttribute("loginMemberBean");
		//System.out.println(mBean.getM_memberNo());
		if(mBean!=null) {
			if(mBean.getM_memberNo()!=0) {
				int m_memberNo = mBean.getM_memberNo();
				
				if(boardService.getWishIs(m_memberNo, a_memberNo)!=null) {
					wishCheck = true;
				}
			}
		}
		
		return wishCheck+"";
	}
	
	@GetMapping("/board/boardListWishOnOff/{a_memberNo}")
	public String boardListWishOnOff(@PathVariable int a_memberNo, HttpSession session) {
		MemberBean mBean = (MemberBean) session.getAttribute("loginMemberBean");
		
		String result = "false";
		
		if(mBean!=null) {
			if(mBean.getM_memberNo()!=0) {
				
				int m_memberNo = mBean.getM_memberNo();
				
				if(boardService.getWishIs(m_memberNo, a_memberNo)!=null) {
					result = "off";
					boardService.deleteWish(m_memberNo, a_memberNo);
				} else if(boardService.getWishIs(m_memberNo, a_memberNo)==null) {
					result = "on";
					boardService.insertWish(m_memberNo, a_memberNo);
				} else {
					result = "error";
				}
			}
		}
		
		return result;
	}
	
}
