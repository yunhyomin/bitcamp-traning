package com.mystudy.io4_filecopy;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileCopy {

	public static void main(String[] args) {
		//파일복사 : 원본파일에서 읽고 , 대상파일에 쓰기 
		//복사할 원본파일(source file : AS-IS)
		//File file = new File("src/com/mystudy/io4_filecopy/FileCopy.java");
		File file = new File("바이트_InputStream.png");
		
		//쓰기위한 대상파일(target file : TO-Be)
		//File fileOut = new File("file\\FileCopy.java_backup");
		File fileOut = new File("file/바이트_InputStream_backup.png");
		
		//파일을 읽고 쓰기위한 객체를 저장할 변수 선언
		FileInputStream fis = null;
		FileOutputStream fos = null;
		try {
			//1.파일에 읽고, 쓸 객체 생성
			fis = new FileInputStream(file);//byte단위로 파일에서 읽기
			fos = new FileOutputStream(fileOut);//byte단위로 파일에 출력
			
			//2.1byte읽고 1byte쓰기
			int value = 0;
			while(value != -1) {
			value = fis.read();
			fos.write(value);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try{
				fis.close();
				fos.close();
			}catch(IOException e) {
			e.printStackTrace();
		}
			
		
				
	}

	}
}
