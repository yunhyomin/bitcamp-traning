package com.mystudy.extends1;

 class Mp3Phone {
	//필드
	private String type; //전화타입
	private String phoneNo;
	
	//생성자
	public Mp3Phone(String phoneNo) {
		super();
		type = "Mp3Phone타입";
		this.phoneNo = phoneNo;
	}
	public Mp3Phone(String type, String phoneNo) {
		super();
		this.type = type;
		this.phoneNo = phoneNo;
	}
	
	//메소드
	public String getType() {
		return type;
	}

	public String getPhoneNo() {
		return phoneNo;
	}
	
	//=========================
		//전화걸기기능
		public void call() {
			System.out.println(">> 전화걸기");
		}
		//전화받기기능
		public void receiveCall() {
			System.out.println(">> 전화받기");
		}
		//전화정보보기 기능
		public void view() {
			System.out.println("타입: "+type+", 전화번호"+ phoneNo);
		}
		//음악 플레이 기능
		public void playMusic() {
			System.out.println(">> 음악 듣기");
			

		}
}
