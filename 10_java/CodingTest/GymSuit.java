package com.mystudy.test.serverprogram;

import java.util.Arrays;

public class GymSuit {
	class Solution {
	    public int solution(int n, int[] lost, int[] reserve) {
	        int answer = 0;
	        Arrays.sort(lost);
	        Arrays.sort(reserve);
	        int [] gym = new int[n];
	        
	        for(int i=0; i<lost.length; i++) {
	        	lost[i] = 
	        }
	         answer= n-(lost.length)+(reserve.length);
	     	  
	        return answer;
	    }
	}

}
