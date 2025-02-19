package com.project3.placestation.repository.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class CsNoticeBoardCategory {
	
	private Integer categoryId; // 카테고리 기본키
	private String categoryName; // 카테고리명 (일반 , 사업자)
	private String useYn; // 사용 여부(DEFAULT: Y)

}
