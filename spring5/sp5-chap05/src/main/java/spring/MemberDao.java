/*
 * DB연동하는법은 배우지 않았으므로 자바의 Map을 이용하여 구현.
 * DB연동은 8장에서 학습*/
package spring;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component//해당 클래스를 스캔 대상으로 표시한다.
public class MemberDao {
	private static long nextId = 0;
	
	private Map<String, Member> map = new HashMap<String, Member>(); 
	
	public Member selectByEmail(String email) {
		return map.get(email);
	}
	
	public void insert(Member member) {
		member.setId(++nextId);
		map.put(member.getEmail(), member);
	}
	
	public void update(Member member) {
		map.put(member.getEmail(), member);
	}
	
	public Collection<Member> selectAll() {
		return map.values();
	}
}
