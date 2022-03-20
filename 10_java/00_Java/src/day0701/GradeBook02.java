package day0701;
//무한루프를 사용한 예제

//성적출력프로그램
//번호, 이름, 국어 점수, 영어 점수, 수학 점수를 차례대로 입력 받아서
//다음과 같은 형식에 맞추어 출력하는 프로그램을 작성하시오

//단 사용자가 1~10 사이가 아닌 번호를 입력하거나
//올바르지 않은 점수를 입력하면 
//올바른 값이 입력될때까지 다시 입력을 하도록 코드를 작성하시오

//출력 결과
//번호: ##번 이름: ###
//국어: ###점 영어: ###점 수학: ###점
//총점: ###점 평균: ###.##점
//단, 무한루프를 적용시켜 입력과 출력을 분리하여 사용자가 입력을 누를떄에만 입력만 실행이 되고 출력을 누를때에만
//기존에 저장된 정보를 토대로 해서 출력이 되게 코드를 작성한다.
//또한 사용자가 1~10을 벗어난 번호나 잘못된점수를 입력하면 올바른 값이 들어올때까지 다시 입력을 닫는다.

//힌트: 변수의 유효범위를 잘 생각해보자

//심화과정 : 만약 사용자가 아무런 정보입력도 안한 상태에서 출력을 누르면
//"아직 입력된 정보가 존재하지 않습니다"가 출력이 되게 코드를 작성하시오.

//
import java.util.Scanner;

public class GradeBook02 {
    public static void main(String[]args) {
        Scanner scanner = new Scanner(System.in);
        //상수
        final int ID_MIN = 1;
        final int ID_MAX = 10;
        final int SCORE_MIN = 0;
        final int SCORE_MAX = 100;
        final int SUBJECT_SIZE = 3;
        
        //변수
        int id= 0;
        String name= "";
        int kor = 0;
        int eng = 0;
        int math = 0;
        //만약 사용자가 입력을 하면 true로 바뀌는 boolean변수
        boolean inputSwitch = false;//사용자가 입력을 안했을때 값
        
        
        while(true) {
            System.out.println("1.입력 2.출력 3.종료");
            int userChoice = scanner.nextInt();
            
            if(userChoice == 1) {
                //사용자로부터 입력을 받는 코드를 구현한다.
                System.out.println("입력시작");
                //정수 입력값을 임시로 저장할 int변수
                int input;
                String message;
             // 번호입력받기
                message = "번호를 입력해주세요";
                System.out.println(message);
                System.out.print(">");
                input = scanner.nextInt();
                
                while(!(input >= ID_MIN && input <= ID_MAX)) {
                    System.out.println("잘못입력하셨습니다.");
                    System.out.println(message);
                    System.out.print(">");
                    input = scanner.nextInt();
                }
                id = input;
             // 이름입력받기
                message = "이름을 입력해 주세요";
                System.out.println(message);
                System.out.print(">");
                scanner.nextLine();// 버퍼메모리 비워주기
                 name = scanner.nextLine();
                // 국어점수입력
                message = "국어점수를 입력해주세요";
                System.out.println(message);
                System.out.print(">");
                input= scanner.nextInt();//다음칸에 입력될 값을 input에 저장한다.라는 뜻
                
                while(!(input>= SCORE_MIN && input<=SCORE_MAX)) {
                    System.out.println("잘못입력하셨습니다");
                    System.out.println(message);
                    System.out.print(">");
                    input = scanner.nextInt();
                }
                 kor = input;//위의 입력된 input값(국어점수)을 kor에 할당 
                // 영어점수입력
                message = "영어점수를 입력해주세요";
                System.out.println(message);
                System.out.print(">");
                input = scanner.nextInt();
                
                while(!(input>= SCORE_MIN && input<=SCORE_MAX)) {
                    System.out.println("잘못입력하셨습니다");
                    System.out.println(message);
                    System.out.print(">");
                    input = scanner.nextInt();
                }
                eng = input;//위의 입력된 input값(영어점수)을 eng에 할당
                // 수학점수입력
                message = "수힉점수를 입력해주세요";
                System.out.println(message);
                System.out.print(">");
                input = scanner.nextInt();
                
                while(!(input>= SCORE_MIN && input<=SCORE_MAX)) {
                    System.out.println("잘못입력하셨습니다");
                    System.out.println(message);
                    System.out.print(">");
                    input = scanner.nextInt();
                }
                math = input;
                
                inputSwitch = true;
                
            }else if(userChoice == 2 ) {
                //입력된 데이터를 출력하는 코드를 구현한다.
                System.out.println("출력시작");
                
                if(inputSwitch) {//inputSwitch는 true로 초기화 되었기때문에 그자체로 true가 되어 ==true 가 생략된다.
                //총점을 계산한다.
                int sum = kor+eng+math;
                //평균계산
                double aver = (double)sum/SUBJECT_SIZE;
                //결과출력
                System.out.printf("번호: %d 번 이름: %s",id,name);
                System.out.printf("국어: %03d점 영어: %03d점 수학: %03d점",kor,eng,math);
                System.out.printf("총점: %03d점 평균: %.3f점\n",sum,aver);
                
                }else {
                    System.out.println("아직 입력된 정보가 없습니다.");
                }
                
                
            }else if(userChoice == 3) {
                System.out.println("사용해주셔서 감사합니다.");
                break;
                //break란, 반복문 혹은 switch조건문에서 사용되며 break를 만나는 순간  
                //break가 속한 반복문 혹은 switch조건문은 종료된다.
            }
            
            
        }
        
        scanner.close();
    }
   
}
