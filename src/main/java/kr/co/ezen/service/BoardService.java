package kr.co.ezen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ezen.beans.academyMemberBean;
import kr.co.ezen.dao.BoardDAO;

@Service
public class BoardService {

	@Autowired
	private BoardDAO boardDAO;	
	
	//종합 학원 게시판 목록 호출
	public List<academyMemberBean> getGBoardList() {
		return boardDAO.getGBoardList();
	}
}
