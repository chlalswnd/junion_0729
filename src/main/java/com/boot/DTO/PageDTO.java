package com.boot.DTO;

import lombok.Data;
import lombok.Getter;
import lombok.ToString;

//@Data
//@AllArgsConstructor
//@NoArgsConstructor
@Getter
@ToString
public class PageDTO {
	private int startpage; // 시작페이지 : 1, 6
	private int endpage; // 끝페이지 : 5, 10
	private boolean prev, next;
	private int total;
	private Criteria2 cri; // 화면에 출력 갯수
	
	public PageDTO(int total, Criteria2 cri) {
//		super();
		this.total = total;
		this.cri = cri;
		
		
		
//	    ex>3페이지=3/10->0.3 -> 1 * 10 = 10(끝페이지)
//	    ex>11페이지=11/10->1.1 -> 2 * 10 = 20(끝페이지)
		this.endpage = (int)(Math.ceil(cri.getPageNum() / 10.0)) * 10;
		
//	    ex>10-9=1페이지
//	    ex>20-9=11페이지
		this.startpage = this.endpage - 9;
		
		// ex> total : 12, 현재 페이지 : 3 -> endPage: 12.0 / 5 = 2.4 => 올림 => 3 페이지
		// ex> total : 7, 현재 페이지 : 1 -> endPage: 7.0 / 5 = 1.4 => 올림 => 2 페이지
		int realEnd = (int)Math.ceil((total * 1.0) / cri.getAmount());


		if (realEnd <= this.endpage){
			this.endpage = realEnd;
		}
		
		//이전, 다음 버튼 설정 (누르면 지금페이지에서 1페이지씩 이동
		this.prev = this.startpage > 1 ;// 1페이지보다 크면 존재 -> 참이고 아님 거짓으로 없음
		this.next = this.endpage < realEnd;
	}
	
	
	 // cri2의 getter 메서드 추가 (이미 Lombok @Getter가 처리하지만, 명시적으로 추가)
    public Criteria2 getCri() {
        return cri;
    }
	
}

