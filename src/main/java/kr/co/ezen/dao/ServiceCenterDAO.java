package kr.co.ezen.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ezen.beans.ServiceCenterBean;
import kr.co.ezen.mapper.ServiceCenterMapper;

@Repository
public class ServiceCenterDAO {
	
		@Autowired
		private ServiceCenterMapper serviceCenterMapper;
		
		  public void addNbContent(ServiceCenterBean nbWriteBean) {			  
			 
			  serviceCenterMapper.addNbContent(nbWriteBean);		  		 
		  }	
		 
		  public List<ServiceCenterBean> getNbList(){		   
			
			  return serviceCenterMapper.getNbList(); 			  
		  }
		  
		public ServiceCenterBean getNbInfo(int nb_no) { 
			
			return serviceCenterMapper.getNbInfo(nb_no); 
		  }	  
		  
		  
		public void modifyNbInfo(ServiceCenterBean nbModifyBean) {
			
			serviceCenterMapper.modifyNbInfo(nbModifyBean);
		}
		
		
		public void delNbInfo(int nb_no) {
			
			serviceCenterMapper.delNbInfo( nb_no);
			
		}

}
