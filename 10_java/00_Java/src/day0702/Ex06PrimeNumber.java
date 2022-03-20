package day0702;
//2중 for 문을 사용하여 1부터 100까지의 소수를 구하는 프로그램
//
//1. 소수는 무엇인가
//  1과 자신외에는 약수가 없는 숫자
//  =약수가 2개인 숫자

//2.약수란 무엇인가
//  어떤수를 나눴을때 나눠 떨어지는 수 
//예)  A를 B 로 나눠서 떨어지면 B는 A의 약수이다 
//        =A를 B로 나눠서 나머지가 0이면 B는 A의 약수이다.

//3.어떤숫자의 가장 큰 약수는?
//  자기자신이다.
public class Ex06PrimeNumber {
    public static void main(String[]args) {
        //i for문을 만드는데 
        //변수i는 소수인지 아닌지 검사할 숫자가 된다.
        //그렇다면i의 최소값은?
        //그렇다면i의 최대값은?
        
        int iStart = 1;
        int iEnd = 100;
       
        for(int i=iStart; i<=iEnd; i++) {
            //i의 약수의 갯수를 저장할 
            //int변수 count
            int count = 0;
            
            //j for문을 만드는데 
            //변수j는 i의 약수인지 아닌지를 검사랑 숫자가 된다.
            //그렇다면 j의 최소값은? 1
            //그렇다면 j의 최대값은? i
            
            int jStart = 1;
            int jEnd = i;
            
            for(int j = jStart; j<=jEnd; j++) {
                if(i % j == 0) {
                    count++;
                }
            }
            
            if(count==2) {//소수는 1과 자기자신을 약수로 가지기 때문에 count가 2가 될때 그 숫자는 소수가 된다. 
                System.out.printf("%-3d는 약수입니다.\n",i);
            }
        }
    }
}
