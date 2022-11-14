package kr.co.ezen.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.beans.MemberChildBean;

public interface MemberMapper {
	//일반회원로그인
	@Select("select * from memberT where m_id = #{m_id} and m_pw = #{m_pw}")
	 MemberBean getLoginMember(MemberBean memberBean);
	//일반회원정보수정
	@Select("select m_id, m_name from memberT where m_memberNo = #{m_memberNo}")
	MemberBean getModifyMember(int m_memberNo);
	//일반회원mypage 일반회원정보
	@Select("select m_name, m_id, m_tele, m_email from memberT where m_memberNo = #{m_memberNo}")
	MemberBean getMypageMember(int m_memberNo);
	//일반회원mypage 일반회원자녀정보
	@Select("select c_name, c_grade, c_gender, c_level from memberChildT where m_memberNo = #{m_memberNo}")
	List<MemberChildBean> getMypageMemberChild(int m_memberNo);
	//일반회원수정
	@Update("update memberT set m_pw = #{m_pw}, m_tele = #{m_tele}, m_email = #{m_email} where m_memberNo = #{m_memberNo}")
	 void updateMember(MemberBean modifyMemberBean);
	//일반회원탈퇴
	@Delete("delete from memberChildT where m_memberNo = #{m_memberNo}")
	void deleteAllChild(int m_memberNo);
	@Delete("delete from memberT where m_memberNo = #{m_memberNo}")
	 void deleteMemeber(int m_memberNo);
	@Delete("delete from wishListT where m_memberNo = #{m_memberNo}")
	 void deleteWishList(int m_memberNo);
	
	//일반회원가입
	@Insert("insert into membert(m_memberNo,m_id,m_pw,m_name,m_birth,m_gender,m_tele,m_email) "
			+ "values(m_sq.nextval, #{m_id}, #{m_pw}, #{m_name}, #{m_birth}, #{m_gender}, #{m_tele}, #{m_email})")
	 void joinMember(MemberBean joinMemberBean);
	//자녀정보입력
	@Insert("insert into memberChildT(m_memberNo, c_name, c_grade, c_gender, c_level)"
			+ "values(#{m_memberNo}, #{c_name}, #{c_grade}, #{c_gender}, #{c_level})")
	void insertChild(MemberChildBean insertChildBean);
	//자녀정보수정페이지
	@Select("select * from memberChildT where m_memberNo = #{m_memberNo} and c_name = #{c_name}")
	MemberChildBean getModifyChild(MemberChildBean modifyChildBean);
	//자녀정보수정
	@Update("update memberChildT set c_grade = #{c_grade}, c_gender = #{c_gender}, c_level = #{c_level} "
			+ "where m_memberNo = #{m_memberNo} and c_name = #{c_name}")
	void modifyChild(MemberChildBean modifyChild);
	//자녀정보삭제
	@Delete("delete from memberChildT where m_memberNo = #{m_memberNo} and c_name = #{c_name}")
	 void deleteChild(MemberChildBean deleteChildBean);
	
	 
}
