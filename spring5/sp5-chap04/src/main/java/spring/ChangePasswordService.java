package spring;

import org.springframework.beans.factory.annotation.Autowired;

public class ChangePasswordService {
	@Autowired
	private MemberDao memberDao;
	//암호를 변경할 Member 데이터를 찾기 위해 email을 사용한다.
	//만약 email에 해당하는 Member가 존재하지 않으면 익셉션을 발생시킨다.
	//Member가 존재하면 member.changePassword()를 이용해 암호를 변경하고, 변경한 데이터를 보관한다.
	public void changePassword(String email, String oldPwd, String newPwd) {
		Member member = memberDao.selectByEmail(email);
		if(member == null) throw new MemberNotFoundException();
		
		member.changePassword(oldPwd, newPwd);
		
		memberDao.update(member);
	}
	//setMemberDao 메서드롤 의존하는 MemberDao를 전달받는다.
	//세터(setter)를 통해서 의존 객체를 주입받는다
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
}
