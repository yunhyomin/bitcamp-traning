package com.mystudy.test.serverprogram;

import java.util.Scanner;

public class intOrNot {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		int x = scanner.nextInt();
		int y = scanner.nextInt();
		int n = 0;
		if(x<0 && y<0){
			n=3;
		}
		if(x>0 && y>0){
			n=1;
		}
		if(x>0 && y<0) {
			n=4;
		}
		if(x<0 && y>0) {
			n=2;
		}
		System.out.println("제"+ n +"사분면");

		

	}

}
