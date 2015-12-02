package com.kostagram.service.beans;

public class SerachVO {
	private String word;
	private String count;
	
	public SerachVO(){}
	
	public SerachVO(String word, String count)
	{
		super();
		this.word = word;
		this.count = count;
	}
	
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	
	
}
