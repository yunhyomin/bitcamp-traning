package util;
//배열을 사용할 때

//도움이 될만한 메소드들을 구현한 클래스
import type.Board;
import type.Student;

public class ArrayUtil {
	// 1. int 배열
	// A. size()
	// 해당 배열의 크기를 리턴한다.
	public static int size(int[] arr) {
		return arr.length;
	}

	// B. isEmpty()
	// 해당 배열의 엘리먼트가 존재하지 않으면 true
	// 존재하면 false가 나온다.
	// 단, 해당 메소드는 동적 할당이 되어있는
	// 메소드에만 적용가능하다.
	public static boolean isEmpty(int[] arr) {
		return size(arr) == 0;
	}

	// C. get()
	// 파라미터로 들어온 배열에 파라미터로 들어온 인덱스 값에 있는 값을
	// 리턴한다.
	public static int get(int[] arr, int index) {
		return arr[index];
	}

	// D. contains()
	// 파라미터로 들어온 배열에 파라미터로 들어온 int 값이 존재하면 true,
	// 존재하지 않으면 false가 리턴된다.
	public static boolean contains(int[] arr, int e) {
		for (int i = 0; i < size(arr); i++) {
			if (get(arr, i) == e) {
				return true;
			}
		}
		return false;
	}

	// E. indexOf
	// 해당 배열에서 파라미터 e의 인덱스를 리턴해주는 메소드.
	// 단, 해당 배열에 e가 존재하지 않는다면 -1이 리턴된다.
	// 또한 e와 같은 값이 배열에 여러 칸에 있으면
	// 가장 먼저 등장하는 칸의 인덱스를 리턴한다.
	public static int indexOf(int[] arr, int e) {
		for (int i = 0; i < size(arr); i++) {
			if (get(arr, i) == e) {
				return i;
			}
		}
		return -1;
	}

	// F. lastIndexOf
	// 해당 배열에 가장 마지막에 등장하는 e의 인덱스를 리턴한다.
	// 단, e가 배열에 없을 시에는 -1이 리턴된다.
	public static int lastindexOf(int[] arr, int e) {
		for (int i = size(arr) - 1; i >= 0; i--) {
			if (get(arr, i) == e) {
				return i;
			}
		}
		return -1;
	}

	// G. clear()
	// 아무것도 없는 배열을 리턴한다.
	public static int[] clear(int[] arr) {
		int[] temp = new int[0];
		return temp;
	}

	// H. add()
	// 파라미터로 들어온 배열에 e를
	// 가장 끝에 추가하는 메소드.
	// 추가될 때마다 해당 배열의 길이는 1씩 늘어난다.
	public static int[] add(int[] arr, int e) {
		// 1. 기존의 내용을 임시 보관할 배열을 만든다.
		int[] temp = new int[size(arr)];

		// 2. arr의 내용을 temp에 복사한다.
		for (int i = 0; i < size(arr); i++) {
			temp[i] = get(arr, i);
		}

		// 3. arr의 크기를 1 늘린다.
		arr = new int[size(temp) + 1];

		// 4. temp의 내용을 arr에 복사한다.
		for (int i = 0; i < size(temp); i++) {
			arr[i] = get(temp, i);
		}

		// 5. arr의 가장 마지막 인덱스에 e를 넣는다.
		int lastIndex = size(arr) - 1;
		arr[lastIndex] = e;

		// 6. 그렇게 크기가 늘어난 arr을 리턴한다.
		return arr;
	}

	// I. add()
	// 파라미터로 들어온 배열에 특정 index에 e를 추가하는 메소드.
	// 단, index가 유효하지 않을 경우에는 원래 배열을 리턴한다.
	public static int[] add(int[] arr, int index, int e) {
		// index가 유효한 범위이면
		// 진행하고 아니면 아무것도 안한다.
		if (index >= 0 && index < size(arr)) {
			// 유효한 index이므로
			// 배열에 추가하기 시작한다.

			// 임시 보관할 배열 temp
			int[] temp = new int[size(arr)];

			for (int i = 0; i < size(arr); i++) {
				temp[i] = get(arr, i);
			}

			// arr의 크기를 1 늘린다.
			arr = new int[size(temp) + 1];

			// temp의 값 중 인덱스 0번부터 ~ index-1번까지 arr에 복사한다.
			for (int i = 0; i < index; i++) {
				arr[i] = get(temp, i);
			}

			// temp의 index번 칸에 e를 넣는다.
			arr[index] = e;

			// temp의 값 중 index번 칸부터 끝까지를 arr에 한칸씩 뒤로 밀어서 복사한다.
			for (int i = index; i < size(temp); i++) {
				arr[i + 1] = get(temp, i);
			}
		}
		return arr;
	}

