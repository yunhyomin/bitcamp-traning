package class2.car;

public class CarMain {

	public static void main(String[] args) {
		//Car클래스를 이용해서 객체(인스턴스)생성
		Car car1 = new Car();
		System.out.println("자동차이름 : "+car1.name);
		System.out.println("모델명 : "+car1.model);
		System.out.println("색상명 : "+car1.color);
		System.out.println("차량길이 : "+car1.CAR_LENGTH);
		System.out.println("차량폭 : "+car1.CAR_WIDTH);
		
		System.out.println("===========================");
		car1.name = "처음 가져본 자동차";
		System.out.println("자동차 이름 : "+car1.name);
//		car1.CAR_LENGTH = 400;//final(상수처리)된 변수값은 수정불가
		
		System.out.println("====기능 테스트====");
		car1.run();
		car1.stop();
		car1.back();
		car1.dispDate();
		
		
		System.out.println("=================");
		Car car2 = new Car("패밀리카","소나타","검정색");
		
		car2.run();
		car2.run(100);
		car2.stop();
		car2.back();
		car2.dispDate();
		
		System.out.println("car2 : \n"+car2);
		System.out.println("car2 : \n"+car2.toString());
	}
	 

}
