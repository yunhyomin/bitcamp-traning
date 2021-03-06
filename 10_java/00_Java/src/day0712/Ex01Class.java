package day0712;
// 클래스

//객체지향 프로그래밍에서 
//최소단위를 말한다.
//즉,객체지향 프로그래밍은 클래스가 모여서 만들어지게 되는데 
//이때, 클래스의 변수를 우리가 객체라고 부른다.
//객체지향 프로그래밍이란 프로그램을 더 작은 프로그램들의 집합으로 보고 
//더 작은 프로그램들을 클래스로 만들어서 더 큰 프로그램이 그 클래스의 
//변수를 만들어서 작은 프로그램을 로딩하는 것을 객체지향프로그래밍이라고 한다.

//그렇다면 클래스란 무엇인가?
//클래스란 필드와 메소드로 이루어진 하나의 프로그램이다.
//비록 메인 메소드가 따로 있는것은 아니지만 
//우리가 그 클래스의 변수, 즉 객체를 더 큰 프로그램에서 만들면 그 클래스안의 코드들을 불러오게 되는것이다.

//클래스의 구성요소:
//1. 필드 : 해당클래스의 객체가 가지고있을 값의 종류
//2. 메소드 : 해당 클래스의 객체가 공통적으로 가지고 있을 기능들

//static
//스태틱 키워드는 해당 필드 혹은 해당 메소드를 객체로 만들지 않고 
//곧장 사용하겠다 라는 의미가 된다.
//하지만 객체지향 프로그래밍에선 모든것을 객체로 만들어서 
//그 안의 메소드/필드를 불러와서 사용하겠다 가 주된 목표가 된다.
//즉 static  키워드를 사용하게 되면 우리는 객체지향 프로그래밍이 아닌 
//절차지향프로그래밍, 즉 2세대 프로그래밍을 하겠다라는 의미가 된다.
//따라서, 정말 static이 꼭 들어가야하는 소수의 상황이 아니라면 
//static의 사용은 기피해야한다.

//생성자(Constructor)
//해당클래스의 객체를 만들때 호출되는 메소드로써
//필드값의 초기화등의 기본적인 작업을 설정할때 사용된다.
//우리가 별다른 생성자를 만들지 않더라도 자바가 기본적으로 제공해주는데,
//이런 기본 생성자들은 필드의 값을 초기화해준다.
//만약 필드가 기본형 데이터 타입이면 0으로 초기화 해주고 
//참조형 데이터 타입이면 null로 초기화 해준다.

//우리가 생성자를 따로 만들어 줄 수도 있는데,
//이때 한가지 주의할 점은 
//파라미터가 있는 생성자를 만들어 줄 수도 있는데 
//파라미터가 있는 생성자만 만들면, 더이상 기본 생성자 혹은 파라미터가 없는 생성자는 만들어줄 수 없다.

//상속(inheritance)
//상속이란, 부모클래스의 메소드를 자식 클래스가 다시 안써줘도 
//그대로 사용할 수 있게 하여 코드의 재사용성을 높여주는 방법이다.
//자바의 경우, 우리가 특별히 상속을 안해주더라도
//기본적으로 java.lang.Object 라는 클래스가 
//모든 클래스의 공통된 부모 클래스의 역할을 맡는다.
//java.lang.Objext 의 경우, 모든클래스가 기본적으로 갖추고 있을 메소드의 선언과 구현해 놓았지만 
//구현의 경우, 매우 애매모호하게 되어있기 때문에 
//자식클래스가 해당 메소드를 제대로 사용하고 싶다면
//자식믈래스 내부에서 그 메소드를 다시 만들어주어야 한다.
//이렇게 상속받은 메소드를 다시 만들어주는것, 즉 재정의 해주는 것을 
//우리는 "오버라이드(override)"라고 부른다.
//단, 오버라이드를 할 때에는 메소드의 선언식은 부모클래스의 선언식과 완전하게 일치해야한다.

