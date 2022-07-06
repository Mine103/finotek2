package spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("infoPrinter")//이노테이션을 준 값은 빈 이름으로 사용된다.
public class MemberInfoPrinter {

	private MemberDao memDao;
	private MemberPrinter printer;
	
	public void printMemberInfo(String email) {
		Member member = memDao.selectByEmail(email);
		if(member == null) {
			System.out.println("데이터 없음");
			return;
		}
		printer.print(member);
		System.out.println();
	}
	@Autowired
	public void setMemberDao(MemberDao memberDao) {
		this.memDao = memberDao;
	}
	@Autowired
	@Qualifier("printer")
	public void setPrinter(MemberPrinter printer) {
		this.printer = printer;
	}
}
