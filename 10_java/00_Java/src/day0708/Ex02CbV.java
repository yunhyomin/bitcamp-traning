package day0708;

import util.ArrayUtil;

// Call By Value vs Call By Reference
public class Ex02CbV {
    public static void main(String[] args) {
        int[] arr = new int[3];
        arr[0] = 10;
        arr[1] = 20;
        arr[2] = 30;
        
        ArrayUtil.get(arr, 0);
        
        for(int i = 0; i < arr.length; i++) {
            System.out.println(arr[i]);
        }

    }
}
