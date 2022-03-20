package day0705;
//로또배열생성기
//배열에 6개의 1~45 사이의 숫자를 담아서 
//출력하는 프로그램을 작성해보시오
//
import java.util.Random;
public class lottoGame01 {
    public static void main(String[]args) {
        Random random = new Random();
        //상수
       final int NUMBER_MIN = 1;
       final int NUMBER_MAX = 45;
       final int SIZE = 6;
       //랜덤한 숫자를 담을 배열
       int[] numbers = new int[SIZE];
       //for문을 사용하여 
       //각 인덱스에 랜덤숫자를 넣어준다.
        for(int i = 0; i <numbers.length; i++) {
           numbers[i] = random.nextInt(NUMBER_MAX)+1;//0~44까지기 때문에 +1을 하여 1~45까지로 설정.
        }
        
        //for문을 사용하여 
        //모든칸을 출력한다.
        for(int i = 0; i<numbers.length; i++) {
            System.out.printf("numbers[%d]: %d\n",i,numbers[i]);
        }
    }
}
