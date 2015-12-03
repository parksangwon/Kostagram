package com.kostagram.service.beans;

public class SearchVO {
	private String word;
	private String count;
	private String message;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public SearchVO(){}
	
	public SearchVO(String word, String count)
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
