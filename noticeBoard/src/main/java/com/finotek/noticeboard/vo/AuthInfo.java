package com.finotek.noticeboard.vo;

public class AuthInfo {
	private String email;
	private String pass;
	public String getEmail() {
		return email;
	}
	public String getPass() {
		return pass;
	}
	
	public AuthInfo(String email, String pass) {
		this.email = email;
		this.pass = pass;
	}
}
