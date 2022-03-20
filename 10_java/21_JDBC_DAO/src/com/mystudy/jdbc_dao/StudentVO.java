package com.mystudy.jdbc_dao;

public class StudentVO {
	private String id;
	private String name;
	private int kor;
	private int eng;
	private int math;
	private int tot;
	private double avg;
	
	public StudentVO(String id, String name, int kor, int eng, int math) {
		super();
		this.id = id;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
		computeTotAvg();
	}
	public StudentVO(String id, String name, int kor, int eng, int math, int tot, double avg) {
		super();
		this.id = id;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
		computeTotAvg();
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
		computeTotAvg();
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
		computeTotAvg();
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
		computeTotAvg();
	}
	public int getTot() {
		return tot;
	}
	public double getAvg() {
		return avg;
	}


	@Override
	public String toString() {
		return "StudentVO[id="+id+", name="+name+", kor="+kor+", eng="+eng+", math="+math
							+", tot="+tot+", avg="+avg;
	}

	private void computeTotAvg() {
		tot = kor + eng + math;
		avg = Math.round(tot*100/3.0)/100.0;//소수점 2자리 이하는 반올림 
	}
	}











