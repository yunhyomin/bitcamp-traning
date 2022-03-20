package controller;
//사용자 기능을 MVC패턴으로 구현하시오
//사용자는 사용자 번호, 사용자 username, 사용자 비밀번호, 사용자 닉네임까지 
//4가지 정보를 가지고 있습니다
//사용자는 회원가입, 로그인,로그아웃,회원정보수정,회원탈퇴의 기능을 실행할 수 있습니다.

import java.util.ArrayList;
import model.UserDTO;

public class UserController {
    private ArrayList<UserDTO> list;
    private int nextId;
    
    //생성자
    public UserController() {
        list = new ArrayList<>();
        
        nextId = 1;
        
        for(int i=1; i<=3; i++) {
            UserDTO u = new UserDTO();
//         1. u.setId(nextId++);
            u.setUsername("u"+i);
            u.setPassword("1");
            u.setNickname("유저"+i);
//         2.  list.add(u);
            insert(u);//1과 2를 메소드화시켜서 한줄로 만듦
        }
    }
    //insert
    public void insert(UserDTO u) {
        u.setId(nextId++);
        
        list.add(u);
    }
    public ArrayList<UserDTO> selectAll(){
        return list;
    }
    
    public UserDTO selectOne(int id) {
        UserDTO u = new UserDTO();
        u.setId(id);
        if(list.contains(u)) {
            int index = list.indexOf(u);
            return list.get(index);
        }
        
        return null;
    }
    //같은 아이디가 존재하면 true 아니면 false 검사 
    public boolean validateUsername(String username) {
        if(username.equalsIgnoreCase("X")) {
            return true;
        }
        for(UserDTO u : list) {
            if(u.getUsername().equalsIgnoreCase(username)) {
                return true;
            }
        }
        
        return false;
    }
    
    public UserDTO logIn(String username, String password) {
        for(UserDTO u :list) {
            if(u.getUsername().equalsIgnoreCase(username) &&
                            u.getPassword().equals(password)){
                return u;
            }
        }
        
        return null;
    }
    
    public void update(UserDTO u) {
        UserDTO origin = selectOne(u.getId());
         u.setUsername(origin.getUsername());
         int index = list.indexOf(u);
         list.set(index, u);
    }
    
    public void delete(int id) {
        UserDTO u = new UserDTO();
        u.setId(id);
        list.remove(u);
    }
}

























































