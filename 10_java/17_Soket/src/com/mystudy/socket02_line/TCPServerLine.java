package com.mystudy.socket02_line;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class TCPServerLine {

	public static void main(String[] args) {
		System.out.println(">> 서버시작");
		ServerSocket server = null;
		
		try {
			System.out.println(">> 서버(ServerSocket) 대기증~~");
			//1.ServerSocket객체생성 - 대기할 포트(port)지정
			server = new ServerSocket(1234);
			
			//2.서버소켓 대기중 접속한 Socket 객체 생성
			Socket socket = server.accept();
			System.out.println(">> 클라이언트 접속");
			
			//3.Socket으로부터 InputStream, OutputStream 객체 생성
			OutputStream os = socket.getOutputStream();
			
			InputStream is = socket.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			
			//4.받은 메세지가 있으면 읽기
			String msg = br.readLine();
			System.out.println("[서버로 받은 메세지]"+ msg);
			
			//5.보낼메세지가 있으면 보내기 
			//구현안함 
			
			//6.자원반납(close)
			br.close();
			os.close();

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		System.out.println(">> 서버종료");



	}

}
