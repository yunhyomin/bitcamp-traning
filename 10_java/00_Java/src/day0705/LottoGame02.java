package day0705;
//로또번호 생성기
//중복제거 버전
import java.util.Random;
public class LottoGame02 {
    public static void main(String[]args) {
        Random random = new Random();
        final int SIZE = 6;
        final int NUMBER_MAX = 45;
        
        //랜덤한 숫자를 담을 배열
        int[] numbers = new int[SIZE];
        
        //배열에 램덤한 숫자를 넣는다.
        for(int i = 0; i<numbers.length; i++) {
            numbers[i] = random.nextInt(NUMBER_MAX)+1;//1~45사이의 숫자중에 랜덤하게 6개를 골라 배열 numbers[i]에 저장.
        }
        //중간단계출력
        System.out.println("=====================");
        System.out.println("중복 제거 전");
        System.out.println("=====================");
        for(int i = 0; i<numbers.length; i++) {
            System.out.printf("numbers[%d]: %d\n",i,numbers[i]);
        }
        System.out.println("=====================");
        
        //2중 for문을 사용하여 
        //i와 j 가 다르지만 
        //numbers[i]와 numbers[j]가 같으면 
        //i에 새로운 값을 넣고 
        //다시 처음부터 검사하는 for문을 만들어보자
        for(int i = 0; i<numbers.length; i++) {
            for(int j = 0; j<numbers.length; j++) {//INT가 0일때 j가 숫자를 선택하는데 
                if(i != j && numbers[i]==numbers[j]) {                                                     
                    System.out.println("====================");
                    System.out.printf("%d와 %d에 중복!\n", i, j);
                    numbers[i] = random.nextInt(NUMBER_MAX)+1;//다시 i에 새로운값을 넣는다.
                    System.out.println("====================");
                    j = -1;//++가 되기때문에 0을 만들어서 새로운값인 i에게 중복검사를 하기위해서.
                }
            }
        }
     //중복제거 후 출력
        System.out.println("======================");
        System.out.println("중복 제거 후");
        System.out.println("=====================");
        for(int i = 0; i<numbers.length; i++) {
            System.out.printf("");
        }
        
    }
}
