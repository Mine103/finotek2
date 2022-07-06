package main;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import assembler.Assembler;
import spring.ChangePasswordService;
import spring.DuplicateMemberException;
import spring.MemberNotFoundException;
import spring.MemberRegisterService;
import spring.RegisterRequest;
import spring.WorngIdPasswordException;

public class MainForAssembler {
	
	public static void main(String[] args) throws IOException {
		//콘솔에서 입력받기 위해 System.in을 이용해서 BufferedReader를 생성한다.
		BufferedReader reader = 
				new BufferedReader(new InputStreamReader(System.in));
		while(true) {
			System.out.println("명령어를 입력하세요.");
			//콘솔에서 한 줄을 입력받는다.
			String command = reader.readLine();
			//입력한 문자열이 "exit"이면 종료한다.
			if(command.equalsIgnoreCase("exit")) {
				System.out.println("종료합니다.");
				break;
			}
			//입력한 문자열이 "new "로 시작하면
			//processNewCommand() 메서드를 실행한다.
			if(command.startsWith("new ")) {
				processNewCommand(command.split(" "));
				continue;
			}
			//입력한 문자열이 "change "로 시작하면
			//processChangeCommand() 메서드를 실행한다.
			else if(command.startsWith("change ")) {
				processChangeCommand(command.split(" "));
				continue;
			}
			//명령어를 잘못 입력한 경우 printHelp() 메서드를 실행한다.
			printHelp();
		}
	}
	
	private static Assembler assembler = new Assembler();
	
	private static void processNewCommand(String[] arg) {
		if(arg.length != 5) {
			printHelp();
			return;
		}
		MemberRegisterService regSvc = assembler.getMemberRegisterService();
		RegisterRequest req = new RegisterRequest();
		req.setEmail(arg[1]);
		req.setName(arg[2]);
		req.setPassword(arg[3]);
		req.setConfirmPassword(arg[4]);
		
		if(!req.isPasswordEqualToConriemPassword()) {
			System.out.println("암호와 확인이 일치하지 않습니다.");
			return;
		}
		try {
			regSvc.regist(req);
			System.out.println("등록했습니다.\n");
		} catch (DuplicateMemberException e) {
			System.out.println("이미 존재하는 이메일 입니다.");
		}
	}
	
	private static void processChangeCommand(String[] arg) {
		if(arg.length != 4) {
			printHelp();
			return;
		}
		ChangePasswordService changePwdSvc = 
				assembler.getChangePasswordService();
		try {
			changePwdSvc.changePassword(arg[1], arg[2], arg[3]);
			System.out.println("암호를 변경했습니다.\n");
		} catch(MemberNotFoundException e) {
			System.out.println("존재하지 않는 이메일 입니다.\n");
		} catch(WorngIdPasswordException e) {
			System.out.println("이메일과 암호가 일치하지 않습니다.\n");
		}
	}
	
	private static void printHelp() {
		System.out.println("");
		System.out.println("잘못된 명령입니다. 아래 명령어 사용법을 확인하세요.");
		System.out.println("명령어 사용법: ");
		System.out.println("new 이메일 이름 암호 암호확인");
		System.out.println("change 이메일 현재비번 변경비번");
		System.out.println();
	}
}
