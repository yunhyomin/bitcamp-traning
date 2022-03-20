package com.spring.biz.view.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.user.UserVO;
import com.spring.biz.user.impl.UserDAO;

@Controller
public class UserController {

	@RequestMapping("/login.do")
	public String login(UserVO vo, UserDAO userDAO) {
		System.out.println(">>> 로그인 처리");
		System.out.println("vo : " + vo);

		UserVO user = userDAO.getUser(vo);
		System.out.println("user : " + user);
		
		if (user != null) {
			System.out.println(">> 로그인성공!!!");
			return "getBoardList.do";
		} else {
			System.out.println(">> 로그인실패~~");
			return "login.jsp";
		}	
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		System.out.println(">>> 로그아웃 처리");
		session.invalidate();
		return "login.jsp";
	}

}
