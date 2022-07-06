package config;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.ComponentScan.Filter;

import spring.MemberPrinter;
import spring.MemberSummaryPrinter;
import spring.VersionPrinter;

@Configuration
//필터 적용
//정규 표현식을 사용해서 제외대상 설정
//"spring."으로 시작하고 Dao로 끝나는 정규표현식 지정
@ComponentScan(basePackages = {"spring"},
		excludeFilters = @Filter(type = FilterType.REGEX, pattern = "spring\\.*Dao"))
public class AppCtxWithExclude {
	
	@Bean
	@Qualifier("printer")
	public MemberPrinter memberPrinter1() {
		return new MemberPrinter();
	}
	
	@Bean
	@Qualifier("summaryPrinter")
	public MemberSummaryPrinter memberPrinter2() {
		return new MemberSummaryPrinter();
	}
	
	@Bean
	public VersionPrinter versionPrinter() {
		VersionPrinter versionPrinter = new VersionPrinter();
		versionPrinter.setMajorVersion(1);
		versionPrinter.setMinorVersion(0);
		return versionPrinter;
	}
}
