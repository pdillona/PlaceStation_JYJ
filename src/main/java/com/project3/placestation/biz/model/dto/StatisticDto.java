package com.project3.placestation.biz.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class StatisticDto {
	private Integer amount;
	private Integer cancelAmount;
	private String date;
}
