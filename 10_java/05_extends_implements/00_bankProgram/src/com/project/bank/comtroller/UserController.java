package com.project.bank.comtroller;
import java.util.ArrayList;

import com.project.bank.dao.UserDAO;
import com.project.bank.vo.UsersVO;


public class UserController {
	private ArrayList<UsersVO> list;
	private UserDAO userdao;
	private UsersVO uvo;
	private int nextNo;
	
	public UserController() {
        list = new ArrayList<>();
//        uvo = new UserVO();
        userdao = new UserDAO();
        nextNo = 1;
        
    }
	
	public void insert(UsersVO uvo) {
		
        uvo.setUserNo(nextNo++);
       
        list.add(uvo);
        
        userdao.insertUser(uvo);
    }
	
	public boolean validateUsername(String userId) {
        if (userId.equalsIgnoreCase("x")) {
            return true;
        }

        for (UsersVO uvo : list) {
            if (uvo.getUserId().equalsIgnoreCase(userId)) {
                return true;
            }
        }

        return false;
    }
}
