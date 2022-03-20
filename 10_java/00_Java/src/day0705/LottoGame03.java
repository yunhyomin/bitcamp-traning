package day0705;
//로또02에다가 정렬까지 포함하는 프로그램

    import java.util.Random;
    public class LottoGame03 {
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
                        numbers[i] = random.nextInt(NUMBER_MAX)+1;
                        System.out.println("====================");
                        j = -1;
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
            //정렬하는 코드를 구현해보자 
            //정렬은 i번째와 i+1번을 비교하여 
            //만약 i번째에 저장된 값이 더 크면 
            //2개의 위치를 바꾸고 다시 처음부터 검사해주면 된다.
            //오름차순정렬
            for(int i = 0; i< numbers.length-1; i++) {//중복검사를 5번만 하기때문에 
                if(numbers[i]>numbers[i+1]) {
                   int temp = numbers[i];//temp에다가 i값을 저장.
                   numbers[i] = numbers[i+1];
                   numbers[i+1] = temp;
                   i = -1;//다시 i가 0일때부터 검사를 하려고 정해줌(올라가면 ++이 되어서 0이 되니까)
                   
                }
            }
            //정렬 후 출력
            System.out.println("========================");
            System.out.println("정렬 후");
            System.out.println("========================");
            for(int i = 0; i<numbers.length; i++) {
                System.out.printf("numbers[%d]:",i,numbers[i]);
            }
            System.out.printf("===========================");
        }
    }


