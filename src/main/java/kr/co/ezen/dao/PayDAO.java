package kr.co.ezen.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ezen.beans.AcademyPayBean;
import kr.co.ezen.mapper.PayMapper;

@Repository
public class PayDAO {

	@Autowired
	PayMapper payMapper;

	public void insertpay(AcademyPayBean academyPayBean) {
		payMapper.insertpay(academyPayBean);
	}

	public void add_amonth(AcademyPayBean academyPayBean) {
		payMapper.add_amounth(academyPayBean);
	}

	public void add_halfyear(AcademyPayBean academyPayBean) {
		payMapper.add_halfyear(academyPayBean);
	}

	public void add_ayear(AcademyPayBean academyPayBean) {
		payMapper.add_ayears(academyPayBean);
	}

	public String check_duplication(String a_memberNo) {
		return payMapper.check_duplication(a_memberNo);
	}

}