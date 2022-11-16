package kr.co.ezen.beans;

import java.sql.Timestamp;
import org.springframework.web.multipart.MultipartFile;

public class BlackListBean {

	private int m_memberNo;
	private int a_memberNo;
	private String black_contents;
	private Timestamp black_time;
	private MultipartFile upload_file;	
	
	private int page;
	
	public int getM_memberNo() {
		return m_memberNo;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public void setM_memberNo(int m_memberNo) {
		this.m_memberNo = m_memberNo;
	}
	public int getA_memberNo() {
		return a_memberNo;
	}
	public void setA_memberNo(int a_memberNo) {
		this.a_memberNo = a_memberNo;
	}
	public String getBlack_contents() {
		return black_contents;
	}
	public void setBlack_contents(String black_contents) {
		this.black_contents = black_contents;
	}
	public Timestamp getBlack_time() {
		return black_time;
	}
	public void setBlack_time(Timestamp black_time) {
		this.black_time = black_time;
	}
	public MultipartFile getUpload_file() {
		return upload_file;
	}
	public void setUpload_file(MultipartFile upload_file) {
		this.upload_file = upload_file;
	}

}