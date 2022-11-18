package kr.co.ezen.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.ezen.beans.AcademyMemberBean;
import kr.co.ezen.beans.AcademyReviewBean;
import kr.co.ezen.beans.AcademySubjectBean;
import kr.co.ezen.beans.AcademyTeacherBean;
import kr.co.ezen.beans.TeacherReviewBean;
import kr.co.ezen.beans.WishListBean;


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
	
	//학원별 강사 조회
	@Select("select a_memberNo, t_name, t_subject, t_contents, t_file "
			+ "from academyTeacherT "
			+ "where a_memberNo = #{a_memberNo}")
	List<AcademyTeacherBean> getAcademyInfoTeacher(int a_memberNo);
	
	//개별 강사 조회
		@Select("select a_memberNo, t_name, t_subject, t_contents, t_file "
				+ "from academyTeacherT "
				+ "where a_memberNo = #{a_memberNo} and t_name = #{t_name}")
		AcademyTeacherBean getTeacherInfo(@Param("a_memberNo") int a_memberNo, @Param("t_name") String t_name);
		
		//개별 강사 리뷰 조회
		@Select("select a_memberNo, t_name, m_memberNo, t_score, t_reviewContents "
				+ "from teacherReviewT "
				+ "where a_memberNo = #{a_memberNo} and t_name = #{t_name}")
		List<TeacherReviewBean> getTeacherReviewInfo(@Param("a_memberNo") int a_memberNo, @Param("t_name") String t_name);
		
		//찜목록 확인(학원리스트)
		@Select("select * "
				+ "from wishListT "
				+ "where m_memberNo = #{m_memberNo} and a_memberNo = #{a_memberNo}")
		WishListBean getWishIs(@Param("m_memberNo") int m_memberNo,@Param("a_memberNo") int a_memberNo);
		
		//찜목록 삭제
		@Delete("delete from wishListT "
				+ "where m_memberNo = #{m_memberNo} and a_memberNo = #{a_memberNo}")
		void deleteWish(@Param("m_memberNo") int m_memberNo,@Param("a_memberNo") int a_memberNo);
		
		//찜목록 등록
		@Insert("insert into wishListT(m_memberNo, a_memberNo) "
				+ "values(#{m_memberNo},#{a_memberNo})")
		void insertWish(@Param("m_memberNo") int m_memberNo,@Param("a_memberNo") int a_memberNo);
}
