package com.mystudy.socket02_line;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;

public class TCPClientLine {

	public static void main(String[] args) {
		System.out.println(">>>> 클라이언트 시작");
		// 0. 사용할 소켓(Socket) 저장할 변수 선언
		Socket socket = null;
		
		try {
			//1.소켓생성(Socket) : 접속할 IP, 포트(port)정보로 접속
			System.out.println("현재컴퓨터IP : "+InetAddress.getLocalHost());
			System.out.println(">> 서버 접속 시도!");
			socket = new Socket(InetAddress.getLocalHost(),1234);
			System.out.println(">> 서버 접속 성공!!!");
			
			//2.소켓으로부터 in,out 생성 - InputStream, OutputStream
			InputStream is = socket.getInputStream();
			
			OutputStream os = socket.getOutputStream();
			PrintWriter pw = new PrintWriter(os);
			
			//3.읽을(in) 데이터가 있으면 읽고(read)
			//구현안함
			
			//4.전송할(out) 데이터가 있으면 쓰고(write)
			String msg = "안녕하세요. 만나서 반갑습니다. 소켓통신 공부중~!!";
			pw.println(msg);
			
			pw.flush();// 버퍼에 있는 내용을 강제로 출력(전송)
			
			//5.자원반납(close)
			pw.close();
			is.close();
			
		} catch (UnknownHostException e) {
				e.printStackTrace();
		} catch (IOException e) {
				e.printStackTrace();
			}finally{
				if(socket != null) {
					try {
						socket.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		System.out.println(">>>> 클라이언트 끝");

	}

}
