package com.finotek.noticeboard.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVO {

	private int bno;
	private String title;
	private String content;
	private String writer;
	private String regDate;
	private int mid;
	
}
