package kr.co.ezen.mapper;


import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.beans.SiteAskBean;

public interface SiteAskMapper {
	
		
	@Insert("insert into siteAskT(sa_memberNo, sa_tele, sa_title, sa_contents, sa_file )"
			+ "values(#{sa_memberNo, jdbcType=VARCHAR}, #{sa_tele}, #{sa_title}, #{sa_contents}, #{sa_file, jdbcType=VARCHAR})"
			)
	void addSaContent(SiteAskBean saWriteBean);
	
	/*
	@Select("select m_id, m_name, m_email from memberT "
			+ "where m_memberNo = #{m_memberNo}")
		SiteAskBean getSaContentPage(int m_memberNo);	
	*/
	
	// 문의글 목록
	@Select("select sa_memberNo, sa_title, sa_time from siteAskT")	
		List<SiteAskBean> getSaList(); 
		
		// 문의글 상세보기
	@Select("select m_id, m_name, sa_tele, m_email, sa_time, sa_title, sa_contents, sa_file "
			+ "from siteAskT, memberT "
			+ "where sa_memberNo = m_memberNo "
			+ "and sa_time = #{sa_time}")
	SiteAskBean getSaInfo(Timestamp sa_time);	
	
}
