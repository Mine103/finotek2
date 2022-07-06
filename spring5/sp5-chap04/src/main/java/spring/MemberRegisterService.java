package spring;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;

public class MemberRegisterService {
	@Autowired
	private MemberDao memberDao;
	
	public MemberRegisterService() {
	}
	
	public Long regist(RegisterRequest req) {
		Member member = memberDao.selectByEmail(req.getEmail());
		//동일한 이메일을 갖는 회원 데이터가 존재하는지 확인하고.,
		//존재하면 DuplicateMemberException을 발생시킨다.
		if(member != null) {
			throw new DuplicateMemberException("dup email "+req.getEmail());
		}
		Member newMember = new Member(
				req.getEmail(), req.getPassword(), req.getName(),
				LocalDateTime.now());
		memberDao.insert(newMember);
		return newMember.getId();
	}
}
