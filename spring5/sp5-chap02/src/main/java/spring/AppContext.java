package spring;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AppContext {
	@Bean//빈 객체화
	public Greeter greeter() {//빈 객체에 대한 정보를 담고있는 메소드
		Greeter g = new Greeter();
		g.setFormat("%s, 안녕하세요!");
		return g;
	}
	//생성한 객체를 구분할 때 greeter라는 이름을 사용한다.
	//이 이름은 빈 객체를 참조할 때 사용된다.
}
