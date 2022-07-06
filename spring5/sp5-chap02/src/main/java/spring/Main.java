package spring;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
//자바 설정에서 정보를 읽어와 빈 객체를 생성하고 관리한다.

public class Main {
	public static void main(String[] args) {
		AnnotationConfigApplicationContext ctx = 
				new AnnotationConfigApplicationContext(AppContext.class);
		//AppContext 클래스를 생성자 파라미터로 전달한다.
		//AppContext에서 정의한 @Bean 설정 정보를 읽어와 Greeter 객체를 생성하고 초기화한다.
		Greeter g = ctx.getBean("greeter", Greeter.class);
		//메서드의 첫 번째 파라미터는 @Bean 이노베이션의 메서드 이름의 빈 객체의 이름이다.
		//메서드의 두 번째 파라미터는 검색할 빈 객체의 이름이다.
		//@Bean 메서드의 이름이 "greeter"이고 생성한 객체의 리턴 타입이 Greeter 이므로,
		//grtBean() 메서드는 greeter() 메서드가 생성한 Greeter 객체를 리턴한다.
		String msg = g.greet("스프링");
		System.out.println(msg);
		ctx.close();
	}
}