	// J. set()
	// 해당 배열의 특정 위치의 값을 다른 값으로 바꾼다.
	// 단, 원래 있던 값은 우리가 다른데서 사용할 '수'도 있으니깐
	// 리턴되서 호출된 곳으로 보내주도록 한다.
	public static int set(int[] arr, int index, int e) {
		int temp = get(arr, index);
		arr[index] = e;

		return temp;
	}

	// K. remove()
	// 해당 배열에 특정 인덱스를 삭제하고
	// 크기가 1 줄어든 배열을 리턴한다.
	public static int[] remove(int[] arr, int index) {
		if (index >= 0 && index < size(arr)) {
			// 먼저 arr의 현재 내용을 임시로 만든 배열에 저장한다.
			int[] temp = new int[size(arr)];
			for (int i = 0; i < size(arr); i++) {
				temp[i] = get(arr, i);
			}

			// arr의 크기를 1 줄여서 새로 만든다.
			arr = new int[size(temp) - 1];

			// temp로부터 0부터 index이전까지 복사한다.
			for (int i = 0; i < index; i++) {
				arr[i] = get(temp, i);
			}
			// temp로부터 index+1부터 끝까지 복사한다.
			for (int i = index + 1; i < size(temp); i++) {
				arr[i - 1] = get(temp, i);
			}
		}

		return arr;
	}

