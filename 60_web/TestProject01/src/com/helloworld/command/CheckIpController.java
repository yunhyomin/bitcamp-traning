package com.helloworld.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helloworld.dao.TodayDAO;


@WebServlet("/chIp")
public class CheckIpController extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String ip = req.getParameter("ip");
		String u_idx ="25";
		
		System.out.println("checkIpController ip : "+ip);
		
		Map<String, String> map = new HashMap<>();
		
		map.put("ip", ip);
		map.put("u_idx", u_idx);
		
		int result = TodayDAO.chIp(map);
		
		req.setAttribute("result", result);
		
		req.getRequestDispatcher("homepage.jsp").forward(req,resp);
	}
}
