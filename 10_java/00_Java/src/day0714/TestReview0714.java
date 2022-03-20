package day0714;

//배열에 정수넣기 
//크기가 5인 배열을 만들고 
//for문을 사용하여 2 4 8 16 32를 할당하는 프로그램을 만들어 여기에 붙여놓으세요.
public class TestReview0714 {
    public static void main(String[] args) {
        // 크기가 5인 int배열을 선언한다.
        int[] arr = new int[5];
        // 총 5번 반복이 되는 for 문을 만든다.
        int temp = 1;
        for (int i = 0; i < 5; i++) {
            // 배열의 0번칸부터 for문의 i값과 현재배열의 i번째에 저장될 값을 곱하기 할당연산하여
            // 해당칸에 저장될 값을 계산한다.
            // 계산하면 temp =2*temp(or temp *= 2)
            temp *= 2;
            // 해당값을 i번째 값에 할당한다.
            arr[i] = temp;

        }
    }
}