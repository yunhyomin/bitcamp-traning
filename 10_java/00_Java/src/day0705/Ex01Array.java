package day0705;
//배열(Array)
//배열이란, 같은 목적을 가진 변수를 
//똑같은 이름의 모음으로 묶어주는 것으로써
//우리가 지정한 크기만큼의 객수를 배열하나로 묶는것이다.
//예를 들어서 
//한 학생의 국어점수를 1학년 2학년 3학년으로 저장할때
//굳이 3개의 int변수를 만드는것이 아니라 
//int배열을 하나 만들어서 거기에 1학년, 2학년, 3학년 점수를 저장하게 되는것이다.

public class Ex01Array {
    public static void main(String[]srgs) {
        //배열과 선언의 초기화
        //배열의 선언과 초기화는 다음과 같이 한다.
        //데이터타입[] 배열이름 =new 데이터타입[크기];
        //배열은 , 우리가 지정해 준 크기만큼의 데이터를 저장가능하다.
        
        //크기가 3인 int배열을 만들어 보자
        int[] arr = new int[3];
        
        //우리가 변수 이름대신 배열의 번호를 통해서 값을 할당하거나 할당된 값을 불러오게 된다.
        
        //int 배열 arr의 0번칸에 10을 넣어라 
        arr[0] = 10;
        //int 배열 arr 의 0번칸의 값을 출력해라.
        System.out.println(arr[0]);
        //이렇게 배열의 몇번째 칸인지를 나타내는 숫자를 우리가 인덱스라고 한다.
        //인텍스는 0부터 시작해서 그 배열의 크기-1 까지가 끝이다.
        //만약 배열의 인덱스를 범위에 벗어나게 우리가 입력하면 
        //당연히 에러가 밸생한다.
//        System.out.println(arr[-1]);->에러
        
        //배열의 경우 , 기본형 데이터 타입의 배열일때에는 
        //우리가 아무런 값도 초기화 안해주면 모두 0으로 초기화 되고 
        //참조형 데이터 타입의 배열일때에는 
        //모두 null로 초기화가 된다.
        
        //null이란, 참조형 데이터 타입에서만 발견되는 특수한 상태로써
        //힙(heap)영역으로 향하는 주소값은 부여가 되었지만 
        //해당주소에는 아무것도 없는 상태를 우리가 null이라고 한다.
        
        //우리가 만약 배열의 전체내용을 출력하고 싶을때는 ?
        System.out.println(arr[0]);
        System.out.println(arr[1]);
        System.out.println(arr[2]);
        
        //우리가 인덱스 부분은 int변수를 통해서 지정이 가능하다.
        //그렇다면 우리가 배열 전체 내용을 출력할때
        //굳이 위에처럼 0,1,2 라는 숫자를 직접넣어주어야 할까?
        //for문을 통해서 전체내용을 출력할 수 있다.
        for(int i =0; i< arr.length; i++) {
            // arr.length는 해당배열의 크기를 불러온다.
            System.out.println(arr[i]);
        }
    }
}
