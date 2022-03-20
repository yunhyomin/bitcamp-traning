package com.mystudy.io1.file;

import java.io.File;

public class FileExam1 {

	public static void main(String[] args) {
		//File클래스
		String separator = File.separator;//파일경로 구분자 
		System.out.println("File.separator : "+ File.separator);
		
		char separatorChar = File.separatorChar;
		System.out.println("File.separatorChar : "+ File.separatorChar);
		
		String pathSeparator = File.pathSeparator;//경로(path)구분자
		System.out.println("File.pathSeparator : "+ File.pathSeparator);
		
		System.out.println("------------");
		File[] listRoots = File.listRoots();//루트를 리턴
		for(File file : listRoots) {
			System.out.println(file);

		}


		


				

	}

}
