package com.boot.DTO;

import lombok.Data;

@Data
//@AllArgsConstructor
//@NoArgsConstructor
public class Criteria2 {
	private int pageNum; // 페이지번호
	private int amount; // 페이지당 글 갯수	
	private String user_email;
	
	private String keyword;//검색에 넣은 단어
	private String orderBy;//notice list 정렬할 때 select 박스에서 선택되는 값 DTO에 필드만 넣음 (연주0728)
	private String orderByDate;//받은제안 정렬할 때 정렬조건(최신순 마감임박순) DTO에 필드만 넣음 (연주0801)
	
	public Criteria2() 
	{
		this(1, 5);
	}
	
	public Criteria2(int pageNum, int amount) 
	{
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
}