	// L. removeByElement()
	// 해당 배열에서 특정 엘리먼트와 일치하는 칸을 삭제한다.
	// 단, 다른 데이터타입은 오버로딩이 가능하기 때문에 remove() 라고 해줘도 되지만,
	// int[]의 기준에서는 파라미터로 들어온 int값이 인덱스를 말하는지, 삭제할 엘리먼트를 말하는건지
	// 불명확하기 때문에 int[]만 메소드 이름을
	// removeByElement()라고 한다.
	public static int[] removeByElement(int[] arr, int e) {

		return remove(arr, indexOf(arr, e));
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////	
	// 2. Double 배열
	// A. size()
	// 해당 배열의 크기를 리턴한다.
	public static int size(double[] arr) {
		return arr.length;
	}

	// B. isEmpty()
	// 해당 배열의 엘리먼트가 존재하지 않으면 true
	// 존재하면 false가 나온다.
	// 단, 해당 메소드는 동적 할당이 되어있는
	// 메소드에만 적용가능하다.
	public static boolean isEmpty(double[] arr) {
		return size(arr) == 0;
	}

	// C. get()
	// 파라미터로 들어온 배열에 파라미터로 들어온 인덱스 값에 있는 값을
	// 리턴한다.
	public static double get(double[] arr, int index) {
		return arr[index];
	}

	// D. contains()
	// 파라미터로 들어온 배열에 파라미터로 들어온 double 값이 존재하면 true,
	// 존재하지 않으면 false가 리턴된다.
	public static boolean contains(double[] arr, double e) {
		for (int i = 0; i < size(arr); i++) {
			if (get(arr, i) == e) {
				return true;
			}
		}
		return false;
	}

	// E. indexOf
	// 해당 배열에서 파라미터 e의 인덱스를 리턴해주는 메소드.
	// 단, 해당 배열에 e가 존재하지 않는다면 -1이 리턴된다.
	// 또한 e와 같은 값이 배열에 여러 칸에 있으면
	// 가장 먼저 등장하는 칸의 인덱스를 리턴한다.
	public static int indexOf(double[] arr, double e) {
		for (int i = 0; i < size(arr); i++) {
			if (get(arr, i) == e) {
				return i;
			}
		}
		return -1;
	}

	// F. lastIndexOf
	// 해당 배열에 가장 마지막에 등장하는 e의 인덱스를 리턴한다.
	// 단, e가 배열에 없을 시에는 -1이 리턴된다.
	public static int lastindexOf(double[] arr, double e) {
		for (int i = size(arr) - 1; i >= 0; i--) {
			if (get(arr, i) == e) {
				return i;
			}
		}
		return -1;
	}

	// G. clear()
	// 아무것도 없는 배열을 리턴한다.
	public static double[] clear(double[] arr) {
		double[] temp = new double[0];
		return temp;
	}

	// H. add()
	// 파라미터로 들어온 배열에 e를
	// 가장 끝에 추가하는 메소드.
	// 추가될 때마다 해당 배열의 길이는 1씩 늘어난다.
	public static double[] add(double[] arr, double e) {
		// 1. 기존의 내용을 임시 보관할 배열을 만든다.
		double[] temp = new double[size(arr)];

		// 2. arr의 내용을 temp에 복사한다.
		for (int i = 0; i < size(arr); i++) {
			temp[i] = get(arr, i);
		}

		// 3. arr의 크기를 1 늘린다.
		arr = new double[size(temp) + 1];

		// 4. temp의 내용을 arr에 복사한다.
		for (int i = 0; i < size(temp); i++) {
			arr[i] = get(temp, i);
		}

		// 5. arr의 가장 마지막 인덱스에 e를 넣는다.
		int lastIndex = size(arr) - 1;
		arr[lastIndex] = e;

		// 6. 그렇게 크기가 늘어난 arr을 리턴한다.
		return arr;
	}

	// I. add()
	// 파라미터로 들어온 배열에 특정 index에 e를 추가하는 메소드.
	// 단, index가 유효하지 않을 경우에는 원래 배열을 리턴한다.
	public static double[] add(double[] arr, int index, double e) {
		// index가 유효한 범위이면
		// 진행하고 아니면 아무것도 안한다.
		if (index >= 0 && index < size(arr)) {
			// 유효한 index이므로
			// 배열에 추가하기 시작한다.

			// 임시 보관할 배열 temp
			double[] temp = new double[size(arr)];

			for (int i = 0; i < size(arr); i++) {
				temp[i] = get(arr, i);
			}

			// arr의 크기를 1 늘린다.
			arr = new double[size(temp) + 1];

			// temp의 값 중 인덱스 0번부터 ~ index-1번까지 arr에 복사한다.
			for (int i = 0; i < index; i++) {
				arr[i] = get(temp, i);
			}

			// temp의 index번 칸에 e를 넣는다.
			arr[index] = e;

			// temp의 값 중 index번 칸부터 끝까지를 arr에 한칸씩 뒤로 밀어서 복사한다.
			for (int i = index; i < size(temp); i++) {
				arr[i + 1] = get(temp, i);
			}
		}
		return arr;
	}

	// J. set()

	public static double set(double[] arr, int index, double e) {
		double temp = get(arr, index);
		arr[index] = e;

		return temp;
	}

	// K. remove()
	// 해당 배열에 특정 인덱스를 삭제하고
	// 크기가 1 줄어든 배열을 리턴한다.
	public static double[] remove(double[] arr, int index) {
		if (index >= 0 && index < size(arr)) {
			// 먼저 arr의 현재 내용을 임시로 만든 배열에 저장한다.
			double[] temp = new double[size(arr)];
			for (int i = 0; i < size(arr); i++) {
				temp[i] = get(arr, i);
			}

			// arr의 크기를 1 줄여서 새로 만든다.
			arr = new double[size(temp) - 1];

			// temp로부터 0부터 index이전까지 복사한다.
			for (int i = 0; i < index; i++) {
				arr[i] = get(temp, i);
			}
			// temp로부터 index+1부터 끝까지 복사한다.
			for (int i = index; i < size(arr); i++) {
				arr[i] = get(temp, i + 1);
			}
		}

		return arr;
	}

	// L. remove(arr, element)
	public static double[] remove(double[] arr, double e) {
		return remove(arr, indexOf(arr, e));
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////		
//3. String 배열
	// A. size()
	public static int size(String[] arr) {
		return arr.length;
	}

	// B. isEmpty()
	public static boolean isEmpty(String[] arr) {
		return size(arr) == 0;
	}

	// C. get()
	public static String get(String[] arr, int index) {
		return arr[index];
	}

	// D. contains()
	public static boolean contains(String[] arr, String e) {
		for (int i = 0; i < size(arr); i++) {
			if (get(arr, i).equals(e)) {
				return true;
			}
		}
		return false;
	}

	// E. indexOf
	public static int indexOf(String[] arr, String e) {
		for (int i = 0; i < size(arr); i++) {
			if (get(arr, i).equals(e)) {
				return i;
			}
		}
		return -1;
	}

	// F. lastIndexOf
	public static int lastindexOf(String[] arr, String e) {
		for (int i = size(arr) - 1; i >= 0; i--) {
			if (get(arr, i).equals(e)) {
				return i;
			}
		}
		return -1;
	}

	// G. clear()
	public static String[] clear(String[] arr) {
		String[] temp = new String[0];
		return temp;
	}

	// H. add()
	public static String[] add(String[] arr, String e) {
		// 1. 기존의 내용을 임시 보관할 배열을 만든다.
		String[] temp = new String[size(arr)];

		// 2. arr의 내용을 temp에 복사한다.
		for (int i = 0; i < size(arr); i++) {
			temp[i] = get(arr, i);
		}

		// 3. arr의 크기를 1 늘린다.
		arr = new String[size(temp) + 1];

		// 4. temp의 내용을 arr에 복사한다.
		for (int i = 0; i < size(temp); i++) {
			arr[i] = get(temp, i);
		}

		// 5. arr의 가장 마지막 인덱스에 e를 넣는다.
		int lastIndex = size(arr) - 1;
		arr[lastIndex] = e;

		// 6. 그렇게 크기가 늘어난 arr을 리턴한다.
		return arr;
	}

	// I. add(index)
	public static String[] add(String[] arr, int index, String e) {
		// index가 유효한 범위이면
		// 진행하고 아니면 아무것도 안한다.
		if (index >= 0 && index < size(arr)) {
			// 유효한 index이므로
			// 배열에 추가하기 시작한다.

			// 임시 보관할 배열 temp
			String[] temp = new String[size(arr)];

			for (int i = 0; i < size(arr); i++) {
				temp[i] = get(arr, i);
			}

			// arr의 크기를 1 늘린다.
			arr = new String[size(temp) + 1];

			// temp의 값 중 인덱스 0번부터 ~ index-1번까지 arr에 복사한다.
			for (int i = 0; i < index; i++) {
				arr[i] = get(temp, i);
			}

			// temp의 index번 칸에 e를 넣는다.
			arr[index] = e;

			// temp의 값 중 index번 칸부터 끝까지를 arr에 한칸씩 뒤로 밀어서 복사한다.
			for (int i = index; i < size(temp); i++) {
				arr[i + 1] = get(temp, i);
			}
		}
		return arr;
	}

	// J. set()
	//
	public static String set(String[] arr, int index, String e) {
		String temp = get(arr, index);
		arr[index] = e;

		return temp;
	}

	// K. remove(arr, index)
	// 해당 배열에 특정 인덱스를 삭제하고
	// 크기가 1 줄어든 배열을 리턴한다.
	public static String[] remove(String[] arr, int index) {
		if (index >= 0 && index < size(arr)) {
			// 먼저 arr의 현재 내용을 임시로 만든 배열에 저장한다.
			String[] temp = new String[size(arr)];
			for (int i = 0; i < size(arr); i++) {
				temp[i] = get(arr, i);
			}

			// arr의 크기를 1 줄여서 새로 만든다.
			arr = new String[size(temp) - 1];

			// temp로부터 0부터 index이전까지 복사한다.
			for (int i = 0; i < index; i++) {
				arr[i] = get(temp, i);
			}
			// temp로부터 index+1부터 끝까지 복사한다.
			for (int i = index; i < size(arr); i++) {
				arr[i] = get(temp, i + 1);
			}
		}
		return arr;
	}

	// L. remove(arr, element)
	public static String[] remove(String[] arr, String e) {
		return remove(arr, indexOf(arr, e));
	}

//////////////////////////////////////////////////////////////////////////////////////////////
//4. Student[]
//A. equals(s1, s2)
//	public static boolean equals(Student s1, Student s2) {
//		return s1.id == s2.id;
//	}

//B. size()
	public static int size(Student[] arr) {
		return arr.length;
	}

//C.get()
	public static Student get(Student[] arr, int index) {
		return arr[index];
	}

//D.  contains()   
	public static boolean contains(Student[] arr, Student e) {
		for (int i = 0; i < arr.length; i++) {
			if (e.equals(get(arr,i))) {
				return true;
			}
		}
		return false;
	}

//E. indexOf()
	public static int indexOf(Student[] arr, Student e) {
		for (int i = 0; i < size(arr); i++) {
			if (e.equals(get(arr,i))) {
				return i;
			}
		}
		return -1;
	}
//F.isEmpty()
	public static boolean isEmpty(Student[] arr) {
		return size(arr) == 0;
	}
	

	
	//      G. lastIndexOf()
	public static int lastIndexOf(Student[] arr, Student e) {
		for (int i = size(arr) - 1; i >= 0; i--) {
			if (e.equals(get(arr,i))) {
				return i;
			}
		}
		return -1;
	}

//      H. add()
	public static Student[] add(Student[] arr, Student e) {
		Student[] temp = new Student[size(arr)];
		for (int i = 0; i < size(arr); i++) {
			temp[i] = get(arr, i);
		}
		arr = new Student[size(temp) + 1];
		for (int i = 0; i < size(temp); i++) {
			arr[i] = get(temp, i);
		}
		arr[size(arr) - 1] = e;

		return arr;
	}

//      I. add(Index)
	public static Student[] add(Student[] arr, int index, Student e) {
		if (index >= 0 && index < size(arr)) {
			Student[] temp = new Student[size(arr)];
			for (int i = 0; i < size(arr); i++) {
				temp[i] = get(arr, i);
			}
			arr = new Student[size(temp) + 1];

			for (int i = 0; i < index; i++) {
				arr[i] = get(temp, i);
			}
			arr[index] = e;
			
			for(int i= index; i<size(temp); i++) {
				arr[i+1] = get(temp,i);
			}
		}
		return arr;
	}
//	J.set()
	public static Student set(Student[] arr, int index,Student e) {
		Student temp  = get(arr,index);
		arr[index] = e;
		return temp;
	}
//	K.remove()
	public static Student[] remove(Student[] arr, int index) {
		if(index>=0 && index< size(arr)) {
			Student[] temp = new Student[size(arr)];
			for(int i= 0; i<size(arr); i++) {
				temp[i] = get(arr,i);
			}
			arr = new Student[size(temp)-1];
			for(int i= 0; i<index; i++) {
				arr[i] = get(temp,i);
			}
			for(int i=index+1; i<size(temp); i++) {
				arr[i-1] = get(temp,i);
			}
		}
		return arr;
	}
//	remove
	public static Student[] remove(Student[] arr, Student e) {
		return remove(arr,indexOf(arr,e));
		
	}
///////////////////////////////////////////////////////////////////////////////////////////////	
	//5. Board[]
	

	//B. size()
		public static int size(Board[] arr) {
			return arr.length;
		}

	//C.get()
		public static Board get(Board[] arr, int index) {
			return arr[index];
		}

	//D.  contains()   
		public static boolean contains(Board[] arr, Board e) {
			for (int i = 0; i < arr.length; i++) {
				if (e.equals(get(arr, i))) {
					return true;
				}
			}
			return false;
		}

	//E. indexOf()
		public static int indexOf(Board[] arr, Board e) {
			for (int i = 0; i < size(arr); i++) {
				if (e.equals(get(arr, i))) {
					return i;
				}
			}
			return -1;
		}
//F.isEmpty()
		public static boolean isEmpty(Board[] arr) {
			return size(arr) == 0;
		}
		
		
//	      G. lastIndexOf()
		public static int lastIndexOf(Board[] arr, Board e) {
			for (int i = size(arr) - 1; i >= 0; i--) {
				if (e.equals(get(arr, i))) {
					return i;
				}
			}
			return -1;
		}

//	      H. add()
		public static Board[] add(Board[] arr, Board e) {
			Board[] temp = new Board[size(arr)];
			for (int i = 0; i < size(arr); i++) {
				temp[i] = get(arr, i);
			}
			arr = new Board[size(temp) + 1];
			for (int i = 0; i < size(temp); i++) {
				arr[i] = get(temp, i);
			}
			arr[size(arr) - 1] = e;

			return arr;
		}

//	      I. add(Index)
		public static Board[] add(Board[] arr, int index, Board e) {
			if (index >= 0 && index < size(arr)) {
				Board[] temp = new Board[size(arr)];
				for (int i = 0; i < size(arr); i++) {
					temp[i] = get(arr, i);
				}
				arr = new Board[size(temp) + 1];

				for (int i = 0; i < index; i++) {
					arr[i] = get(temp, i);
				}
				arr[index] = e;
				
				for(int i= index; i<size(temp); i++) {
					arr[i+1] = get(temp,i);
				}
			}
			return arr;
		}
//		J.set()
		public static Board set(Board[] arr, int index,Board e) {
			Board temp  = get(arr,index);
			arr[index] = e;
			return temp;
		}
//		K.remove(index)
		public static Board[] remove(Board[] arr, int index) {
			if(index>=0 && index< size(arr)) {
				Board[] temp = new Board[size(arr)];
				for(int i= 0; i<size(arr); i++) {
					temp[i] = get(arr,i);
				}
				arr = new Board[size(temp)-1];
				for(int i= 0; i<index; i++) {
					arr[i] = get(temp,i);
				}
				for(int i=index+1; i<size(temp); i++) {
					arr[i-1] = get(temp,i);
				}
			}
			return arr;
		}
//		remove(e)
		public static Board[] remove(Board[] arr, Board e) {
			return remove(arr,indexOf(arr,e));
			
		}


}





























