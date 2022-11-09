package kr.co.ezen.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.co.ezen.beans.academyMemberBean;


public interface BoardMapper {
	
	//종합 학원 게시판 목록 호출
	@Select("select a_memberNo, a_name, a_location, a_locationDetail, a_tele, a_joinDate, a_classify, a_infoExpose, "
			+ "a_introduce, a_mainImg, a_file, a_gradeMin, a_gradeMax, a_shuttle, a_openTime, a_closeTime "
			+ "from academyMemberT natural join academyInfoT "
			+ "where a_classify = 1	"
			+ "order by a_joinDate desc")
	List<academyMemberBean> getGBoardList();

}
