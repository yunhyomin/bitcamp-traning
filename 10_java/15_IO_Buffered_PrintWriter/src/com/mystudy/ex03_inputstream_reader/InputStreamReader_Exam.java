package com.mystudy.ex03_inputstream_reader;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

public class InputStreamReader_Exam {

	public static void main(String[] args) {
		// InputStream -> Reader
		//byte처리계열 -> 문자(Character)처리 계열 전환 
		//데이터를 byte계열로 읽어들이고, 최종적으로 문자단위 처리 
		//InputStreamReader :  InputStream -> Reader전환 
		//OutputStreamWriter :  OutputStream -> Writer전환 
		//but)Writer는 쓰지 않는다 왜냐면 PrintWriter가 있기때문에
		
		File file = new File("file/test_isr.txt");
		
		FileInputStream fis = null;
		
		InputStreamReader isr = null;
		BufferedReader br = null;
		
		try {
			fis = new FileInputStream(file);
//			int readByte = fis.read();
//			System.out.println((char)readByte);
//			
//			readByte = fis.read();
//			System.out.println((char)readByte);//한글깨짐

			isr = new InputStreamReader(fis);//InputStream->Reader 형변환
			int readIsr = isr.read(); 
			System.out.println((char)readIsr);
			
			readIsr = isr.read(); 
			System.out.println((char)readIsr);
			
			//버퍼기능 사용해서 읽기(라인단위)
			br = new BufferedReader(isr);//InputStream이 Reader타입으로 바뀌었기 때문에 사용가능
			String str = br.readLine();
			System.out.println(str);
			
			while(str!=null) {
				str = br.readLine();//EOF를 만나면 null리턴
				System.out.println(str);
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
