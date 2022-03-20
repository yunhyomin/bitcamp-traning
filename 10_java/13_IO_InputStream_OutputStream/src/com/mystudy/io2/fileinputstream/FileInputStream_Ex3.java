package com.mystudy.io2.fileinputstream;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Arrays;

public class FileInputStream_Ex3 {

	public static void main(String[] args) {
		File file = new File("file\\test01.txt");

		FileInputStream fis = null;
		try {
			fis = new FileInputStream(file);

			byte[] bytes = new byte[10];
			System.out.println("bytes만든 직후  :" + Arrays.toString(bytes));

			int bytesCnt = 0;
			//파일내용이 끝날때까지 반복처리
			while ((bytesCnt = fis.read(bytes)) != -1) {
				//bytesCnt = fis.read(bytes);
				//if(bytesCnt == -1) break;
				System.out.println("읽어온 갯수 : " + bytesCnt);
				System.out.println("읽어온 값 bytes : " + Arrays.toString(bytes));
				for (int i = 0; i < bytesCnt; i++) {
					System.out.println("int 값 : " + bytes[i] + ", char : " + (char) bytes[i]);
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

}
