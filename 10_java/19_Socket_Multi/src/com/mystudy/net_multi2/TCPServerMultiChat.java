package com.mystudy.net_multi2;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.HashMap;
import java.util.Iterator;

public class TCPServerMultiChat {
	HashMap<String,DataOutputStream> clients;//접속자 명단

	public static void main(String[] args) {
		new  TCPServerMultiChat().serverStart();
		
	}
	//메소드-----------------------------------------------------------
	public TCPServerMultiChat() {
		clients = new HashMap<>();
	}
	//서버소켓 생성하고 대기하다가 
	//클라이언트가 접속하면 메시지를 받기위한 쓰레드 생성
	private void serverStart() {
		ServerSocket serverSocket = null;
		Socket socket = null;
		
		try {
		serverSocket = new ServerSocket(12345);
		System.out.println(">>서버가 시작되었습니다....");
		System.out.println("IP주소 : 포트번호 - "+ InetAddress.getLocalHost().getHostAddress()
											+" : "+serverSocket.getLocalPort());
		while(true) {
		socket = serverSocket.accept();
		System.out.println("["+socket.getInetAddress()+" : "+ socket.getPort()+"] 접속!");
		
		//접속된 클라이언트에 대한 처리 : 쓰레드 생성(읽기 쓰레드)
		 ServerReceiver thread = new ServerReceiver(socket);
		 thread.start();
		}
		
		}catch(IOException e) {
			e.printStackTrace();
	}
	}
	//쓰레드----------------------------------------------------------
	//ServerReceiver : 전달받은 socket을 이용해서 메시지 받고, 전체에게 전달
	//생성될 때 : 필드 client에 추가 
	//종료될 때 : 필드 client에서 삭제처리 
	private class ServerReceiver extends Thread{
		//필드
		Socket socket;
		DataInputStream in;
		DataOutputStream out;
		String ip;
		String name;
		
		//생성자 
		ServerReceiver(Socket socket){
			this.socket = socket;
			
			try {
				//필수 
				in = new DataInputStream(socket.getInputStream());
				out = new DataOutputStream(socket.getOutputStream());
				//
				ip = socket.getInetAddress().getHostAddress();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		@Override
		public void run() {
			//생성될때 : 필드 client에 추가 
			//종료될때 : 필드 client에서 삭제 
			//할일 :메시지 받고 전체에게 전달 
			try {
				//클라이언트로 부터 받은 첫 메시지 : 별명 (아이디)
				name = in.readUTF();
				System.out.println("접속자>> "+ name+"님이 입장했습니다");
				//이미 있는 별칭이라면 다시 선택하게끔 코딩짜기 --------------이건 나혼자 해보자!

				//접속자 정보 등록(Clients 필드)
				clients.put(name,out);

				//메시지 읽고 전체에게 전달 (반복)
				while(true) {
				String msg = in.readUTF();
				
				System.out.println(msg);//서버화면 출력
				
				//전체에게 보내기 (접속자 전원)
				sendToAll(msg);
				}
				
			} catch (IOException e) {
				e.printStackTrace();
			}finally {
				//클라이언트 접속 종료 시 처리 
				//종료할때 clients 에서 삭제 
				String outMsg = "<"+name+">님이 나갔습니다.";
				sendToAll(outMsg);
				clients.remove(name);
				System.out.println(outMsg);
			}
		}
		//메소드
		//접속된 전체 인원에게 메시지 전달
		private void sendToAll(String msg) {
			Iterator<String> ite = clients.keySet().iterator();
			while(ite.hasNext()){
				String key = ite.next();
				DataOutputStream out = clients.get(key);
				try {
					out.writeUTF(msg);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			//for문으로도 해보기 
			//for(String key : clients.keySet()) {
				
			}
		}

	}
	
	
















