package com.mystudy.ex02_buffered_filecopy;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;


public class FileCopyBufferedTest {

	public static void main(String[] args) {
		//BufferedInputStream, BufferedOutputStream 적용
		//2가지 방식으로 파일을 복사해서 속도를 비교 
		//방법1: byte단위 읽고, 쓰기 복사 (FileInputStream, FileOutputStream)
		//방법2: 버퍼기능 사용 복사 (BufferedInputStream, BufferedOutputStream)
		
		File file = new File("file/img103.png");
		
		//파일로 부터 byte단위 읽어 처리할 객체를 저장할 변수 선언
		FileInputStream fis = null;
		FileOutputStream fos = null;
		
		//버퍼사용을 위한 변수 선언
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		
		try {
			//파일에서 읽고, 쓰기 객체생성
			fis = new FileInputStream(file);
			fos = new FileOutputStream("file/img103_byte_copy.png");
			
			//파일복사
			long startTime = System.currentTimeMillis();
			
			//byte단위 파일 읽고, 쓰기처리
			int readValue = fis.read();
			while(readValue != -1) {
				fos.write(readValue);
				readValue = fis.read();
			}
			long endTime = System.currentTimeMillis();
			System.out.println("byte복사시간 : "+ (endTime-startTime));

			fis.close();
			fos.close();
			//=================================================
		
			//버퍼(Buffer)사용 복사 
			bis = new BufferedInputStream(new FileInputStream(file),1000);
			bos = new BufferedOutputStream(new FileOutputStream("file/img103_byte_copy.png"),1000);
		
			//읽고, 쓰기 
			startTime = System.currentTimeMillis();
			int readBis= bis.read();
			while(readBis != -1) {
				bos.write(readBis);
				readBis = bis.read();
			}
		
			endTime = System.currentTimeMillis();
			System.out.println("buffer복사시간 : "+ (endTime-startTime));
			
			bis.close();
			bos.close();

		} catch (IOException e) {
			e.printStackTrace();
		}
		

	}

}