//캡슐화 
//해당 클래스의 모든 필드 혹은 외부가 사용하지않고 내부적으로만 사용하는 메소드일 경우,
//접근제한자를 설정하여 외부의 모든 클래스가 아예 접근을 할 수 없게 막아버리고 
//필드의 경우 값을 저장하는 메소드와 저장된 값을 호출하는 메소드를 
//따로 만들어서 메소드를 통해서 관리하는 것을 말한다.

//접근제한자
//해당 필드 혹은 메소드에 접근 가능한 범위를 설정하는 키워드로써,
// public, 기본 ,protected, private까지 4개의 접근제한자가 존재한다.
//public: 퍼블릭 접근 제한자는 해당 필드 혹은 메소드를 어디서든지 접근 가능하게 설정한다.
//		외부패키지의 외부 클래스까지 가능.
//protected: 프로텍티드 접근 제한자는 같은 패키지의 다른 클래스면 접근 가능하지만 
//			다른 패키지에 위치한 클래스일 경우, 상속관계여야지만 접근이 가능하다.
//기본: 기본접근제한자의 경우에는 같은 패키지의 다른 클래스면 접근 가능하지만 
//		다른 패키지에 위치한 클래스의 경우, 접근이 불가능하다.
//		우리가 아무런 접근 제한자를 적어주지 않으면 자동으로 기본 접근제한자가 적용된다.
//		또한, 같은 패키지 내부에서만 접근이 가능하다고 해서 "패키지"접근 제한자 라고도 부른다.
//private: 프라이빗 접근 제한자는 해당 클래스 내부에서만 접근가능하고 다른 클래스일 경우에는 
//			어느패키지에 있던간에 접근이 아예 불가능하다.
//
//즉, 캡슐화를 적용하게 되면,
//해당 클래스의 모든 필드는 private, 외부가 반드시 알아야할 메소드가 아닐 경우에도 private,
//외부가 반드시 알아야만하는 메소드일때만 public으로 설정하게 된다.

//getter/setter
//private필드는 더이상 우리가 값을 직접 넣거나 저장된 값을 직접 호출할 수 없다.
//즉 s.id = 3이런식으로 값을 넣거나 System.out.printf(s.id); 이런식으로 저장된 값을 호출할수없게 되는것인데
//그렇다면 어떻게 값을 넣고 어떻게 값을 뺄것인가?>
//이때 우리가 getter/setter라는 메소드를 통해서 저장된 값을 호출하거나 아니면 값을 저장하게 된다.

//값을 저장할 때에는 setter라는 메소드를 사용하게 되는데 
//setter메소드는 다음과 같은 형식을 가진다.
//public void set필드이름(필드타입 필드이름) {
//	this.필드이름 = 필드이름;
//}

//저장된 값을 호출할 때에는 getter라는 메소드를 사용하게되는데 
//getter메소드는 다음과 같은 형식을 가진다.
//public 필드타입 get필드이름() {
//	return 필드이름;
//}

import type.Student;
public class Ex01Class {
	public static void main(String[] args) {
		// 객체를 선언하고 초기화 해보자
		Student s1 = new Student();
		s1.printInfo();

		s1.setId(1);
		s1.setName("윤효민"); 
		s1.setKorean(80);
		s1.setEnglish(88); 
		s1.setMath(81);

		System.out.println("s1.id:" + s1.getId());
		System.out.println("s1.printInfo()");
		s1.printInfo();

		Student s2 = new Student(10, "윤효민2", 70, 70, 71);

		s2.setId(10);
		s2.setName("윤효민2"); 
		s2.setKorean(70);
		s2.setEnglish(70); 
		s2.setMath(71);

		System.out.println("s2.id:" + s2.getId());
		System.out.println("s2.printInfo()");
		s2.printInfo();

		System.out.println("s1.equals(s2):" + s1.equals(s2));

		Student s3 = new Student(10, "윤효민", 70, 70, 71);

		s3.printInfo();
		System.out.println("s2.equals(s3):" + s2.equals(s3));

	}
}
