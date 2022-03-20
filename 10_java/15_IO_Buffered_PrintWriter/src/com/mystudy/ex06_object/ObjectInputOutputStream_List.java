package com.mystudy.ex06_object;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ObjectInputOutputStream_List {

	public static void main(String[] args) {
		// StudentVO객체들을 ArrayList에 담아서 파일에 저장하고
		// 파일에서 읽어들인 ArrayList 객체에 담긴 VO정보를 화면에 출력
		File file = new File("file/object_io_list.data");

		System.out.println(">>>저장할 데이터 작성");
		StudentVO stu1 = new StudentVO("21001", "김유신", 95, 90, 85);
		StudentVO stu2 = new StudentVO("21002", "홍길동", 100, 90, 81);
		System.out.println("stu1 : " + stu1);
		System.out.println("stu2 : " + stu2);
		System.out.println("===============================");

		// ArrayList에 담기
		List<StudentVO> list = new ArrayList<>();
		list.add(stu1);
		list.add(stu2);
		System.out.println("------------------------");

		// ArrayList 타입의 객체를 파일에 저장(Output)

//		FileOutputStream fos = null;
//		ObjectOutputStream oos = null;
		
		System.out.println("======list를 file에 출력(Output)======");

		try (FileOutputStream fos = new FileOutputStream(file);
				ObjectOutputStream oos = new ObjectOutputStream(fos)) {
//			fos = new FileOutputStream(file);
//			oos = new ObjectOutputStream(fos);

			oos.writeObject(list);

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		System.out.println("======list를 file에서 읽기(Input)======");

		// 파일에 저장된 ArrayList 객체를 읽어서 화면출력(Input)(화면출력은 내가 확인하기 위해서 하는것)
//		FileInputStream fis = null;
//		ObjectInputStream ois = null;

		try (FileInputStream fis =new FileInputStream(file);
		ObjectInputStream ois =new ObjectInputStream(fis);){
//			fis = new FileInputStream(file);
//			ois = new ObjectInputStream(fis);

			// 화면출력시 toString() 사용하지 말고 필드값 추출해서 화면 출력
			List<StudentVO> listAll = (List<StudentVO>)ois.readObject();
			
			for(int i=0; i<listAll.size(); i++) {
				StudentVO svo = listAll.get(i);
				svo.getName();//등등
				//뽑고싶은 데이터를 뽑으면 된다 
			}
			
			for(StudentVO vo : listAll) {
				System.out.println("id:"+vo.getId()+" name:"+vo.getName()
				+" 국어점수:"+vo.getKor()+" 영어점수:"+vo.getEng()+" 수학점수:"+vo.getMath()
				+" 총점:"+ vo.getTot()+" 평균:"+vo.getAver());
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

	}


