package com.test.interfaceimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

//StudentManager인터페이스를 구현해서 데이터 저장하는 클래스
public class StudentManagerImpl implements StudentManager {
//필드 : List/ Set / Map 형태의 데이터 저장소 사용
	// List<StudentVO> list;
	// Set<StudentVO> set;
	// Map<String, StudentVO> map;
	Map<String, StudentVO> students; 
	Set<String> keySet = students.keySet();
	
	
	//생성자 사용
	public StudentManagerImpl() {
		students = new HashMap<>();
	}

	@Override
	public boolean add(StudentVO obj) {
		if(isExsit(obj)) {
			System.out.println("입력되어있는 id 입니다");
			return false;
		}
		students.put(obj.getId(),obj);
			return true;
	}

	@Override
	public StudentVO find(String id) {
		if (students.containsKey(id)) {
			for (String key : keySet) {
				StudentVO vo = students.get(key);
				return vo;
			}
		} else {
			System.out.println("입력되어있는 id가 아닙니다");
		}
		return null;
	}

	@Override
	public List<StudentVO> findList(String name) {//map형식을 List형식으로 바꿔서 리턴하기 
		List<StudentVO> list = new ArrayList<>();
		for(String key : keySet) {
		list.add(students.get(key));
		return list;
		}
		
	}

	@Override
	public boolean changeKor(String id, int kor) {
		return false;
	}

	@Override
	public boolean changeEng(String id, int eng) {
		return false;
	}

	@Override
	public boolean changeMath(String id, int math) {
		return false;
	}
	
	private boolean isExsit(StudentVO vo) {
		for(String key : keySet) {
			if(key.equals(vo.getId())) {
				return false;
			}
		}return true;
	}
	
	public void printData() {
		System.out.println(students);


	}

}
