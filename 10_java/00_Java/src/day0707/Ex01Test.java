package day0707;

//Array의 메소드들을 테스트 하는클래스
import util.ArrayUtil;

public class Ex01Test {
    public static void main(String[] args) {
        // 이제는 우리가 크기가 알아서 늘어나는 배열을 만들었기 떄문에
        // 이제는 배열을 초기화 해줄때 크기를 0으로 초기화 해준다.

        int[] arr = new int[0];
        // int[]기준
//A.size(배열이름)===arr의 현재크기를 출력(arr.length)
        System.out.println("1-A. size()" + ArrayUtil.size(arr));

//B. isEmpty(배열이름)===arr에 뭐가 들어있으면 true 아니면 false
        System.out.println("1-B. isEmpty():" + ArrayUtil.isEmpty(arr));

//현재배열에 int값을 몇개 추가해보자
        arr = ArrayUtil.add(arr, 3);
        arr = ArrayUtil.add(arr, 6);
        arr = ArrayUtil.add(arr, 9);
        arr = ArrayUtil.add(arr, 2);
        arr = ArrayUtil.add(arr, 4);
        System.out.println("================");
        System.out.println("int값 추가이후");
        System.out.println("================");
//1-C.size()
        System.out.println("1-C. size():" + ArrayUtil.size(arr));
//1-D. isEmpty()
        System.out.println("1-D. isEmpty():" + ArrayUtil.isEmpty(arr));

//1-E. get(arr,index)===arr의 인덱스값 arr[index]
        System.out.println("1-E. get(2):" + ArrayUtil.get(arr, 2));

//1-F. contains(arr,int값(e))===arr에 int값 e가 들어있으면 true 없으면 false
        System.out.println("1-F.contains(2):" + ArrayUtil.contains(arr, 2));
        System.out.println("1-F. contains(450)" + ArrayUtil.contains(arr, 450));

//1-G. indexOf(arr,int값(e))===arr에 int값 e가 들어있는 index를 리턴 없으면 -1리턴
        System.out.println("1-F.indexOf(2):" + ArrayUtil.indexOf(arr, 2));
        System.out.println("1-F. indexOf(450)" + ArrayUtil.indexOf(arr, 450));

//1-H. add(arr,int값(e))===배열의 인덱스크기를 1늘리고 마지막인덱스에 int e를 추가하고 arr리턴
        System.out.println("1-H. add() 전 get(2):" + ArrayUtil.get(arr, 2));
        arr = ArrayUtil.add(arr, 2, 30);
        System.out.println("1-H. add() 후 get(2):" + ArrayUtil.get(arr, 2));
//1-I. set(arr,index,int값(e))===arr[index]의 값을e로 바꾸고 원래있던 arr[index]값은 리턴 
        System.out.println("1-I. set() 전 size():" + ArrayUtil.size(arr));
        System.out.println("1-I. set() 전 get(2):" + ArrayUtil.get(arr, 2));
        int temp = ArrayUtil.set(arr, 2, 80);
        System.out.println("1-I. set()  후 size():" + ArrayUtil.size(arr));
        System.out.println("1-I. set() 후 get(2):" + ArrayUtil.get(arr, 2));
//1-J. remove(arr,index)===arr[index]를 삭제하고 크기가 1줄어든  arr을 리턴
        System.out.println("1-J. remove() 전 get(2):" + ArrayUtil.get(arr, 2));
        System.out.println("1-J. remove() 전 size():" + ArrayUtil.size(arr));
        arr = ArrayUtil.remove(arr, 2);
        System.out.println("1-J. remove() 후 get(2):" + ArrayUtil.get(arr, 2));
        System.out.println("1-J. remove() 후 size():" + ArrayUtil.size(arr));
//1-K. removeByEliment(arr,int값(e))===arr 에서 값e를 가지는 index를 삭제한 arr을 리턴
        System.out.println("1-K. removeByElement() 전 indexOf(9):" + ArrayUtil.indexOf(arr, 9));
        arr = ArrayUtil.removeByElement(arr, 9);
        System.out.println("1-K. removeByElement() 후 indexOf(9)" + ArrayUtil.indexOf(arr, 9));
System.out.println("isEmpty():"+ ArrayUtil.isEmpty(arr));


    }
}
