package kr.co.ezen.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import kr.co.ezen.beans.BlackListBean;

public interface BlackListMapper {
	
		
	@Insert("insert into blacklistT(m_memberNo, a_memberNo, black_contents )"
			+ "values(#{m_memberNo},#{a_memberNo},#{black_contents})"
			)
		void addBlContent(BlackListBean blWriteBean);		
	
	// 저자이름, 작성날짜, 내용, 이미지 등을 추출하여 가져와 내림차순 정렬하여 출력 합니다.	
	@Select("select m_memberNo, a_memberNo, black_time " +
			 "from blacklistT " +
			 "order by black_time desc ")	
		List<BlackListBean> getBlList(RowBounds rowBounds); 
	
		// 제목, 작성날짜, 조회수, 내용, 이미지 등을 추출하여 가져와야 합니다.	
	@Select("select m_memberNo, a_memberNo, black_contents, black_time "
			+ "from blacklistT "
			+ "where m_memberNo = #{m_memberNo} and a_memberNo = #{a_memberNo}")
		BlackListBean getBlInfo(@Param("m_memberNo")int m_memberNo,@Param("a_memberNo") int a_memberNo);	

	
	//수정
	@Select("select m_memberNo, a_memberNo, black_contents "
			+ "from blacklistT "
			+ "where m_memberNo = #{m_memberNo} and a_memberNo = #{a_memberNo} ")
		BlackListBean getBlModifyPage(@Param("m_memberNo")int m_memberNo,@Param("a_memberNo") int a_memberNo);
	
	@Update("update blacklistT set black_contents = #{black_contents} "
			+ "where m_memberNo = #{m_memberNo} and a_memberNo = #{a_memberNo}")
		void modifyBlInfo(BlackListBean blModifyBean);
	
	//삭제
	@Delete("delete from blacklistT where m_memberNo = #{m_memberNo} and a_memberNo = #{a_memberNo}")
		void delBlInfo(@Param("m_memberNo")int m_memberNo,@Param("a_memberNo") int a_memberNo);
	
	/*@Update("update blacklistT set nb_viewCount = nb_viewCount + 1 "
			+ "where m_memberNo = #{m_memberNo}")
		void viewCountBlInfo(int m_memberNo);
	*/
	
	@Select("select count(*) from blacklistT")
	int getContentCnt();
	
	@Select("select m_memberNo, a_memberNo, black_time from blacklistT where m_memberNo = #{m_memberNo} ")
		List<BlackListBean> getBlSearchList(@Param("m_memberNo")int m_memberNo, RowBounds rowBounds);
	}
