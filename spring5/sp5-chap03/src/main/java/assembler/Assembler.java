package assembler;

import spring.ChangePasswordService;
import spring.MemberDao;
import spring.MemberRegisterService;

public class Assembler {

	private MemberDao memberDao;
	private MemberRegisterService regSvc;
	private ChangePasswordService pwdSvc;
	//MemberRegisterService 객체와
	//ChangePasswordService 객체에 대한 의존 주입
	//MemberRegisterService는 생성자를 통해 MemberDao 객체를 주입받고,
	//ChangePasswordService는 세터를 통해 주입받는다.
	//결과적으로 Assembler가 생성한 객체는 "Member.java" 와 연결된다
	public Assembler() {
		memberDao = new MemberDao();
		regSvc = new MemberRegisterService(memberDao);
		pwdSvc = new ChangePasswordService();
		pwdSvc.setMemberDao(memberDao);
	}
	
	public MemberDao getMemberDao() {
		return memberDao;
	}
	
	public MemberRegisterService getMemberRegisterService() {
		return regSvc;
	}
	
	public ChangePasswordService getChangePasswordService() {
		return pwdSvc;
	}
}
