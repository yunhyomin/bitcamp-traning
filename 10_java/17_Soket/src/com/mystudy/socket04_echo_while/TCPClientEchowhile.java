package com.mystudy.socket04_echo_while;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

public class TCPClientEchowhile {

	public static void main(String[] args) {
		// 메시지를 작성해서 서버로 전송하고, 서버로부터 전달받은 메시지 수신 반복
		//메시지 작성 : Scanner객체 사용해서 콘솔에서 입력
		Socket socket = null;
		
		//byte단위 입출력처리   Reader로 변경         buffer기능사용
		//  InputStream  -> InputStreamReader -> BufferedReader
		//  OutputStream    ------------------->  PrintWriter
		BufferedReader br = null;
		PrintWriter pw = null;
		
		System.out.println("----클라이언트 시작----");

		try {
			socket = new Socket("Localhost",11111);
			
			System.out.println(">>>서버에 접속 완료");
			
			// ----------클라이언트에서 보내는 메시지 입력받는 객체 생성-----------
			// 연결된 소켓과 데이터를 받기위한 I/O 객체 생성 socket.getInputStream()
			// byte-> character 로 변경해주는 InputStreamReader
			// buffer사용하여 라인단위로 입력하기 위해 BufferedReader로 변경
			br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
			
			// ----------받은 메시지를 다시 클라이언트에게 보내는 객체 생성-----------
			// 연결된 소켓과 데이터를 주기위한 I/O 객체 생성 socket.getOuputStream()
			// buffer사용하여 라인단위로 출력하기 위해 BufferedWriter로 변경
			pw = new PrintWriter(socket.getOutputStream());
			
			Scanner scanner  = new Scanner(System.in);
			while(true) {
			System.out.println("서버에 보낼메세지를 작성하세요");
			System.out.print(">");
			String msg = scanner.nextLine();
			pw.println(msg);
			pw.flush(); //버퍼데이터 출력
			if("exit".equals(msg)) {
				System.out.println(">>>>대화를 종료합니다");
				break;
			}
			String receiveMsg =br.readLine();
			System.out.println("서버로부터 전달받은 메시지 :"+receiveMsg);
			
			}
			scanner.close();
			System.out.println("----클라이언트 정상 종료----");

		} catch (IOException e) {
			System.out.println("----[예외발생] 비정상 종료----");

			e.printStackTrace();
		}finally {
			if(pw !=null) pw.close();
			if(br !=null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			try {
				socket.close();
				System.out.println("---->>>소켓 close");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

}
