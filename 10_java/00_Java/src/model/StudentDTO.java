package model;
//모델(Model)
//모델의 경우 데이터베이스로부터 받아올 값을 자바객체의 모양으로 덮어씌울 틀의 역할을 맡는다.
//즉, 틀의 역할만 맡으면 되기 떄문에 
//모델안에는 필드, 겟터/셋터, 그리고 java.long.Object클래스의 메소드 중 
//오버라이드 할 메소드만 들어간다.

//모델의 경우 주로 DTO혹은 VO라는 접미사가 붙는데 
//DTO는 Data Transfer Object의 줄임말로써 사용자가 데이터를 받거나 보내거나 
//둘 다 해야하는 경우에 주로 붙는다.
//VO는 Value Object의 줄임말로써 사용자가 데이터를 받기만 하는 경우에 주로 붙는다.
//다만 2개의 구분은 엄격하지 않기때문에 
//주로 DTO를 쓰면 된다.

public class StudentDTO {
    //필드
    private int id;
    private String name;
    private int korean;
    private int english;
    private int math;
    
    //getter/setter
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
    
    //override
    public boolean equals(Object o) {
        if(o instanceof StudentDTO) {
            StudentDTO studentDTO = (StudentDTO)o;
            if(id == studentDTO.id) {
                return true;
            }
        }
        return false;
    }
    
    //toString()
    public String toString() {
        return "[id: " +id+", name: "+name+", korean:"+korean+", english:"+english+",math:"+math+"]";
    }
}






































