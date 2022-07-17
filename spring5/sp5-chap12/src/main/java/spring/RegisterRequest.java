/*
 * 회원 가입을 처리할 때 필요한 이메일, 암호, 이름데이터를
 * 담고 있는 간단은 클래스*/
package spring;

public class RegisterRequest {
	
	private String email;
	private String password;
	private String confirmPassword;
	private String name;
	
	public String getEmail() {
		return this.email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return this.password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getConfirmPassword() {
		return this.confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
	public String getName() {
		return this.name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public boolean isPasswordEqualToConfirmPassword() {
		return password.equals(confirmPassword); 
	}
	
}
