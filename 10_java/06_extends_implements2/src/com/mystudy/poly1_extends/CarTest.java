package com.mystudy.poly1_extends;

public class CarTest {

	public static void main(String[] args) {
		System.out.println("=====Car Class======");
			Car car = new Car();
			
			car.type = "일반자동차";
			System.out.println("타입: "+car.type);
			car.drive();
			car.stop();
			
		System.out.println("=====Ambulance Class=====");
			Ambulance am = new Ambulance();
			
			am.type = "구급차";
			System.out.println("타입: "+am.type);
			//Car기능
			am.drive();
			am.stop();
			//AMbulance기능
			am.siren();
			
		System.out.println("=====FireEngine Class=====");
			FireEngine fe = new FireEngine();
			
			fe.type = "소방차";
			System.out.println("타입: "+fe.type);
			//car기능
			fe.drive();
			fe.stop();
			//FireEngine기능
			fe.siren();
			fe.water();
			
		System.out.println("=====형변환 후=====");
		Car carTemp = new Car();
		carTemp.drive();
		carTemp.stop();
		
		//Car <- Ambulance
		//자동 형변환(Super <- Sub) : Car <=== Ambulance
		System.out.println("---Car <=== Ambulance---");
		carTemp = am;
		System.out.println("타입: "+carTemp.type);//형태는 Car타입이지만 내용은 Ambulance이다.
		carTemp.drive();
		carTemp.stop();
		
		//Car타입이기 때문에 구급차의 사이렌기능을 사용못함.
		//구급차의 사이렌 기능을 사용하려면 구급차가 되어야함.
//		carTemp.siren(); 컴파일 오류
		((Ambulance)carTemp).siren(); //Sub -> Super : 명시적 형변환 처리
		
//		((FireEngine)carTemp).water(); 앰뷸런스-->소방차 변경못함
		System.out.println("-----타입확인-----");
		carTemp = am;
		System.out.println("--Object타입인경우--");
		if(carTemp instanceof Object) {
			
			System.out.println("Object타입입니다.");

		}
		System.out.println("-- Car타입인경우--");
		if(carTemp instanceof Car) {
			System.out.println("Car타입입니다.");

		}
		System.out.println("--Ambulance타입인경우--");
		if(carTemp instanceof Ambulance) {
			System.out.println("Ambulance타입입니다.");

		}
		System.out.println("--FireEngine타입인경우--");
		if(carTemp instanceof FireEngine) {
			System.out.println("FireEngine타입입니다.");

		}
			System.out.println("");

			System.out.println("Car타입전달");
			typeCheck(car);
			System.out.println("Ambulance타입전달");
			typeCheck(am);
			System.out.println("FireEngine타입전달");
			typeCheck(fe);
			
			System.out.println("=========main끝=========");

	}
	static void  typeCheck(Object obj) {
			System.out.println("===>Dbject타입입니다.");

			if(obj instanceof Car)
			System.out.println(":::Car 타입입니다.");
			System.out.println("타입: "+((Car)obj).type);
			((Car)obj).drive();
			((Car)obj).stop();
			
			if(obj instanceof Ambulance) {
				System.out.println("::: Ambulance 타입입니다.");
				System.out.println("타입: "+((Ambulance)obj).type);
				((Ambulance)obj).siren();
			}
			if(obj instanceof FireEngine) {
				System.out.println("::: FireEngine 타입 입니다.");
				System.out.println("타입: "+((FireEngine)obj).type);
				((FireEngine)obj).siren();
				((FireEngine)obj).water();

			}
			/*static void  typeCheck(Car car) {
				System.out.println(":::Car 타입입니다.");
				System.out.println("타입: "+car.type);
				car.drive();
				car.stop();
				
				if(car instanceof Ambulance) {
					System.out.println("::: Ambulance 타입입니다.");
					System.out.println("타입: "+car.type);
					((Ambulance)car).siren();
				}
				if(car instanceof FireEngine) {
					System.out.println("::: FireEngine 타입 입니다.");
					System.out.println("타입: "+car.type);
					((FireEngine)car).siren();
					((FireEngine)car).water();

				}*/		
		}
	//따로 메소드를 설정하는 법도있긴하다.
	 static void methdCheck(Car car) {
		 System.out.println(":::Car 타입입니다.");
			System.out.println("타입: "+car.type);
			car.drive();
			car.stop();
	 }
	 static void methodCheck(Ambulance am) {
				System.out.println("::: Ambulance 타입입니다.");
				System.out.println("타입: "+am.type);
				am.siren();
			}
	 static void methodCheck(FireEngine fe) {
		 System.out.println("::: FireEngine 타입 입니다.");
			System.out.println("타입: "+fe.type);
			fe.siren();
			fe.water();
		 
	 }


}

















