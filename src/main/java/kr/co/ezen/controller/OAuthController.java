package kr.co.ezen.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.ezen.service.OAuthService;

@RequestMapping("/member")
@Controller
public class OAuthController {
	@Autowired
	OAuthService oAuthService;
   
	
    @RequestMapping(value="/kakao")
    public String kakaoCallback(@RequestParam("code") String code, Model model, HttpServletRequest request) {
    	 HttpSession session = request.getSession();
    	model.addAttribute("code", code);
    	
        String access_Token = oAuthService.getKakaoAccessToken(code);
        HashMap<String, Object> userInfo = oAuthService.getUserInfo(access_Token);
        System.out.println("login Controller : " + userInfo);
        
        //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
        if (userInfo.get("email") != null) {
            session.setAttribute("userId", userInfo.get("email"));
            session.setAttribute("access_Token", access_Token);
        }
        return "index";
    }

    @RequestMapping(value="/logout")
    public String logout(HttpSession session) {
    	oAuthService.kakaoLogout((String)session.getAttribute("access_Token"));
        session.removeAttribute("access_Token");
        session.removeAttribute("userId");
        return "index";
    }
}

    
