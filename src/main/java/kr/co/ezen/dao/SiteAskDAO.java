package kr.co.ezen.dao;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ezen.beans.SiteAskBean;
import kr.co.ezen.mapper.SiteAskMapper;

@Repository
public class SiteAskDAO {
	
		@Autowired
		private SiteAskMapper siteAskMapper;	
		
		  public void addSaContent(SiteAskBean saWriteBean) {			  
			 			  
			  siteAskMapper.addSaContent(saWriteBean);		  		 
		  }	
		  
		  /*
		  public SiteAskBean getSaContentPage(int sa_memberNo) {
			 
			  return siteAskMapper.getSaContentPage(sa_memberNo);
		  }
		  */
		  
		 
		  public List<SiteAskBean> getSaList(){		   
			
			  return siteAskMapper.getSaList(); 			  
		  }
		  
		  public SiteAskBean getSaInfo(Timestamp sa_time) { 
			
			return siteAskMapper.getSaInfo(sa_time); 
		  }

}
