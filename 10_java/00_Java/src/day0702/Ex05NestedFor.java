package day0702;
//중첨 for문 (Nested For Loop)
//
//중첩 for문이란, for문 안에 또다른 for문이 들어가 있는 형태가 된다.
//중첩while과 마찬가지, 바깥쪽 for문이 한번 실행 될때마다
//안쪽 for 문은 처음부터 끝까지 반복이 된다.

public class Ex05NestedFor {
    public static void main(String[]args) {
        for(int i=1; i<=3; i++) {//for문안에 두가지의 for문이 각각 들어감.
            for(int j=41; j<=44; j++) {
                System.out.printf("i: [%d] j: [%d]\n",i,j);//1
            }
            for(int j= 141; j<=143; j++) {
                System.out.printf("i:[%d] j:[%d]\n",i,j);//2
            }
            System.out.println("-------------------");
        }
    }
}
