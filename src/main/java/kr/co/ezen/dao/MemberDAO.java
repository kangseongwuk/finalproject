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
	
 	public void insertChild(MemberChildBean insertChildBean) {
 		memberMapper.insertChild(insertChildBean);
 	}
 	
 	public MemberChildBean getModifyChild(MemberChildBean modifyChildBean) {
 		return memberMapper.getModifyChild(modifyChildBean);
 	}
 	
 	public void modifyChild(MemberChildBean modifyChild) {
 		memberMapper.modifyChild(modifyChild);
 	}
 	
 	public void deleteChild(MemberChildBean deleteChildBean) {
 		memberMapper.deleteChild(deleteChildBean);
 	}
 	
 	public void deleteAllChild(int m_memberNo) {
 		memberMapper.deleteAllChild(m_memberNo);
 	}
 	
 	public void deleteWishList(int m_memberNo) {
 		memberMapper.deleteWishList(m_memberNo);
 	}
}
