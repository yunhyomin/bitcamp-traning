package wrapper;

public class Ex01_Wrapper_class {
	
	public static void main(String[] args) {
		//Wrapper class : 기본 데이터 타입의 기능을 확장한 클래스 총칭
		//기본데이터 타입 :  전체 소문자, char, int
		//boolean, char, byte, short, int, long, float, double
		//Wrapper class : 기본형데이터 타입의 첫글자를 대문자로 
		//예외 : char -> Character, int -> Integer
		//Boolean, Character,Byte, Short, Integer, Long, Float,Double
		
		int num =100;
		//num = "100";
		
		//Integer intNum = new Integer(100);
		Integer intNum = 100;//자동 형변환 Intrger <-int
		
		//intNum = new Integer("100");
		intNum = Integer.valueOf("100");//Integer <-String
		
		num = Integer.parseInt("100"); //int <-String
		
		intNum = 900;//Integer <-int 자동형변환
		num = intNum; //int <-Integer 자동형변환
		
		System.out.println("정수형 int 최소값 : "+ Integer.MIN_VALUE);
		System.out.println("정수형 int 최대값 : "+ Integer.MAX_VALUE);
		
		System.out.println("----------Boolean------------");
		Boolean bool = true;
		bool = new Boolean(true);
		bool = new Boolean("true"); //true : true, TRUE 대소문값 상관없이. false도 똑같다.
		System.out.println("bool : "+ bool);
		
		bool = new Boolean("true1");//참(true)을 의미하는 영단어가 아니면 모두 false.
		System.out.println("bool : "+ bool);
		
		System.out.println(Boolean.TRUE);
		System.out.println(Boolean.FALSE);
		
		System.out.println("-------String -> Boolean---------");
		bool = Boolean.valueOf("true");
		System.out.println("Boolean.valueOf(\"true\") : "+ bool);
		bool = Boolean.valueOf("TRue");
		System.out.println("Boolean.valueOf(\"TRue\") : "+ bool);
		
		bool = Boolean.valueOf("true1");
		System.out.println("Boolean.valueOf(\"true1\") : "+ bool);
		
		
		
		//=============================================================================================================
		System.out.println("-------Float, Double 동일--------");
		Float f = 10.5f; //Float <- float
		f = new Float(12.5f);
		f = new Float("12.5f");//float는 접미사(f)를 꼭 써줘야함.
		
		//Float <- String
		f = Float.valueOf("12.5f");
		System.out.println("f : " + f);//소수로 출력
		
		//String <- Float
		String str= String.valueOf(f);
		System.out.println("str : " + str);//문자열로 출력
		
		//-----------------------
		Double d = 10.5d; //Double <- double
		d = new Double(12.5d);
		d = new Double("12.5d");//double은 접미사(d)를 생략해도 가능하다.
		
		//String <- Double
		str= String.valueOf(12.5);
		System.out.println("str : "+ str);
		
		//Double <- String
		d = Double.valueOf("12.5d");
		d = Double.valueOf(str);
		System.out.println("d : "+ d);
		
	}

}





































