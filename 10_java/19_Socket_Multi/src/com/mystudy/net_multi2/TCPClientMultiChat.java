package com.mystudy.net_multi2;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.util.Scanner;

//메시지 작성, 전송을 독립적으로 동작하는 쓰레드 작성(쓰기 전용)
//메시지 수신을 독립적으로 동작하는 쓰레드 생성(읽기 전용)
public class TCPClientMultiChat {
	static Scanner scanner = new Scanner(System.in);

	public static void main(String[] args) {
		// 송신, 수신 쓰레드 생성 실행
		System.out.println("-----main()실행-----");
		Socket socket = null;

		System.out.print("사용할 이름(별명) 입력 :");
		String name = scanner.nextLine();
		try {
			socket = new Socket("localhost", 12345);

			// 메시지 보내기(발신 out) 쓰레드 생성
			ClientSender clientSender = new ClientSender(socket, name);
			clientSender.start();
			// 메세지 받기(수신 in) 쓰레드 생성
			ClientReceiver clientReceiver = new ClientReceiver(socket);
			clientReceiver.start();

		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out.println("-----main()종료-----");

	}

	// 메시지 보내기 쓰레드
	static class ClientSender extends Thread {
		Socket socket;
		String name;
		DataOutputStream out;

		// 생성자
		ClientSender(Socket socket, String name) {
			this.socket = socket;
			this.name = name;

			try {
				out = new DataOutputStream(socket.getOutputStream());
			} catch (IOException e) {
				// e.printStackTrace();
				System.out.println("[예외발생] ClientSender 생성자 put객체 생성 실패!!!!");
			}
		}

		@Override
		public void run() {
			// 메시지 작성하고, 작성된 메시지 서버로 전송
			if (out == null) {
				System.out.println("[예외발생] out객체가 null입니다");
				return;
			}
//			name = scanner.nextLine();
			try {
				out.writeUTF(name);// 첫번째 메시지 보내기

				while (true) {
					System.out.print("메시지 작성>");
					System.out.println();

					String msg = scanner.nextLine();
					if("exit".equalsIgnoreCase(msg)) {
						System.out.println("채팅을 종료합니다");
						scanner.close();
						break;
					}
					out.writeUTF("[" + name + "]" + msg);
					out.flush();
					
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	// 메시지 받기 쓰레드
	static class ClientReceiver extends Thread {
		Socket socket;
		DataInputStream in;

		// 생성자
		public ClientReceiver(Socket socket) {
			this.socket = socket;
			try {
				in = new DataInputStream(socket.getInputStream());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		@Override
		public void run() {
			// 메시지를 받아서 화면 출력(반복)
			while (true) {
				try {
					System.out.println(in.readUTF());
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
