package kr.co.ezen.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.beans.ServiceCenterBean;
import kr.co.ezen.dao.ServiceCenterDAO;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class ServiceCenterService {

	@Value("${path.upload}")
	private String path_upload;
	
	
	@Autowired
	private ServiceCenterDAO serviceCenterDAO;
	
	@Autowired
	private MemberBean loginMemberBean;
	
	@SuppressWarnings("unused")
	private String saveUploadfile(MultipartFile upload_file) {
		
		String file_name = upload_file.getOriginalFilename();
		
		try {
			upload_file.transferTo(new File(path_upload + "/" + file_name));  
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return file_name;
	}
	
	public void addNbContent(ServiceCenterBean nbWriteBean) {
		
		MultipartFile upload_file = nbWriteBean.getUpload_file();
		
		if(upload_file.getSize() > 0) {			
			String file_name = saveUploadfile(upload_file);					
			nbWriteBean.setNb_file(file_name); 			
		}
		
		serviceCenterDAO.addNbContent(nbWriteBean);
	}
	
	//글목록
	 public List<ServiceCenterBean> getNbList(){		   
		  return serviceCenterDAO.getNbList(); 			  
	  }
	
	
	public ServiceCenterBean getNbInfo(int nb_no) { 
		  return serviceCenterDAO.getNbInfo(nb_no); 
	  }
	
	//수정
	public void modifyNbInfo(ServiceCenterBean nbModifyBean){
		
		 MultipartFile upload_file = nbModifyBean.getUpload_file();
		  
		  if(upload_file.getSize() > 0) {
			  String file_name = saveUploadfile(upload_file);				
			  nbModifyBean.setNb_file(file_name); 
		  }
		
		serviceCenterDAO.modifyNbInfo(nbModifyBean);
	}
	
	//삭제
	public void delNbInfo(int nb_no){
		
		serviceCenterDAO.delNbInfo(nb_no);
	}
}
