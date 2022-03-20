package type;
//학생의 정보를 구조체로 만들기 위한 클래스

//해당 클래스 안에는 메소드가 존재하지 않는다.
//따라서 우리가 이 클래스에서 만들 것은
//오로지 필드만 만들게 된다.


//필드 만드는 방법:
//(public) 데이터타입 필드이름
//단, public은 생략 가능하거나 다른 단어가 올 수 있다.
public class Student {
	private final int SUBJECT_SIZE = 3;//외부에서 값을 입력할 필요도 호출할 필요도 없다
										//그러니 게터세터필요없음
	// 학생의 번호
	private int id;
	// 학생의 이름
	private String name;
	// 학생의 국어 점수
	private int korean;
	// 학생의 영어 점수
	private int english;
	// 학생의 수학 점수
	private int math;

	public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getKorean() {
        return korean;
    }

    public void setKorean(int korean) {
        this.korean = korean;
    }

    public int getEnglish() {
        return english;
    }

    public void setEnglish(int english) {
        this.english = english;
    }

    public int getMath() {
        return math;
    }

    public void setMath(int math) {
        this.math = math;
    }

    // 해당학생의 총점을 계산해주는 메소드
	private int calculateSum() {
		return korean + english + math;
	}

	// 해당학생의 평균을 계산해주는 메소드
	private double calculateAverage() {
		return calculateSum() / (double)SUBJECT_SIZE;
	}

	// 해당 학생의 정보를 출력해주는 메소드
	public void printInfo() {
		System.out.printf("번호: %03d번 이름:%s\n ", id, name);
		System.out.printf("국어점수: %03d점 영어점수:%03d점 수학점수:%03d점\n", korean, english, math);
		System.out.printf("총점: %03d점 평균:%06.3f점\n", calculateSum(), calculateAverage());
	}

	// 파라미터가 있는 생성자
	// 생성자는 리턴타입이 따로 존재하지 않는다.
	// 또한 생성자의 이름은 무조선 클래스 이름과 일치해야한다.
	public Student(int id, String name, int korean, int english, int math) {
		// 클래스의 경우, 메소드의 파라미터이름과 필드이름이 같을 수 있다.
		// 단, 이름이 같을 경우
		// 별도의 표시가 없으면 해당이름은 변수를 가리키게 된다.
		//id = 3; 파라미터변수를 뜻함.

		// this란 이 메소드를 실행시키는 객체자신을 뜻한다.
		// 즉, 우리가 이 생성자에서 파라미터로 넘어온 id를 해당객체의 필드 id에 넣을때에는
		// 아래와 같이 써주면 된다.
		this.id = id;
		this.name = name;
		this.korean = korean;
		this.english = english;
		this.math = math;
	}

	public Student() {
		this.id = 0;
		this.name = "아직 입력안됨";
		this.korean = -1;
		this.english = -1;
		this.math = -1;
	}

	// java.lang.Objext안에는
	// equals()메소드가 구현되어있다.
	// 다만 내부적으로는 실제 필드의 값 비교를 하는 것이 아니라
	// 단순히 주소값비교를 하게 구현이 되어있다.
	// 만약 우리가 우리 객체가 정확하게 equals()를 사용하게 하기위해서는
	// 반드시 클래스 내부에서 equals() 메소드를 오버라이드 해주어야한다.

	public boolean equals(Object o) {
		// equals를 우리 클래스의 기준에 맞게 재정의 해보자
		// 1. 파라미터로 들어온 Object o가 이 클래스의 객체가 맞는지 부터 확인한다.
		// 이때에는 instanceof라는 키워드를 사용하면 된다.
		if (o instanceof Student) {
			// 만약 파라미터로 들어온 o가 Student클래스 객체가 맞을 경우에는 true,
		    //그외에는 false가 리턴된다.
			// Student클래스객체가 맞을경우,
			// 이때에는 Object클래스 객체 o를 형변환을 통해서 Student 클래스 s로 만들어줄 수 있다.
			Student s = (Student) o;

			// 형변환한 s와 equals()메소드를 실행하는 객체의 특정값을 비교하여
			// 같으면 true를 리턴하게 한다.
			if ( this.id== s.id) {
				return true;
			}
		}
		return false;
	}

}
