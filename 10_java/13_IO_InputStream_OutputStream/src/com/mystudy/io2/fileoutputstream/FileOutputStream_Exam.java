package com.mystudy.io2.fileoutputstream;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;
public class FileOutputStream_Exam {

	public static void main(String[] args) {
		//FileOutputStream : byte단위로 파일에 저장(출력, 쓰기)
		//-OutputStream 추상클래스를 상속확장(extends)해서 만들어진 클래스 
		
		//File에 쓰기위한 FileOutputStream타입의 객체 저장을 위한 변수 선언
		FileOutputStream fos = null;
		File file = new File("file\\test_out_01.txt");
		
		try {
			//1.객체(인스턴스) 생성
			//fos = new FileOutputStream(file);//파일내용 삭제 후 쓰기
			
			//FileOutputStream(file,append)
			fos = new FileOutputStream(file, true);//추가하는 형태 출력. true아닌 false면 삭제후 출력
			
			//2.객체 사용
			fos.write('H');
			fos.write('E');
			fos.write('L');
			fos.write('L');
			fos.write('O');
			fos.write('~');
			
			
			byte[] bytes = "Hello Java!!!".getBytes();//문자열을 바이트타입으로 바꿔서 배열에 저장.
			System.out.println("bytes : "+ Arrays.toString(bytes));
			//write(바이트배열) : 바이트배열 값을 파일에 출력(쓰기)
			fos.write(bytes);
			
			//write(byte[] b, int off, int len)
			fos.write(bytes, 6, 7);///6번 인덱스에서 7개의 문자를 추출해서 출력(쓰기)
			fos.write('\n');
			
		} catch (FileNotFoundException e) {//파일이 없을때 
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}




















