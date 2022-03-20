package com.mystudy.socket03_echo;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

public class TCPServerEcho {

	public static void main(String[] args) {
		// 서버 : 클라이언트에서 보낸 메시지를 받고 다시 되돌려줌 
		ServerSocket server = null;
		
		//데이터를 읽기위한 객체를 저장할 변수 선언
//		InputStream is = null;
//		InputStreamReader isr = null;  
		BufferedReader br = null;
		
		//데이터를 쓰기위한 객체를 저장할 변수 선언
//		OutputStream os = null;
		PrintWriter pw = null;
		
		try {
			System.out.println(">> 서버시작");
			server = new ServerSocket(1111);
			
			System.out.println(">>> 대기중.....");
			Socket socket = server.accept();//연결
			
			//데이터를 받고 (Read)
//			is = socket.getInputStream();
//			isr = new InputStreamReader(is);
//			br = new BufferedReader(isr);
			br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
			//이렇게 사용하면 BufferedReader만 객체선언을 하면 된다.
			
			System.out.println(">>> 메시지 읽기");
			String msg = br.readLine();
			System.out.println("받은 메시지 :"+ msg);

			//------------------------------
			//받은메시지 클라이언트 쪽으로 보내기(받은 데이터 되돌려주기 (write))
//			os = socket.getOuputStream();
//			pw = new printWriter(os);
			pw = new PrintWriter(socket.getOutputStream());
			
			pw.println("[서버에서 되돌려 보냄]"+msg);
			
			pw.flush();

			
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			if(pw != null) pw.close();
			if(br != null)
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}

		System.out.println(">> 서버종료");

	}

}
