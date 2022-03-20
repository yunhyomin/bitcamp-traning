package day0708;
//ArrayUtil을 사용한 로또번호 제작기
//첫번째 버전: 컴퓨터의 숫자만 뽑아주는 제작기
import java.util.Random;
import util.ArrayUtil;
public class Ex_LottoGame {
    //상수
    static final int SIZE = 6;
    static final int NUMBER_MAX = 45;
    public static void main(String[] args) {
        //변수
        Random random = new Random();
        //이제 우리가 배열을 만들때에는 동적할당이 이루어지기 때문에 
        //크기를 0으로 만들어준다.
        int[] numbers = new int[0];
        
        //while을 이용해서 
        //numbers의 안에서는 랜덤한 숫자를 하나 뽑아서 
        //numbers에 존재하지 않으면 
        //추가해준다.
        while(ArrayUtil.size(numbers)<SIZE) {
            int num = random.nextInt(NUMBER_MAX)+1;
            if(!(ArrayUtil.contains(numbers, num))) {
                numbers = ArrayUtil.add(numbers,num);
            }
        }
        for(int i=0; i<ArrayUtil.size(numbers)-1; i++) {
            if(ArrayUtil.get(numbers,i) > ArrayUtil.get(numbers, i+1)) {
                int temp = ArrayUtil.set(numbers,  i,
                        ArrayUtil.get(numbers,i+1));
                ArrayUtil.set(numbers, i+1, temp);
                    i= -1;
                    
                }
            }
        for(int i =0; i<ArrayUtil.size(numbers);i++){
            System.out.printf("numbers[%d]: %d\n",i,
                    ArrayUtil.get(numbers,i));
        }
    }
    
}
