package com.test.interfaceimpl;

import java.util.List;
//인터페이스 
public interface StudentManager {
	//메소드
	boolean add(StudentVO obj);//추가
	StudentVO find(String id);//찾기
	List<StudentVO> findList(String name);
	//List<StudentVO> sellectAll();모든 List보기 
	
	boolean changeKor(String id, int kor);
	boolean changeEng(String id, int eng);
	boolean changeMath(String id, int math);
	
	//boolean update(StudentVO vo);//id만 빼고 국어영어수학점수 수정
//	boolean delete(String id);
//	(int도 가능)boolean delete(StudentVO vo); 일괄수정
//	int delete(List<String> idList); id가 일치하는 학생 삭제하고 삭제한 명수 리턴
//	boolean delete(List<StudentVO> list); 학생의 정보를 모두삭제했으면 true,삭제하지 못했다면 false 일괄삭제
	
}
