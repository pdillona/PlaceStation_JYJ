package com.project3.placestation.filedb.model.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Filedb {

	private String uuid;
	private byte[] fileData;
	private String originalFileName;
}
