package com.mystudy.reader_writer;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class FileReaderExam {

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
			int readChar = fr.read();
			System.out.println("첫번째 문자 : "+ readChar+ ", char : "+(char)readChar);
			
			readChar = fr.read();
			System.out.println("두번째 문자 : "+ readChar+ ", char : "+(char)readChar);
			
			readChar = fr.read();
			System.out.println("세번째 문자 : "+ readChar+ ", char : "+(char)readChar);
			
			readChar = fr.read();
			System.out.println("네번째 문자 : "+ readChar+ ", char : "+(char)readChar);
			
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
