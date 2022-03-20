package com.mystudy.reader_writer_copy;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class FileCopyCharacterExam {

	public static void main(String[] args) {
		// FileReader, FileWriter사용해서 파일 복사
		// 원본파일 : file/test_char.txt
		// 대상파일 : file/test_char_copy.txt
		// 처리 : 원본파일을 읽어서 대상파일에 쓰기/저장(문자단위 처리)
		// 바이너리 파일은 안된다(이미지파일 등등-얘네들은 InputSteam,OutputStream을 쓰자)\

		// 사용할 파일 생성
		File file = new File("file/test_char.txt");
		File fileOut = new File("file/test_char_copy.txt");

		// 파일로부터 읽어들이고, 쓸 객체를 저장할 변수 선언
		FileReader fr = null;
		FileWriter fw = null;

		try {
			// 읽기위한 객체, 쓰기위한 객체 생성
			fr = new FileReader(file);
			fw = new FileWriter(fileOut);

			// 객체사용- 읽고 쓰기 반복(원본파일의 끝을 만날때까지)
			int readValue = 0;
			while (readValue != -1) {
				System.out.print((char) readValue);// 화면(콘솔)에 출력

				readValue = fr.read();//읽고
				fw.write(readValue);//파일에 출력
			}
			fw.flush();
		} catch (IOException e) {// 파일이 존재하지 않는 FileNotFoundException 예외상황도 포함된다.
			e.printStackTrace();
		} finally {
			if (fw != null) {
				try {// 사용객체 close
					fw.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (fr != null) {
				try {
					fr.close();
				} catch (IOException e) {
					e.printStackTrace();
				}

			}
		}

	}
}
