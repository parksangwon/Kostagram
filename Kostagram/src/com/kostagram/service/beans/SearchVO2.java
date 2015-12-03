package com.kostagram.service.beans;

public class SearchVO2 {
	private String message;
	private String count;
	
	public SearchVO2(){}
	
	public SearchVO2(String word, String count)
	{
		super();
		this.message = word;
		this.count = count;
	}
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	
	
}
