package day0705;
//사용자로부터 로또 숫자를 입력받아 정렬하여 출력하는 프로그램.

//단 사용자가 1~45를 벗어나거나 중복된 숫자를 입력할 수 없도록 합니다.

import java.util.Scanner;

public class LottoGame04 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // 상수
        final int NUMBER_MIN = 1;
        final int NUMBER_MAX = 45;
        final int SIZE = 6;
        //숫자를 저장할 int배열
        int[] numbers = new int[SIZE];

        // 숫자입력
        for (int i = 0; i < numbers.length; i++) {
            // 숫자를 입력받는다.
            System.out.printf("%d번째 숫자\n", i + 1);
            System.out.println("1~45사이의 숫자를 입력해주세요>");
            int userNumber = scanner.nextInt();

            // 숫자가 올바르면 true,올바르지 않으면 false를 가질 boolean변수
            boolean numberCheck = true;
            //범위체크
            // 숫자가 범위에 속하는지 체크한다.
            numberCheck = (userNumber >= NUMBER_MIN && userNumber <= NUMBER_MAX);// 범위에 속하지 않으면 false
            //중복체크
            // 해당 숫자가 배열에 존재하는지 체크한다.
            for (int j = 0; j < numbers.length; j++) {
                if (userNumber == numbers[j]) {// 처음 숫자를 입력할때는 배열numbers에 아무것도 없기 때문에 false가 나올수없다.
                    numberCheck = false; // 두번째부터 false가 나올수 있다.
                }
            }
            // 만약 숫자가 범위를 벗어나거나
            // 배열에 이미 존재하면
            // 경고메세지를 출력하고 i를 1감소시킨다.
            if (numberCheck) {
                numbers[i] = userNumber;// 범위와 중복을 체크하고 true가 나온다면 배열안에 저장.
            } else {
                System.out.println("범위를 벗어나거나 중복인 숫자입니다.");
                i--;// false가 나왔으므로 다시 숫자를 입력해야 하기때문에 i가 1작아져야 한다.
            }
        } // 숫자출력(정렬하기)
        for (int i = 0; i < numbers.length; i++) {
            if (numbers[i] > numbers[i + 1]) {// 작은수부터 나오게 하기
                int temp = numbers[i];
                numbers[i] = numbers[i + 1];
                numbers[i + 1] = temp;
                i=-1;//새롭게 i=0이 되어 정렬하는것을 검사한다.
            }
            else {
            System.out.println(numbers[i]);//출력
        }
        }
        scanner.close();
    }

}
