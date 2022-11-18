package kr.co.ezen.service;

import java.io.File;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.beans.SiteAskBean;
import kr.co.ezen.dao.MemberDAO;
import kr.co.ezen.dao.SiteAskDAO;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class SiteAskService {

	@Value("${path.upload}")
	private String path_upload;
	
	@Autowired
	private MemberBean loginMemberBean;
	
	@Autowired
	private SiteAskDAO siteAskDAO;
	
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
	
	public void addSaContent(SiteAskBean saWriteBean) {
		
		MultipartFile upload_file = saWriteBean.getUpload_file();
		
		if(upload_file.getSize() > 0) {			
			String file_name = saveUploadfile(upload_file);					
			saWriteBean.setSa_file(file_name); 			
		}

		saWriteBean.setM_memberNo(loginMemberBean.getM_memberNo());
		saWriteBean.setSa_memberNo(loginMemberBean.getM_memberNo());
		
		siteAskDAO.addSaContent(saWriteBean);
	}
	
	
	/*
	public SiteAskBean getSaContentPage(int m_memberNo) {
		
		return siteAskDAO.getSaContentPage(m_memberNo);	
	}
	*/
	
	
	//글목록
	 public List<SiteAskBean> getSaList(){		   
		  return siteAskDAO.getSaList(); 			  
	  }
	
	
	public SiteAskBean getSaInfo(Timestamp sa_time) { 
		  return siteAskDAO.getSaInfo(sa_time); 
	  }
}
