package com.mystudy.socket04_echo_while;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;

public class TCPServerEchoWhile {

	public static void main(String[] args) {
		// 클라이언트에서 보내는 메시지를 받고 다시 보내기 반복처리
		// 수신(input)메시지 화면출력 후 클라이언트로 전송(output)
		// 클라이언트에서 종료요청시 까지

		ServerSocket server = null;

		// 입력받는 객체 선언
		BufferedReader br = null;
		// 출력하는 객체 선언
		PrintWriter pw = null;
		

		try {
			server = new ServerSocket(11111);
			System.out.println(">>>서버시작");
		
			System.out.println(">>접속대기중...");
			System.out.println(">>IP주소 :포트번호-"
					+InetAddress.getLocalHost().getHostAddress()+":"+server.getLocalPort());

			Socket socket = server.accept();
			System.out.println(">>클라이언트 접속!");
			System.out.println("접속정보:"+ socket.getInetAddress());


			// ----------클라이언트에서 보내는 메시지 입력받는 객체 생성-----------
			// 연결된 소켓과 데이터를 받기위한 I/O 객체 생성 socket.getInputStream()
			// byte-> char 로 변경해주는 InputStreamReader
			// buffer사용하여 라인단위로 입력하기 위해 BufferedReader로 변경
			br = new BufferedReader(new InputStreamReader(socket.getInputStream()));

			// ----------받은 메시지를 다시 클라이언트에게 보내는 객체 생성-----------
			// 연결된 소켓과 데이터를 주기위한 I/O 객체 생성 socket.getOuputStream()
			// buffer사용하여 라인단위로 출력하기 위해 PrintWriter로 변경
			pw = new PrintWriter(socket.getOutputStream());

			
			while (true) {
				String msg = br.readLine();
				//클라이언트에서 작업종료(exit)하면 종료처리
				if("exit".equals(msg) || msg == null) {
					System.out.println(">>>대화를 종료합니다.");
					break;
				}
				System.out.println("클라이언트로부터 받은 메시지 :" + msg);
				
				pw.println(msg);
				pw.flush();//버퍼데이터 출력처리
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			
			if (br != null)
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			if (pw != null) {
				pw.close();
			}

		}
		try {
			server.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out.println(">>>서버종료");

	}

}
