package com.mystudy.reader_writer;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class FileReaderExam2 {

	public static void main(String[] args) {
		//문자(Character)단위 입력처리
		//FileReader : 파일로 부터 문자단위 데이터 읽기
		//문자단위  : 1, A, $- 1byte문자
		//		대,한,핡 - 2byte문자 (한글, 중국어, 일본어, 아랍어, 태국어....)
		//-------------------------------------------------------
		
		File file = new File("file\\test_char.txt");
		
		FileReader fr = null;
		
		try {
			//객체생성
			fr = new FileReader(file);
			
			//객체사용 작업처리
			//[실습]반복문으로 처리
			int readChar = 0;
			int number = 1;
			while((readChar = fr.read()) != -1) {
			System.out.print((char)readChar);
			//System.out.println(number+"번째 문자 : "+ readChar+ ", char : "+(char)readChar);
			number++;
			}
		} catch (FileNotFoundException e) {
			//System.out.println("[예외발생] 읽을 파일이 없습니다.");
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				if(fr != null)fr.close();
			}catch(IOException e) {
				e.printStackTrace();
			}
		}

	}

}
