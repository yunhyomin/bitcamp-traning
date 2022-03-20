package day0706;
// 숙제 2.
// GradeBook 을 여러 학생을 관리할 수 있는 버젼으로 만들되
// 메소드화 시키시오.

// 비고) 앞으로 ScannerUtil은 쓰셔도 되고 안쓰셔도 되지만
//      ㅎㅎ
import java.util.Scanner;

import util.ScannerUtil;
public class Hw02 {
    //상수
        static final int SCORE_MIN = 0;
        static final int SCORE_MAX =100;
        static final int SIZE = 3;
        static final int STUDENT_SIZE = 5;
    public static void main(String[]agrs) {
        //변수배열  
        Scanner scanner = new Scanner(System.in);
            int[] idArray = new int[STUDENT_SIZE];
            int[] korArray = new int[STUDENT_SIZE];
            int[] engArray = new int[STUDENT_SIZE];
            int[] mathArray = new int[STUDENT_SIZE];
            String[] nameArray = new String[STUDENT_SIZE];
            int index = 0;
            
            while(true) {
                //각종 입력 시 출력메세지를 저장할 String 변수
                String message;
                
                message = "1.입력 2. 출력 3. 종료";
                int userChoice = ScannerUtil.nextInt(scanner, message,1,3);
                if(userChoice ==1) {
                    //입력코드구현
                    //번호
                    message = "번호를 입력해주세요";
                    idArray[index] = ScannerUtil.nextInt(scanner,message);
                    //이름
                    message = "이름을 입력해주세요";
                    nameArray[index] = ScannerUtil.nextLine(scanner, message);
                    //국어점수
                    message = "국어점수를 입력해주세요";
                    korArray[index] = ScannerUtil.nextInt(scanner,message,SCORE_MIN,SCORE_MAX);
                    //영어점수
                    message = "영어점수를 입력해주세요";
                    engArray[index] = ScannerUtil.nextInt(scanner, message,SCORE_MIN,SCORE_MAX);
                    //수학점수
                    message = "수학점수를 입력해주세요";
                    mathArray[index] = ScannerUtil.nextInt(scanner, message,SCORE_MIN,SCORE_MAX);
                    //index 1증가
                    index++;
                }else if(userChoice == 2) {
                    printAll(index,idArray,nameArray,korArray,engArray,mathArray);
                    
                }else if(userChoice == 3) {
                    System.out.println("사용해주셔서 감사합니다.");
                    break;
                }
            }
            scanner.close();
            
                }

//===========================================================================
//메소드 생성
    public static void printAll(int index, int[] idArray,String[]nameArray,int[] korArray, 
            int[]engArray,int[]mathArray) {
        if(index>0) {
            //학생 개별로 출력하는 메소드구현
            for(int i = 0; i<index; i++) {
                System.out.println("====================");
                System.out.printf("%d번 학생정보:",i+1);
                System.out.println("===================");
                int id = idArray[i]; 
                int kor = korArray[i];
                int eng = engArray[i];
                int math = mathArray[i] ;
                String name = nameArray[i];
                printOne(id,name,kor,eng,math);
            }
        }else {
            System.out.println("아직 입력된 학생이 존재하지 않습니다.");
        }
    }
    
    //출력을 담당하는메소드
    public static void printOne(int id,String name,int kor, int eng, int math) {
        int sum = kor+eng+math;
        double aver = (double)sum/SIZE;  
        
        System.out.printf("번호: %d 이름:%s",id,name);
        System.out.printf("국어점수:%03d 영어점수:%03d 수학점수:%03d\n",kor,eng,math);
        System.out.printf("총점: %03d 평균: %.2f\n",sum,aver);
    }
    }
