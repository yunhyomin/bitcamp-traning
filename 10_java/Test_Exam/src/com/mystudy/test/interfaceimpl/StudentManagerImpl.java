package com.mystudy.test.interfaceimpl;

import java.util.ArrayList;
import java.util.List;

public class StudentManagerImpl implements StudentManager {

	List<StudentVO> list = new ArrayList<>();

	@Override
	public int insert(StudentVO vo) {
		if (isExist(vo)) {
			System.out.println(">>>>>>[fail] 동일한 Id가 존재합니다");
			return 0;
		}
		System.out.println(">>>>>>[insert!]");
		list.add(vo);
		return 1;
	}

	@Override
	public StudentVO selectOne(String id) {
		for (StudentVO vo : list) {
			if (vo.getId().equals(id)) {
				printStudent(vo);
				return vo;
			}
		}
		System.out.println(">>>[fail] 동일한 id가 존재하지 않습니다");
		return null;
	}

	@Override
	public List<StudentVO> selectList(String name) {
		List<StudentVO> stuList = new ArrayList<>();
		for (StudentVO stu : list) {
			if (stu.getName().equals(name)) {
				stuList.add(stu);
				
			}
		}
		printList(stuList);
		return stuList;
	}

	@Override
	public List<StudentVO> selectAll() {
		if (list.isEmpty()) {
			return null;
		}
		printList(list);
		return list;
	}

	@Override
	public int update(StudentVO vo) {
		StudentVO stu = selectOne(vo.getId());
		if (stu != null) {
			stu.setName(vo.getName());
			stu.setKor(vo.getKor());
			stu.setEng(vo.getEng());
			stu.setMath(vo.getMath());
			System.out.println(">>>>>>[update!]");
			printStudent(vo);
			printList(list);
			return 1;
		}
		System.out.println(">>>>>>[fail] 수정할 id가 존재하지 않습니다");
		return 0;
	}

	@Override
	public int delete(String id) {
		StudentVO stu = selectOne(id);
		if (stu != null) {
			list.remove(stu);
			System.out.println(">>>>>>[delete!]");
			printList(list);
			return 1;
		}
		System.out.println(">>>>>>[fail] 삭제할 id가 존재하지 않습니다");
		return 0;
	}

	//list에 존재하는지 여부 
	private boolean isExist(StudentVO vo) {
		for (StudentVO stu : list) {
			if (stu.getId().equals(vo.getId())) {
				return true;
			}
		}
		return false;
	}
	//데이터를 출력하는 메소드 
	private void printStudent(StudentVO vo) {
		if(vo != null) {
			System.out.println("------------------------------------------------------------");
			System.out.printf("id:%4s name:%4s 국어점수:%3d 영어점수:%3d 수학점수:%3d 총점:%3d 평균:%.2f\n"
							,vo.getId(),vo.getName(),vo.getKor(),vo.getEng(),vo.getMath(),vo.getTot(),vo.getAvg());
			System.out.println("------------------------------------------------------------");
		}else {
			System.out.println(">>>>>[Result]찾으시는 데이터가 존재하지않습니다");
		}
	}
	private void printList(List<StudentVO> list) {
		System.out.println("------------------------------------------------------------");
		for (StudentVO stu : list) {
			System.out.printf("id:%4s name:%4s 국어점수:%3d 영어점수:%3d 수학점수:%3d 총점:%3d 평균:%.2f\n"
							,stu.getId(),stu.getName(),stu.getKor(),stu.getEng(),stu.getMath(),stu.getTot(),stu.getAvg());
		}
		System.out.println("------------------------------------------------------------");
	}

}
