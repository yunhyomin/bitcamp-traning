package com.mystudy.generic1;

class BoxT<T>{
	T obj;
	void setObj(T obj) {
		this.obj = obj;
	}
	T getObj() {
		return obj;
	}
}
public class GenericWildcardExam {

	public static void main(String[] args) {
		//제네릭(Generic)  :  와일드카드(wildcard - 대표문자)
		//1. <?> : 모든타입(객체) 자료형에 대한 대표문자를 의미 
		//2. <? extends 자료형> : 자료형을 상속받은 자녀(sub)클래스타입만 가능(자료형 포함)
		//	 API : <? extends E>
		//3. <? super 자료형> : 자료형 포함, 부모(super)타입 사용
		//	 API : <? super E>
		
		BoxT<String>box1 = new BoxT<>();
		box1.setObj("문자열");
		
		BoxT<Integer> box2 = new BoxT<>();
		box2.setObj(100);
		//box2.setObj("문자열");//타입 미스매치
		//box2.setObj(100.00);//타입 미스매치 
		
		System.out.println("---------------------");
		// <?> 모든것을 담을 수 있는 형태
		BoxT<?> box3 = new BoxT<String>();
		box3 = new BoxT<Integer>();
		box3 = new BoxT<StringBuilder>();
		
		//<? extends 자료형> :  자료형 포함 sub타입(extends)한 타입 사용가능
		BoxT<? extends Number>box10 = null;
		box10 = new BoxT<Number>();
		box10 = new BoxT<Integer>();//sub타입
		box10 = new BoxT<Double>();//sub타입
		
		//[컴파일오류] Character타입은 Number타입을 상속(extends)받지 않았음
//		box10 = new BoxT<Charater>(); //타입 미스매치
	
		//[컴파일 오류] 상속관계에서 Number 자녀타입(sub)가 아님
//		box10 = new BoxT<Object>();//타입 미스매치 
		
		//<? super 자료형> : 자료형 포함 부모(super)타입 사용가능
		BoxT<? super Number>box20 = null;
		box20 = new BoxT<Number>();
		box20 = new BoxT<Object>();//super타입
		
		//[컴파일 오류] Integer가 Number의 수퍼(super)타입이 아님(자녀,자손타입임)
//		box20 = new BoxT<Integer>();//타입 미스매치 

		
	}

}














