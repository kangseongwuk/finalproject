package kr.co.ezen.service;

import java.io.File;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.ezen.beans.BlackListBean;
import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.beans.PageCountBean;
import kr.co.ezen.beans.ServiceCenterBean;
import kr.co.ezen.dao.BlackListDAO;
import kr.co.ezen.dao.ServiceCenterDAO;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class BlackListService {

	@Value("${path.upload}")
	private String path_upload;
	

	@Value("${page.listcnt}")
	private int page_listcnt;  
	
	@Value("${page.pagButtonCnt}")
	private int page_pageButtonCnt;
	
	@Autowired
	private BlackListDAO blackListDAO;
	
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
	
	public void addBlContent(BlackListBean blWriteBean) {
		
		MultipartFile upload_file = blWriteBean.getUpload_file();
		
		if(upload_file.getSize() > 0) {			
			String file_name = saveUploadfile(upload_file);					
			blWriteBean.setBlack_contents(file_name); 			
		}
		
		blackListDAO.addBlContent(blWriteBean);
	}
	
	public List<BlackListBean> getBlList(int page){	  
		
		int start = (page -1) * page_listcnt;
		RowBounds rowBounds = new RowBounds(start, page_listcnt);
		
	  return blackListDAO.getBlList(rowBounds); 	  
	}
	
	//검색
	public List<BlackListBean> getBlSearchList(@Param("m_memberNo") int m_memberNo,int page){	  
		
		int start = (page -1) * page_listcnt;
		RowBounds rowBounds = new RowBounds(start, page_listcnt);
		
	  return blackListDAO.getBlSearchList(m_memberNo, rowBounds); 	  
	}
	
	public BlackListBean getBlInfo(@Param("m_memberNo")int m_memberNo,@Param("a_memberNo") int a_memberNo) { 
		  return blackListDAO.getBlInfo(m_memberNo,a_memberNo); 
	  }
	
	//수정 페이지 출력 화면
		public BlackListBean getBlModifyPage(@Param("m_memberNo")int m_memberNo,@Param("a_memberNo") int a_memberNo){
			
			return blackListDAO.getBlModifyPage(m_memberNo,a_memberNo);
		}
	
	//수정
	public void modifyBlInfo(BlackListBean blModifyBean){
		
		 MultipartFile upload_file = blModifyBean.getUpload_file();
		  
		  if(upload_file.getSize() > 0) {
			  String file_name = saveUploadfile(upload_file);				
			  blModifyBean.setBlack_contents(file_name); 
		  }
		
		  blackListDAO.modifyBlInfo(blModifyBean);
	}
	
	//삭제
	public void delBlInfo(@Param("m_memberNo")int m_memberNo,@Param("a_memberNo") int a_memberNo){
		
		blackListDAO.delBlInfo(m_memberNo, a_memberNo);
	}
	
	//페이징
	 public PageCountBean getContentCnt( int currentPage) {
	
		 int content_cnt = blackListDAO.getContentCnt();
		 
		//contentCnt: 전체글개수, currentPage: 현재글 번호, contentPageCnt: 페이지당 글 개수, pagButtonCnt: 페이지 버튼의 개수
		 PageCountBean pageCountBean = new PageCountBean(content_cnt, currentPage, page_listcnt, page_pageButtonCnt);
		 
		 return pageCountBean;
	 } 
	
	 
	 
}
