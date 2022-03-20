package controller;
//원래대로라면 컴트롤러클래스의 경우,
//데이터베이스와 통신하는 코드 등의 데이터를 CRUD하는 메소드들이 적히게 된다.
//CRUD란 Create,Retrieve,Update,Delete를 줄인말로써,
//데이터베이스의 가장 기본적인 데이터를 "생성" "회수" "수정" "삭제"
//하는 기능을 말한다.

//하지만 우리는 데이터베이스가 없기때문에 이 컨트롤러 안에 데이터베이스의 역할을 잠시 해줄
//ArrayList 필드를 하나 만들어 줘야 한다.

import java.util.ArrayList;

import model.StudentDTO;
public class StudentController {
    //다음 추가될 학생의 번호를 저장할 내부필드
    private int nextId;
    
    private ArrayList<StudentDTO> list;
    
    //StudentController의 파라미터 없는 생성자
    //현재 list를 초기화 하고, StudentDTO객체를 몇개 만들어서 list에 추가한다.
    public StudentController() {
        list= new ArrayList<>();
        
        nextId = 1;
        
        for(int i=1; i<4; i++) {
            StudentDTO s= new StudentDTO();
            //생성자
//            s.setId(nextId++);
            s.setName("학생"+i);
            s.setKorean(i*9);
            s.setEnglish(i*8);
            s.setMath(i*7);
            
//            list.add(s);
            insert(s);
        }
    }
    
    //파라미터로 넘어온 StudentDTO 객체를 list에 추가하는 
    //insert()메소드
    public void insert(StudentDTO s) {
        s.setId(nextId++);
        list.add(s);
    }
    
    //파라미터로 넘어온 id 값과 일치하는 
    //StudentDTO객체를 리턴해주는 
    //selectOne()메소드
    public StudentDTO selectOne(int id) {
        for(StudentDTO s: list) {
            if(id == s.getId()) {
                return s;
            }
        }
        return null;
    }
    
    //현재 list의 모든 객체를 list로 리턴해주는 
    //selectAll()메소드
    public ArrayList<StudentDTO> selectAll(){
        
        return list;
    }
    
    //파라미터로 넘어온 StudentDTO객체를 
    //list에 수정하는 upDate()메소드
    public void upDate(StudentDTO s) {
        int index = list.indexOf(s);
        list.set(index, s);
        
    }
    
    //파라미터로 넘어온 id값과 일치하는
    //StudentDTO객체를 list에서 삭제하는 
    //delete() 메소드
    public void delete(int id) {
        StudentDTO s= selectOne(id);
        if(s!=null) {
            list.remove(s);
        }
    }
}
































