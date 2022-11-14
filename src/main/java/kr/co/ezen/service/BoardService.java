package kr.co.ezen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ezen.beans.AcademyMemberBean;
import kr.co.ezen.beans.AcademyReviewBean;
import kr.co.ezen.beans.AcademySubjectBean;
import kr.co.ezen.beans.AcademyTeacherBean;
import kr.co.ezen.dao.BoardDAO;

@Service
public class BoardService {

	@Autowired
	private BoardDAO boardDAO;	
	
	//종합 학원 게시판 목록 호출
	public List<AcademyMemberBean> getGBoardList() {
		return boardDAO.getGBoardList();
	}
	
	//종합 학원 정보 상세 보기
	public AcademyMemberBean getAcademyInfoBasic(int a_memberNo) {
		return boardDAO.getAcademyInfoBasic(a_memberNo);
	}
	
	//학원 리뷰 조회
	public List<AcademyReviewBean> getAcademyInfoReview(int a_memberNo) {
		return boardDAO.getAcademyInfoReview(a_memberNo);
	}
	
	//학원 과목 조회
	public List<AcademySubjectBean> getAcademyInfoSubject(int a_memberNo) {
		return boardDAO.getAcademyInfoSubject(a_memberNo);
	}
	
	//학원별 강사 조회
	public List<AcademyTeacherBean> getAcademyInfoTeacher(int a_memberNo){
		return boardDAO.getAcademyInfoTeacher(a_memberNo);
	}
}
