package kr.co.ezen.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.co.ezen.beans.AcademyMemberBean;
import kr.co.ezen.beans.AcademyReviewBean;
import kr.co.ezen.beans.AcademySubjectBean;


public interface BoardMapper {
	
	//종합 학원 게시판 목록 호출
	@Select("select a_memberNo, a_name, a_location, a_locationDetail, a_tele, a_joinDate, a_classify, a_infoExpose, "
			+ "a_introduce, a_mainImg, a_file, a_gradeMin, a_gradeMax, a_shuttle, a_openTime, a_closeTime "
			+ "from academyMemberT natural join academyInfoT "
			+ "where a_classify = 1	"
			+ "order by a_joinDate desc")
	List<AcademyMemberBean> getGBoardList();
	
	

	//종합 학원 정보 상세 보기
	@Select("select a_memberNo, a_name, a_location, a_locationDetail, a_tele, a_joinDate, a_classify, a_infoExpose, "
			+ "a_introduce, a_mainImg, a_file, a_gradeMin, a_gradeMax, a_shuttle, a_openTime, a_closeTime "
			+ "from academyMemberT natural join academyInfoT "
			+ "where a_memberNo = #{a_memberNo}"
			+ "order by a_joinDate desc")
	AcademyMemberBean getAcademyInfoBasic(int a_memberNo);
	
	//학원 리뷰 조회
	@Select("select a_memberNo, r_no, r_writerNo, r_writerId, r_contents, r_score, r_writeTime "
			+ "from reviewT "
			+ "where a_memberNo = #{a_memberNo} "
			+ "order by r_no desc")
	List<AcademyReviewBean> getAcademyInfoReview(int a_memberNo);
	
	//학원 과목 조회
	@Select("select a_memberNo, a_subject "
			+ "from academySubjectT "
			+ "where a_memberNo = #{a_memberNo} "
			+ "order by a_subject")
	List<AcademySubjectBean> getAcademyInfoSubject(int a_memberNo);
	
}
