package kr.co.ezen.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ezen.beans.BlackListBean;
import kr.co.ezen.mapper.BlackListMapper;

@Repository
public class BlackListDAO {
	
		@Autowired
		private BlackListMapper blackListMapper;
		
		  public void addBlContent(BlackListBean blWriteBean) {			  
			 
			  blackListMapper.addBlContent(blWriteBean);		  		 
		  }	
		 
		 
		  public List<BlackListBean> getBlList(RowBounds rowBounds){		   
			  return blackListMapper.getBlList(rowBounds); 		  
		  }
		  //검색
		  public List<BlackListBean> getBlSearchList(@Param("m_memberNo")int m_memberNo,RowBounds rowBounds){		   
			  return blackListMapper.getBlSearchList(m_memberNo, rowBounds); 		  
		  }
		  
		public BlackListBean getBlInfo(@Param("m_memberNo")int m_memberNo,@Param("a_memberNo") int a_memberNo) { 
			
			return blackListMapper.getBlInfo(m_memberNo,a_memberNo); 
		  }	  
		
		
		public void modifyBlInfo(BlackListBean blModifyBean) {
			
			blackListMapper.modifyBlInfo(blModifyBean);
		}
		
		public BlackListBean getBlModifyPage(@Param("m_memberNo")int m_memberNo,@Param("a_memberNo") int a_memberNo) {
		
			return blackListMapper.getBlModifyPage(m_memberNo,a_memberNo);

		}
		
		public void delBlInfo(@Param("m_memberNo")int m_memberNo,@Param("a_memberNo") int a_memberNo) {
			
			blackListMapper.delBlInfo(m_memberNo,a_memberNo);
			
		}
		
		  public int getContentCnt() { 
			  return blackListMapper.getContentCnt();
		  
		  }
		 
}
