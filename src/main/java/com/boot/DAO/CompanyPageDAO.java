package com.boot.DAO;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.boot.DTO.Criteria4;
import com.boot.DTO.Standard;

@Mapper
public interface CompanyPageDAO {
	public ArrayList<CompanyInfoDAO> companyPageList(Criteria4 cri);
//	public ArrayList<ComNoticeDAO> cardPageList(CardPageDAO dao);// 페이징을 위한 메소드
}
