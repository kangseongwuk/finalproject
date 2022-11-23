package kr.co.ezen.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import kr.co.ezen.beans.AcademyMemberBean;
import kr.co.ezen.mapper.AcademyMemberMapper;

@Repository
public class AcademyMemberDAO {

	@Autowired
	public AcademyMemberMapper academyMemberMapper;
	
	public void joinAcademyMember(AcademyMemberBean joinAcademyMemberBean) {
		
		academyMemberMapper.joinAcademyMember(joinAcademyMemberBean);
	}
	
	public AcademyMemberBean getloginAcademyMember(AcademyMemberBean academyMemberBean) {
		
		return academyMemberMapper.getloginAcademyMember(academyMemberBean);
	}
	
	public void modifyAcademyMember(AcademyMemberBean modifyAcademyMemberBean) {
		academyMemberMapper.modifyAcademyMember(modifyAcademyMemberBean);
	}
	
	public AcademyMemberBean getModifyAcademyMember(AcademyMemberBean modifyAcademyMemberBean) {
		return academyMemberMapper.getModifyAcademyMember(modifyAcademyMemberBean);
	}
	
	public void deleteAcademyMember(int a_memberNo) {
		academyMemberMapper.deleteAcademyMember(a_memberNo);
	}
	
	public void insertAcademyIntroduce(AcademyMemberBean introduceAcademyMemberBean) {
		academyMemberMapper.insertAcademyIntroduce(introduceAcademyMemberBean);
	}
	
	public AcademyMemberBean infoIntroduce(int a_memberNo) {
		return academyMemberMapper.infoIntroduce(a_memberNo);
	}
	
	public void modifyAcademyIntroduce(AcademyMemberBean infoIntroduce) {
		academyMemberMapper.modifyAcademyIntroduce(infoIntroduce);
	}
	
	public void deleteAcademyIntroduce(int a_memberNo) {
		academyMemberMapper.deleteAcademyIntroduce(a_memberNo);
	}
}
