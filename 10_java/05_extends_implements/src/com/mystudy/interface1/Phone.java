package com.mystudy.interface1;

/*클래스 만들기 
전화기 만들기 
-속성 : 타입(type), 전화번호(phoneNo)
-기능 
1.전화정보 확인(view)
2.전화걸기 (call)
3.전화받기 (receiveCall)
4.메세지 보내기
5.메세지 받기
*/
public class Phone {
	//필드
	 private String type;
	 private String phoneNo;
	 
	//생성자
	 public Phone(String phoneNo) {
		 this.type = "아이폰";
		 this.phoneNo = phoneNo;
	 }
	//메소드
	 
	 public void view() {
		 System.out.println("타입 :"+type+"전화번호 :"+phoneNo);

	 }
	 public void call() {
		 System.out.println(">> 전화걸기");

	 }
	 public void receiveCall() {
		 System.out.println(">> 전화받기");

	 }
	 //메세지보내기
	 public void sendSms() {
		 System.out.println(">> 메세지 보내기");

	 }
	 //메세지받기
	 public void receiveSms() {
		 System.out.println(">> 메세지 받기");

	 }
	 
	
	

}
