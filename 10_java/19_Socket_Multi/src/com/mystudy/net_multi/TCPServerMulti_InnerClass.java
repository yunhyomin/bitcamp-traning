package com.mystudy.net_multi;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;

//다중 접속을 처리할 수 있는 서버 만들기 
public class TCPServerMulti_InnerClass {

	public static void main(String[] args) {
		System.out.println("----------ㅡmain()시작------------");
		new TCPServerMulti_InnerClass();
		System.out.println("----------ㅡmain()끝------------");
	}

	public TCPServerMulti_InnerClass() {
		serverStart();
	}

	private void serverStart() {
		ServerSocket server = null;
		try {
			System.out.println(">> 서버소켓 객체 생성");
			server = new ServerSocket(1111);
			System.out.println(">> 서버 접속대기중..." 
							+ InetAddress.getLocalHost().getHostAddress()+" : "
							+ server.getLocalPort());// ServerSocket의 메소드 port번호를 리턴
			
			//서버접속 반복하고 그 클라이언트의 읽기 전용 쓰레드 생성 반복한다.
			while (true) {
				Socket socket = server.accept();
				System.out.println("[" + socket.getInetAddress() + " : " + socket.getPort() + "] 접속!!");
			
				// 접속된 클라이언트에 대한 처리 : 쓰레드 생성(읽기 전용)
				ServerReceiver thr = new ServerReceiver(socket);
				thr.start();// 쓰레드 동작시키기
			}

		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	// ServerReceiver : 클라이언트에서 보내온 메시지 수신
	private class ServerReceiver extends Thread {
		Socket socket;

		ServerReceiver(Socket socket) {
			this.socket = socket;
		}

		@Override
		public void run() {
			System.out.println("-----Tread 시작-----");
			BufferedReader br = null;

			try {
				br = new BufferedReader(new InputStreamReader(socket.getInputStream()));

				System.out.println(">>읽기시작");
				while (true) {
					String msg = br.readLine();
					System.out.println(">>> " + msg);
					if ("exit".equalsIgnoreCase(msg)) {
						System.out.println(">>읽기종료");                                                                            
						break;
					}
				}
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				System.out.println(">>클라이언트 종료");
				if (br != null) {
					try {
						br.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}System.out.println("-----Tread 끝-----");
		}
		

	}

}
