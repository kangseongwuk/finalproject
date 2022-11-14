package kr.co.ezen.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.ezen.beans.AcademyMemberBean;

public interface AcademyMemberMapper {

	@Insert("insert into academyMemberT(a_memberNo, a_id, a_pw, a_name,"
			+ " a_CRN, a_location, a_locationDetail, a_tele, a_classify)"
			+ "values(a_sq.nextval, #{a_id}, #{a_pw}, #{a_name}, #{a_CRN},"
			+ " #{a_location}, #{a_locationDetail}, #{a_tele}, #{a_classify})")
	void joinAcademyMember(AcademyMemberBean joinAcademyMemberBean);
	
	@Select("select * from academyMemberT where a_id = #{a_id, jdbcType=VARCHAR} and a_pw = #{a_pw, jdbcType=VARCHAR}")
	AcademyMemberBean getloginAcademyMember(AcademyMemberBean academyMemberBean);
	
	@Select("select * from academyMemberT where a_memberNo = #{a_memberNo}")
	AcademyMemberBean getModifyAcademyMember(AcademyMemberBean modifyAcademyMemberBean);
	
	@Update("update academyMemberT set a_location = #{a_location}, a_locationDetail = #{a_locationDetail},"
			+ "a_tele = #{a_tele}, a_classify = #{a_classify} where a_memberNo = #{a_memberNo}")
	void modifyAcademyMember(AcademyMemberBean modifyAcademyMemberBean);
	
	@Delete("delete from academyMemberT where a_memberNo = #{a_memberNo}")
	void deleteAcademyMember(int a_memberNo);
}
