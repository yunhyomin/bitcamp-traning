package com.helloworld.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helloworld.dao.MemberDAO;
import com.helloworld.vo.MemberVO;

public class LogInCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		MemberVO vo = null;
		
		int result = MemberDAO.getIdPw(id, pw);
		
		if (result == 1) {
			vo = MemberDAO.selectOne(id);
		} else if (result == 0) {
			System.out.println("해당 아이디가 존재하지 않습니다.");
		}
		System.out.println("vo : " + vo);
		request.setAttribute("host", vo);
		
		return "homepage.jsp";
	}

}
