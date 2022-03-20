package com.mystudy.io1.file;

import java.io.File;
import java.io.IOException;

public class FileExam2 {

	public static void main(String[] args) throws IOException  {
		//파일명 :  temp.txt(파일명.확장자(명))
		File file1 = new File("temp.txt");
		
		//File객체생성은 파일의 존재여부와 관계없이 생성 가능
		System.out.println(file1);
		
		//절대경로 :  root디렉토리(폴더)로부터 전체경로를 표시해서 지정
		//C:\MyStudy\temp\aaa
		
		//상대경로 : 현재위치로 부터 찾아가고자 하는 위치를 표시해서 지정
		//.\..\..\aaa\a1 또는  ..\aaa , temp\aaa
		
		//C:\\temp\\aaa\\a1\\temp.txt
		File file2 = new File("C:\\temp\\aaa\\a1\\temp.txt");//절대주소방식
		
		//상대경로 방식(.: 현재위치, ..:상위 디렉토리(폴더))
		File file3 = new File("file\\temp.txt");
		
		//절대경로
		System.out.println("-------new File().getAbsolutePath()-------");
		System.out.println("file1의 절대경로 위치 : "+file1.getAbsolutePath());		
		System.out.println("file2의 절대경로 위치 : "+file2.getAbsolutePath());
		System.out.println("file3의 절대경로 위치 : "+file3.getAbsolutePath());

		//상대경로
		System.out.println("-------new File().getCanonicalPath()------");
		System.out.println("파일위치(file1) : "+file1.getCanonicalPath());
		System.out.println("파일위치(file2) : "+file2.getCanonicalPath());
		System.out.println("파일위치(file3) : "+file3.getCanonicalPath());
		
		System.out.println("-------new File().exists()-------");
		System.out.println("존재하냐(file1) : "+file1.exists());
		System.out.println("존재하냐(file2) : "+file2.exists());
		System.out.println("존재하냐(file3) : "+file3.exists());
		
		//파일속성정보
		System.out.println("file1.length() : "+ file1.length());
		System.out.println("file1.canRead() : "+ file1.canRead());
		System.out.println("file1.canWrite() : "+ file1.canWrite());
		System.out.println("file1.canExecute() : "+file1.canExecute());
		
		System.out.println("-------new File().getPath()-------");
		System.out.println("file1.getPath() : "+file1.getPath());
		System.out.println("file2.getPath() : "+file2.getPath());
		System.out.println("file3.getPath() : "+file3.getPath());

		System.out.println("-------new File().getName()-------");
		//파일명 (확장자 포함)
		System.out.println("file1.getName() : "+file1.getName());
		System.out.println("file2.getName() : "+file2.getName());
		System.out.println("file3.getName() : "+file3.getName());
		
		System.out.println("-------new File().isDirectory(), .isFile()-------");
		System.out.println("file1.isDirectory() : "+file1.isDirectory());
		System.out.println("file1.isFile() : "+ file1.isFile());
		
		System.out.println("============================");
		File file4 = new File("file\\temp4.txt");
		file4.delete();//파일을 삭제하고 boolean타입의 값이 리턴 
		try {
			file4.createNewFile();
		} catch (IOException e) {//IOExeption : 디렉토리가 없을 때도 
			e.printStackTrace();
		}
		
		System.out.println();

	}

}










