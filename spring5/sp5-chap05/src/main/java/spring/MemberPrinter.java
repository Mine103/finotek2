package spring;

import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;

public class MemberPrinter {
	private DateTimeFormatter dateTimeFormatter;
	
	public MemberPrinter() {
		dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
	}
	
	public void print(Member member) {
		if(dateTimeFormatter == null) {
			System.out.printf(
					"회원 정보: 아이디=%d, 이메일=%s 이름=%s 등록일=t\n",
					member.getId(), member.getEmail(), member.getName(),
					member.getRegisterDateTime()
					);
		} else {
			System.out.printf(
					"회원 정보: 아이디=%d, 이메일=%s 이름=%s 등록일=s\n",
					member.getId(), member.getEmail(), member.getName(),
					dateTimeFormatter.format(member.getRegisterDateTime())
					);
		}
		
	}
	
	@Autowired(required = false)//자동 주입 대상이 필수가 아닐 때 사용
	//@Nullable 사용시에도 필수 여부 지정 가능
	//의존 주입 대상 파라미터에 붙이면, 세터 메서드를 호출할 때 자동 주입할 빈이 존재하면 해당 빈을 인자로 전달하고,
	//존재하지 않으면 인자로 null을 전달한다.
	public void setDateFormatter(DateTimeFormatter dateTimeFormatter) {
		this.dateTimeFormatter = dateTimeFormatter;
	}
	
}
