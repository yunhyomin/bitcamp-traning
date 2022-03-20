package wrapper;

public class Ex02_Wrapper_Character {
	
	public static void main(String[] args) {
		//Wrapper class : Character
		char chr = 'a';
		System.out.println(Character.isAlphabetic(chr));
		System.out.println("Character.isAlphabetic('한') : "+Character.isAlphabetic('한'));
		System.out.println("Character.isLetter(0) : "+ Character.isLetter(0));
		System.out.println(Character.isDigit('0'));//true 숫자의 유무
		System.out.println(Character.isLetter('A'));//true 글자의 유무
		System.out.println(Character.isUpperCase('A'));//true 대문자
		System.out.println(Character.isLowerCase('A'));//false 소문자
		System.out.println(Character.isWhitespace(' '));//true 공백
		System.out.println(Character.isWhitespace('\t'));//true 공백으로 표현되는 것
		
		//------------------------------
		char[] chs = {'한','a',' ','A','+','0'};
		for(int i = 0; i<chs.length; i++) {
			System.out.println(chs[i]+":");
			if(Character.isDigit(chs[i])) {
				System.out.println("숫자");
			}if(Character.isLetter(chs[i])) {
				System.out.println("문자");
			}if(Character.isWhitespace(chs[i])) {
				System.out.println("공백");
			}if(Character.isUpperCase(chs[i])) {
				System.out.println("대문자 ");
			}if(Character.isLowerCase(chs[i])) {
				System.out.println("소문자");
			}if(Character.isDefined(chs[i])) {
				System.out.println("유니코드입니다.");
			}
			System.out.println();
		}
		
		
				
	}

}
