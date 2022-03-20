package day0706;
//BmiChecker
import java.util.Scanner;
import util.ScannerUtil;
public class Hw01 {
    //상수
    static final double MIN = 0.01;
    static final double HEIGHT_MAX = 2.72;
    static final double WEIGHT_MAX = 635;
    static final int AGE_MIN = 0;
    static final int AGE_MAX = 130;
    static final double BMI_STANDARD_I = 18.5;
    static final double BMI_STANDARD_II = 23;
    static final double BMI_STANDARD_III = 25;
    public static void main(String[]args) {
            Scanner scanner = new Scanner(System.in);
            //변수
            double height = 0;
            double weight = 0;
            double bmi = 0;
            String name = "";
            int age = 0;
            boolean inputSwitch = false;
            while(true) {
                int userChoice = ScannerUtil.nextInt(scanner, "1.입력 2.출력 3.종료");
                      
            if(userChoice == 1) {
            //입력 -->ScannerUtil 클래스에서 호출하기/
            String message = "";
            //이름입력
            name = ScannerUtil.nextLine(scanner,"이름");
            //나이입력
            age = ScannerUtil.nextInt(scanner, "나이");
            //키 입력
            message = "키를 m단위로 입력해주세요";
            height = ScannerUtil.nextDouble(scanner,message, MIN,HEIGHT_MAX);
            //몸무게 입력
            weight = ScannerUtil.nextDouble(scanner,"몸무게를 kg단위로 입력해주세요",MIN,WEIGHT_MAX);
            
            inputSwitch = true;
            }
            else if(userChoice ==2) {
                if(inputSwitch) {
                    //출력
                    printInfo(weight,height,name,age);
            }else {
                //입력된 전보가 없기에 출력 불가능
                System.out.println("입력된 정보가 없습니다.");
            }
            }
            else if(userChoice == 3) {
                System.out.println("시용해주셔서 감사합니다.");
                break;
            }
    } }
    //메소드 생성구간//====================================================================
    //단순 정보입력 메소드
    public static void print(String message) {
        System.out.println(message);
        System.out.print(">");
    }
    //String nextLine() 입력 및 검증 호출메소드
    public static String nextLine(Scanner scanner, String message){
      String temp = "";
     print(message);
    temp = scanner.nextLine();
    if(temp.isEmpty()){
          temp = scanner.nextLine();
    }
    return temp;
    }
   //int nextInt() 입력 및 검증 메소드
    public static int nextInt(Scanner scanner, String message,int min,int max) {
    int temp = 0;
    print(message);
    temp = scanner.nextInt();
    while(!(temp>=min && temp<=max)) {
        print(message);
        temp = scanner.nextInt();
    }
    return temp;
    }
    //double nextDouble() 입력 및 검증 호출 메소드  
    public static double nextDouble(Scanner scanner, String message, double min, double max) {
       double temp = 0;
       print(message);
       while(!(temp>=min && temp<=max)) {
           print(message);
           temp = scanner.nextDouble();
       }
       return temp;
//       ==================================================================================
    }
    //BMI계산 메소드
    public static void printInfo(double weight, double height,String name,int age) {
   
        double bmi = weight/height/height;
    //BMI 기반으로한 비만도측정 메소드
        String temp = "";
        if(bmi<BMI_STANDARD_I) {
            temp = "저체중";
        }else if(bmi<BMI_STANDARD_II) {
            temp = "정상체증";
        }else if(bmi<BMI_STANDARD_III){
            temp = "과체중";
        }else {
            temp = "비만";
        }
    
    //결과출력 메소드
    
        System.out.printf("이름: %s 나이: %d세\n 키: %.2f m 몸무게: %.2f kg\n bmi: %.2f\n 비만도: %s\n",
                name,age,height,weight,bmi,temp);
}

}
 