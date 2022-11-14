package kr.co.ezen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.beans.MemberChildBean;
import kr.co.ezen.dao.MemberDAO;
@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private MemberBean loginMemberBean;
	
	public void getLoginMember(MemberBean MemberBean) {
		MemberBean loginMemberBean2 = memberDAO.getLoginMember(MemberBean);
		
		if(loginMemberBean2 != null) {
			loginMemberBean.setM_classify(loginMemberBean2.getM_classify());
			loginMemberBean.setM_memberNo(loginMemberBean2.getM_memberNo());
			loginMemberBean.setM_id(loginMemberBean2.getM_id());
			loginMemberBean.setM_pw(loginMemberBean2.getM_pw());
			loginMemberBean.setM_name(loginMemberBean2.getM_name());
			loginMemberBean.setM_birth(loginMemberBean2.getM_birth());
			loginMemberBean.setM_gender(loginMemberBean2.getM_gender());
			loginMemberBean.setM_tele(loginMemberBean2.getM_tele());
			loginMemberBean.setM_joinDate(loginMemberBean2.getM_joinDate());
			loginMemberBean.setM_email(loginMemberBean2.getM_email());
			loginMemberBean.setM_confirm(loginMemberBean2.getM_confirm());
			
			MemberBean.setMemberlogin(true);
		}
	}
	
	public MemberBean getModifyMember(MemberBean modifyMemberBean) {
		
		MemberBean modifyMemberBean2 = memberDAO.getModifyMember(loginMemberBean.getM_memberNo());
		
		
		modifyMemberBean.setM_id(modifyMemberBean2.getM_id());
		modifyMemberBean.setM_name(modifyMemberBean2.getM_name());
		
		return modifyMemberBean;
	}
	
	public void updateMember(MemberBean modifyMemberBean) {
		modifyMemberBean.setM_memberNo(loginMemberBean.getM_memberNo());
		memberDAO.updateMember(modifyMemberBean);
	}
	
	public void deleteMemeber(int m_memberNo) {
		
		memberDAO.deleteMemeber(loginMemberBean.getM_memberNo());
	}
	
	public void joinMember(MemberBean joinMemberBean) {
		memberDAO.joinMember(joinMemberBean);
	}
	
	public MemberBean getMypageMember(MemberBean mypageMemberBean) {
		
		MemberBean mypageMemberBean2 = memberDAO.getMypageMember(loginMemberBean.getM_memberNo());
		
		
		mypageMemberBean.setM_id(mypageMemberBean2.getM_id());
		mypageMemberBean.setM_name(mypageMemberBean2.getM_name());
		mypageMemberBean.setM_tele(mypageMemberBean2.getM_tele());
		mypageMemberBean.setM_email(mypageMemberBean2.getM_email());
		
		return mypageMemberBean;
	}
	public List<MemberChildBean> getMypageMemberChild(int m_memberNo) {
		return memberDAO.getMypageMemberChild(m_memberNo);
	}

}
