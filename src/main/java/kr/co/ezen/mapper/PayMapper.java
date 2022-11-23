package kr.co.ezen.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.ezen.beans.AcademyPayBean;

public interface PayMapper {
	
	@Insert("insert into academyPayT(a_memberNo, a_payStart, a_payEnd) values(#{a_memberNo}, #{a_payStart}, #{a_payStart}) ")
	void insertpay(AcademyPayBean academyPayBean);

	@Update("update academyPayT set a_payEnd = add_months(#{a_payStart}, 1) where a_memberNo = #{a_memberNo} and a_payStart=#{a_payStart}")
	void add_amounth(AcademyPayBean academyPayBean);

	@Update("update academyPayT set a_payEnd = add_months(#{a_payStart}, 6) where a_memberNo = #{a_memberNo} and a_payStart=#{a_payStart}")
	void add_halfyear(AcademyPayBean academyPayBean);
	
	@Update("update academyPayT set a_payEnd = add_months(#{a_payStart}, 12) where a_memberNo = #{a_memberNo} and a_payStart=#{a_payStart}")
	void add_ayears(AcademyPayBean academyPayBean);

	@Select("select count(*) from academyPayT where a_memberNo = #{a_memberNo}")
	String check_duplication(String a_memberNo);

}
 