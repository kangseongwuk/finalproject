package kr.co.ezen.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ezen.beans.academyMemberBean;
import kr.co.ezen.mapper.BoardMapper;

@Repository
public class BoardDAO {

	@Autowired
	private BoardMapper boardMapper;
	
	//종합 학원 게시판 목록 호출
	public List<academyMemberBean> getGBoardList() {
		return boardMapper.getGBoardList();
	}
	
}
