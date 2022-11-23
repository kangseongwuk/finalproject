package kr.co.ezen.service;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ezen.beans.AcademyPayBean;
import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.dao.PayDAO;

@Service
public class PayService {

	@Autowired
	PayDAO payDAO;

	public void add_amonth(AcademyPayBean academyPayBean) {
		payDAO.add_amonth(academyPayBean);
	}
	
	public void add_halfyear(AcademyPayBean academyPayBean) {
		payDAO.add_halfyear(academyPayBean);
	}
	
	public void add_ayear(AcademyPayBean academyPayBean) {
		payDAO.add_ayear(academyPayBean);
	}

	public void insertpay(AcademyPayBean academyPayBean) {
		payDAO.insertpay(academyPayBean);
	}

	public int paycheck(HttpServletResponse response, AcademyPayBean academyPayBean) throws Exception {
		
			response.setContentType("text/html;charset=utf-8");
			int cd = Integer.parseInt(payDAO.check_duplication(academyPayBean.getA_memberNo()));
			PrintWriter out = response.getWriter();
			
			// a_memberNo로 테이블 중복조회
			if (cd == 0) {
				out.print("등록되지 않은 아이디입니다. 멤버십 가입을 환영합니다.");
				out.close();
				
			} else {
				out.print("항상 이용해주셔서 감사합니다.");
				out.close();
			}
			return cd;
			
		}
		


}
