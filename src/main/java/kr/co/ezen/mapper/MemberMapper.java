package kr.co.ezen.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.beans.MemberChildBean;

public interface MemberMapper {

	@Select("select * from memberT where m_id = #{m_id} and m_pw = #{m_pw}")
	 MemberBean getLoginMember(MemberBean memberBean);
	
	@Select("select m_id, m_name from memberT where m_memberNo = #{m_memberNo}")
	MemberBean getModifyMember(int m_memberNo);
	
	@Select("select m_name, m_id, m_tele, m_email from memberT where m_memberNo = #{m_memberNo}")
	MemberBean getMypageMember(int m_memberNo);
	
	@Select("select c_name, c_grade, c_gender, c_level from memberChildT where m_memberNo = #{m_memberNo}")
	List<MemberChildBean> getMypageMemberChild(int m_memberNo);
	
	@Update("update memberT set m_pw = #{m_pw}, m_tele = #{m_tele}, m_email = #{m_email} where m_memberNo = #{m_memberNo}")
	 void updateMember(MemberBean modifyMemberBean);
	
	@Delete("delete from memberT where m_memberNo = #{m_memberNo}")
	 void deleteMemeber(int m_memberNo);
	
	@Insert("insert into membert(m_memberNo,m_id,m_pw,m_name,m_birth,m_gender,m_tele,m_email) "
			+ "values(m_sq.nextval, #{m_id}, #{m_pw}, #{m_name}, #{m_birth}, #{m_gender}, #{m_tele},#{m_email})")
	 void joinMember(MemberBean joinMemberBean);
}
