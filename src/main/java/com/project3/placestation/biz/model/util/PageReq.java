package com.project3.placestation.biz.model.util;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
//@JsonNaming(PropertyNamingStrategy.SnakeCaseStrategy.class)
public class PageReq {

	/** 현재 페이지 번호 : page == number */
	private int page;

	/** 페이지당 출력할 데이터 개수 */
	private int size;

//	offset 개수 : 1st 데이터로 부터 얼마나 떨어져 있는지 개수
//	private Integer offset = page * size;

	public PageReq(int page, int size) {
		this.page = page;
		this.size = size;
	}
}