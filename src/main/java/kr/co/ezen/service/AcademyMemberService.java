package kr.co.ezen.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ezen.beans.AcademyMemberBean;
import kr.co.ezen.dao.AcademyMemberDAO;

@Service
public class AcademyMemberService {

	@Autowired
	private AcademyMemberDAO academyMemberDAO;
	
	@Autowired
	private AcademyMemberBean loginacademyMemberBean;
	
	public void joinAcademyMember(AcademyMemberBean joinAcademyMemberBean) {
		academyMemberDAO.joinAcademyMember(joinAcademyMemberBean);
	}
	
	public void getloginAcademyMember(AcademyMemberBean academyMemberBean) {
		AcademyMemberBean loginacademyMemberBean2 = academyMemberDAO.getloginAcademyMember(academyMemberBean);
		
		if(loginacademyMemberBean2 != null) {
			loginacademyMemberBean.setA_memberNo(loginacademyMemberBean2.getA_memberNo());
			loginacademyMemberBean.setA_id(loginacademyMemberBean2.getA_id());
			loginacademyMemberBean.setA_pw(loginacademyMemberBean2.getA_pw());
			loginacademyMemberBean.setA_name(loginacademyMemberBean2.getA_name());
			loginacademyMemberBean.setA_CRN(loginacademyMemberBean2.getA_CRN());
			loginacademyMemberBean.setA_location(loginacademyMemberBean2.getA_location());
			loginacademyMemberBean.setA_locationDetail(loginacademyMemberBean2.getA_locationDetail());
			loginacademyMemberBean.setA_tele(loginacademyMemberBean2.getA_tele());
			loginacademyMemberBean.setA_joinDate(loginacademyMemberBean2.getA_joinDate());
			loginacademyMemberBean.setA_classify(loginacademyMemberBean2.getA_classify());
			loginacademyMemberBean.setA_infoExpose(loginacademyMemberBean2.getA_infoExpose());
			
			academyMemberBean.setAcademymemberlogin(true);
			
		}
	}
	
	public void modifyAcademyMember(AcademyMemberBean modifyAcademyMemberBean) {
		academyMemberDAO.modifyAcademyMember(modifyAcademyMemberBean);
	}
	
	public AcademyMemberBean getModifyAcademyMember(AcademyMemberBean modifyAcademyMemberBean) {
		modifyAcademyMemberBean.setA_memberNo(loginacademyMemberBean.getA_memberNo());
		AcademyMemberBean modifyAcademyMemberBean2 = academyMemberDAO.getModifyAcademyMember(modifyAcademyMemberBean);
		
		modifyAcademyMemberBean.setA_id(modifyAcademyMemberBean2.getA_id());
		modifyAcademyMemberBean.setA_name(modifyAcademyMemberBean2.getA_name());
		modifyAcademyMemberBean.setA_location(modifyAcademyMemberBean2.getA_location());
		modifyAcademyMemberBean.setA_locationDetail(modifyAcademyMemberBean2.getA_locationDetail());
		modifyAcademyMemberBean.setA_tele(modifyAcademyMemberBean2.getA_tele());
		modifyAcademyMemberBean.setA_classify(modifyAcademyMemberBean2.getA_classify());
		return modifyAcademyMemberBean;
	}
	
	public void deleteAcademyMember(int a_memberNo) {
		academyMemberDAO.deleteAcademyMember(a_memberNo);
	}
}
