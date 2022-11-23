package kr.co.ezen.controller;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.CDATASection;

import kr.co.ezen.beans.AcademyPayBean;
import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.dao.PayDAO;
import kr.co.ezen.service.PayService;

@RequestMapping("/pay")
@Controller
public class PayController {

	@Autowired
	PayService payService;

	@Autowired
	MemberBean loginMemberBean;
	
	@Autowired
	PayDAO payDAO;

	@GetMapping("/pay_success")
	public void pay_success(Model model) {
	}

	@GetMapping("/pay_howlong")
	public void pay_howlong(Model model) {
	}

	@RequestMapping(value = "/send.do", method = RequestMethod.POST)
	@ResponseBody
	public void paySend(@RequestBody AcademyPayBean academyPayBean, HttpServletResponse response) throws Exception {

		// System.out.println(academyPayBean.getA_memberNo()); // 값 받아왔는지 테스트
		payService.paycheck(response, academyPayBean);
		int cd = Integer.parseInt(payDAO.check_duplication(academyPayBean.getA_memberNo()));

		Timestamp SS = academyPayBean.getA_payStart();
		Timestamp EE = academyPayBean.getA_payEnd();

		academyPayBean.setA_payStart(SS);
		academyPayBean.setA_payEnd(EE);
		// 출력 테스트

		System.out.println(loginMemberBean.getM_memberNo());
		System.out.println(academyPayBean.getAmount());
		System.out.println(academyPayBean.getA_payStart());

		if (cd == 0) {
			// 결제가 종료된 시점에서 db에 등록
			payService.insertpay(academyPayBean);
		} else {
			// 가격에 따라 종료일을 다르게
			switch (academyPayBean.getAmount()) {
			case "100":
				payService.add_amonth(academyPayBean);
				break;
			case "500":
				payService.add_halfyear(academyPayBean);
				break;
			case "1000":
				payService.add_ayear(academyPayBean);
				break;
			default:
				break;
			}
		}
		// 결제 성공 시 페이지 이동

	}
}
