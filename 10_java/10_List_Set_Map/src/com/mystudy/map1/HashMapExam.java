package com.mystudy.map1;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

public class HashMapExam {

	public static void main(String[] args) {
		//Map<K, V> 인터페이스 : 키(key)-값(Value) 쌍으로 데이터 저장관리 
		//-순서가 없다 
		//-키(Key) : 중복안됨(중복값 없이 유일한 데이터)
		//-값(Value) : 중복데이터 저장가능 
		//=====================================================
		HashMap<String, Integer> map = new HashMap<>();
		map.put("홍길동",100);
		map.put("김유신",new Integer(95));
		map.put("강감찬",88);
		System.out.println(map.put("계백",88));
		System.out.println(map.put("홍길동",93));
		//동일한 Key가 있으면 수정(update)처리된다. 없으면 insert
		
		System.out.println(map);
		//데이터 입력 put
		HashMap<String,Integer> map2 = new HashMap<>();
		map2.put("일지매", 92);
		map2.put("전우치", 82);
		System.out.println(map2);
		
		//데이터 삭제 remove(Key)
		map2.remove("일지매");
		map2.remove("전우치");
		System.out.println(map2);
		
		//is.Empty()
		System.out.println("map.isEmpty() :" + map.isEmpty());
		System.out.println("map.isEmpty() :" + map2.isEmpty());
		
		//get(Key) Value를 리턴
		System.out.println(map.get("홍길동"));

		//containsKey()
		System.out.println("map.containsKey(\"을지문덕\") : " +map.containsKey("을지문덕"));
		
		//containsValue()
		System.out.println("map.cintainsKey(88) : "+map.containsValue(88));
		
		//데이터 수정 replace()
		System.out.println("------------------------------------");
		System.out.println("map : "+map);
		System.out.println("map.replace(\"홍길동\",99) : "+ map.replace("홍길동", 99));
		System.out.println("map.replace(\"을지문덕\",99) : "+ map.replace("을지문덕", 99));
		
		System.out.println("map : "+map);
		
		//==============================================
		System.out.println("===========Map 전체데이터 조회=============");
		//Map<K,V>에서는 key를 이용해서 value 조회
		System.out.println("---키(key)추출 :KeySet() 사용---");
		Set<String> keySet = map.keySet();
		System.out.println("keySet : "+ keySet);
		
		System.out.println("----Iterator사용해서 값 조회");

		Iterator<String>ite = keySet.iterator();
		while(ite.hasNext()) {
			String key = ite.next();
			Integer value = map.get(key);
			System.out.println("key :"+key+ ", value : "+value);

		}
		//개선된 for문 형태 ---------------------------------
		System.out.println("----for문으로 값 조회----");

		for(String key : keySet) {
			Integer value = map.get(key);
			System.out.println("key :"+key+ ", value : "+value);

			
		}
		//-----------------------------------------------
		System.out.println("----값(value) 추출 : values()사용----");
		Collection<Integer> values = map.values();
		System.out.println("값(values) : "+ values);
		
		//값들을 합계 구하기 
		 Iterator<Integer> iteValues = values.iterator();
		 int sum = 0;
		 while(iteValues.hasNext()) {
			 Integer value = iteValues.next();
			 sum += value;
			 System.out.println("점수 :"+ value);

		 }
		 System.out.println("합계 :"+ sum);
		 
		 System.out.println("===========Map 데이터 전체 조회==========");
		 System.out.println("-----entrySet() 사용 -----");
		 //Entry : Map내부에 선언된 인터페이스 - Map.Entry
		 Set<Entry<String,Integer>>entrySet = map.entrySet();
		 System.out.println("entrySet : "+ entrySet);
		 
		 Iterator<Entry<String, Integer>>entryIte = entrySet.iterator();
		 while(entryIte.hasNext()) {
			 Entry<String,Integer> entry  = entryIte.next();
			 System.out.println("key: "+ entry.getKey()+", value"
					 		+entry.getValue());

		 }











		





	}

}






















