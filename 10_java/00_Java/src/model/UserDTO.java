package model;
//사용자 기능을 MVC패턴으로 구현하시오
//사용자는 사용자 번호, 사용자 username, 사용자 비밀번호, 사용자 닉네임까지 
//4가지 정보를 가지고 있습니다
//사용자는 회원가입, 로그인,로그아웃,회원정보수정,회원탈퇴의 기능을 실행할 수 있습니다.

public class UserDTO {
    //필드
    // 사용자 번호 
     private int id;
    //사용자 username
     private String username;
    //사용자비밀번호 
     private String password;
    //사용자 닉네임
     private String nickname;
    
     // getter setter
     public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getNickname() {
        return nickname;
    }
    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
    //override
    public boolean equals(Object o) {
        if(o instanceof UserDTO) {
            UserDTO u = (UserDTO)o;
            if(u.id == id) {
                return true;
            }
        }
        return false;
    }
    
}


















