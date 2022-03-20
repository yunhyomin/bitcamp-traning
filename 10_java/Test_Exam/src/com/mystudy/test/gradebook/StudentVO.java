package com.mystudy.test.gradebook;

import java.io.Serializable;

public class StudentVO implements Serializable{
	private String id;
	private String name;
	private int kor;
	private int eng;
	private int math;
	private int tot;
	private double avg;
	
	public StudentVO() {
		super();
	}
	public StudentVO(String id, String name, int kor, int eng, int math) {
		this.id = id;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
		computeTotAver();
	}
    @Override
    public String toString() {
    	return id+","+name+","+kor+","+eng+","+math+","+tot+","+avg;
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
		computeTotAver();
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
		computeTotAver();
	}

	public int getMath() {
		return math;
	}

	public void setMath(int math) {
		this.math = math;
		computeTotAver();
	}

	public int getTot() {
		return tot;
	}


	public double getAvg() {
		return avg;
	}

	
	void computeTotAver() {
		this.tot = kor+eng+math;
		avg = tot*100/3/100.00;
	}
	
}
