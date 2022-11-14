package kr.co.ezen.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.beans.MemberChildBean;
import kr.co.ezen.mapper.MemberMapper;
@Repository
public class MemberDAO {

	@Autowired
	MemberMapper memberMapper;
	
	public MemberBean getLoginMember(MemberBean MemberBean) {
		return memberMapper.getLoginMember(MemberBean);
		
	}
	
	public MemberBean getModifyMember(int m_memberNo) {
		return memberMapper.getModifyMember(m_memberNo);
	}
	
	public void updateMember(MemberBean modifyMemberBean) {
		memberMapper.updateMember(modifyMemberBean);
	}
	
	public void deleteMemeber(int m_memberNo) {
		memberMapper.deleteMemeber(m_memberNo);
	}
	
	public void joinMember(MemberBean joinMemberBean) {
		memberMapper.joinMember(joinMemberBean);
	}
	
	public MemberBean getMypageMember(int m_memberNo) {
		return memberMapper.getMypageMember(m_memberNo);
	}
	
	public List<MemberChildBean> getMypageMemberChild(int m_memberNo) {
		return memberMapper.getMypageMemberChild(m_memberNo);
	}
}
