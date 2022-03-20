package com.mystudy.string;

public class Ex03_StringExam {
	public static void main(String[] args) {
		/*
		 * String str = "900108-1234567" 
		 * 주민번호 1.정확히 입력된 데이터인지 여부 확인 
		 * (전체자리수 : 14자리인지 ,
		 * '-' : 7번째에 있는지) 
		 * 2.생년월일 출력(1-2번째: 년도, 3-4:월, 5-6:일) 
		 * 3.성별확인하고 출력(1,3:남성 2,4:여성)
		 * 4.데이터값 검중(월 1~12,일1~31) 
		 * (참고) : int num = Integer.parseInt("12") // "12"-->12
		 *******************************************************/
//		                 01234567890123
		String string = "930431-2234567";
		
		//주민번호의 자릿수와 '-'이 들어있는 자릿수확인
		if (string.length() == 14) {
			if (string.charAt(6) == '-') {
				System.out.println("정확히 입력된 데이터입니다.");
				//'-'를 체크할때 indexOf를 사용할 수있다.
				//System.out.println(string.indexOf("-")); "-"의 값이 들어있는 인덱스번 리턴
				//if(string.indexOf("-") != 6){
				//    System.out.println("'-'문자 위치가 7번째가 아닙니다.");
				//	}
				
				//생년월일 출력
				String year = string.substring(0, 2);
				String month = string.substring(2, 4);
				String day = string.substring(4, 6);
				String gender = string.substring(7,8);
				
				//90년대에 태어난 사람은 1 or 2, 2000년대에 태어난사람은 3 or 4
			
				String yyyy = "";
				if(gender.equals("1") || gender.equals("2")){
						yyyy = "19" + year;
				}else if(gender.equals("3") || gender.equals("4")){
						yyyy = "20" + year;
				}
				System.out.println("생년월일 : " + year + "년" + month + "월" + day + "일");
				System.out.println("생년월일 : " + yyyy + "년" + month + "월" + day + "일");
				
				//성별확인 1.
 				if (gender.equals("1") || gender.equals("3")) {
					System.out.println("주민번호뒷자리(첫글자) :" +gender +"이면 남성입니다.");
				} else if (gender.equals("2") || gender.equals("4")) {
					System.out.println("주민번호뒷자리(첫글자) :" +gender +"이면 여성입니다.");
				}
				//switch문으로 성별확인 2.
				switch(gender) {
				case "1" : case "3" :
					System.out.println("주민번호뒷자리(첫글자) :" +gender +"이면 남성입니다.");
					break;
				case "2" : case "4" :
					System.out.println("주민번호뒷자리(첫글자) :" +gender +"이면 여성입니다.");
				}
				//charAt() 으로 성별확인 2. (if문으로도 가능)
				char gender2 = string.charAt(7);
				switch(gender2) {
				case '1' : case '3' :
				System.out.println("주민번호뒷자리(첫글자) :" +gender2 +"이면 남성입니다.");
					break;
				case '2' : case '4' :
				System.out.println("주민번호뒷자리(첫글자) :" +gender2 +"이면 여성입니다.");
				 	break;
				default:
					System.out.println("외국인???");
					break;
				}
				
				//Stirng변수인 month와 day를 int변수로 바꿔서 
				//정확한 데이터인지 검증한다.
				int monthInt = Integer.parseInt(month);//String을 int로 형변환.
				int dayInt = Integer.parseInt(day);

				if (!(monthInt > 0 && monthInt <= 12)) {
					System.out.println("월의 데이터가 잘못되었습니다.");
				}
				String message = "잘못입력하셨습니다.";
				
				if (monthInt == 2) {
					if (!(dayInt > 0 && dayInt <= 28)) {
						System.out.println(message + "2월은 1~28일까지입니다.");
					}
				} else if (monthInt == 4 || monthInt == 6 || monthInt == 9 || monthInt == 11) {
					if (!(dayInt > 0 && dayInt <= 30)) {
						System.out.println(message + "4,6,9,11월은 1~30일까지 입니다.");
					}
				} else if (!(dayInt > 0 && dayInt <= 31)) {
					System.out.println(message + "당월은 1~31일까지입니다.");

				}

		 
		} else {
				System.out.println("'-'가 7번째에 있지 않습니다.");
			}
		}else {
			System.out.println("14자리수가 아닙니다. [전체길이] : "+ string.length()+"자리");

	}
	
	}
}
	

