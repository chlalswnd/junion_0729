package com.boot.Service;

import java.util.ArrayList;

import com.boot.DAO.CompanyInfoDAO;
import com.boot.DTO.Criteria4;

public interface CompanyPageService {
	public ArrayList<CompanyInfoDAO> companyPageList(Criteria4 cri);// 페이징을 위한 메소드
//	public ArrayList<ComNoticeDAO> cardPageList(CardPageDAO dao);// 페이징을 위한 메소드
}
