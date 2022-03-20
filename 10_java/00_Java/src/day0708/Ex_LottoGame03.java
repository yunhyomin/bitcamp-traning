package day0708;
//로또게임 3번
//사용자로부터 자동으로 할지 수동으로 할지 입력받아서 
//6개의 로또숫자를 뽑아주는 프로그램 
//만약 사용자가 자동을 선택하면 
//자도으로 1~45의 숫자 6개가 나오고 
//수동으로 하면 사용자가 1~45의 숫자 6개가 나오도록 프로그램을 작성하시오

import java.util.Scanner;
import java.util.Random;
import util.ScannerUtil;
import util.ArrayUtil;
public class Ex_LottoGame03 {
        //상수
    static final int SIZE = 6;
    static final int NUMBER_MAX = 45;
    static final int NUMBER_MIN = 1;
    public static void main(String[] args) {
      ;
    //변수
    Scanner scanner = new Scanner(System.in);
    int[] usernumbers  = new int[0];
    
    //userNumbers에 숫자를 저장한다.
    
    //userNumbers의 숫자를 출력한다.
    
    scanner.close();
}
    //숫자를 정하는 메소드
    public static int[] setNumbers(Scanner scanner,int[] arr) {
        //사용자로부터 자동으로 할지 수동으로 할지 입력을 받는다.
        String message = "1.자동 2.수동";
        int userChoice = ScannerUtil.nextInt(scanner, message,1,2);
        if(userChoice == 1) {
            arr = insertAuto(arr);
        }else if(userChoice == 2) {
            arr = insertManual(scanner,arr);
        }
        
        sort(arr);
        return arr;
    }
    
    //숫자를 정렬하는 메소드
    public static void sort(int[] arr) {
        for(int i =0; i<ArrayUtil.size(arr)-1; i++) {
            if(arr[i] > arr[i+1]) {
                int temp = arr[i];
                arr[i] = arr[i+1];
                arr[i+1] = temp;
                i=-1;
            }
        }
    }
    
    //해당 배열에 자동으로 숫자 6개를 입력해주는 메소드
    public static int[] insertAuto(int[] arr) {
        Random random = new Random();
        while(ArrayUtil.size(arr)<SIZE) {
            int number = random.nextInt(NUMBER_MAX)+1;
            if(!ArrayUtil.contains(arr, number)) {
                arr = ArrayUtil.add(arr, number);
            }
        }
        return arr;
    }
    //해당배열에 수동으로 숫자 6개를 입력해주는 메소드
    public static int[] insertManual(Scanner scanner,int[] arr) {
        String message = "1~45사이의 숫자를 입력해주세요";
        while(ArrayUtil.size(arr)<SIZE) {
            System.out.println();
            System.out.println("=====================");
            System.out.printf("[%d번 숫자:\n", ArrayUtil.size(arr)+1);
            System.out.println("=====================");
            System.out.println();
            int number = ScannerUtil.nextInt(scanner, message,NUMBER_MIN,NUMBER_MAX);
            
            if(!ArrayUtil.contains(arr, number)) {
                arr=ArrayUtil.add(arr, number);
            }else {
                System.out.println("중복된 숫자입니다.");
            }
            
        }
        return arr;
    }
    //결과를 출력하는 메소드
    public static void print(int[] arr) {
        
    }
}