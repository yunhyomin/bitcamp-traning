package com.mystudy.test.interfaceimpl;

import java.util.ArrayList;
import java.util.List;

public class StudentManagerImpl2 implements StudentManager {

	List<StudentVO> list = new ArrayList<>();

	@Override
	public int insert(StudentVO vo) {
		if (isExist(vo)) {
			return 0;
		}
		list.add(vo);
		return 1;
	}

	@Override
	public StudentVO selectOne(String id) {
		for (StudentVO vo : list) {
			if (vo.getId().equals(id)) {
				return vo;
			}
		}
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
		return stuList;
	}

	@Override
	public List<StudentVO> selectAll() {
		if (list.isEmpty()) {
			return null;
		}
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
			return 1;
		}
		return 0;
	}

	@Override
	public int delete(String id) {
		StudentVO stu = selectOne(id);
		if (stu != null) {
			list.remove(stu);
			return 1;
		}
		return 0;
	}

	private boolean isExist(StudentVO vo) {
		for (StudentVO stu : list) {
			if (stu.getId().equals(vo.getId())) {
				return true;
			}
		}
		return false;
	}

}
