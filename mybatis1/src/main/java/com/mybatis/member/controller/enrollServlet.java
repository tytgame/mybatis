package com.mybatis.member.controller;

import java.io.IOException;

import com.mybatis.member.service.MemberServiceImpl;
import com.mybatis.member.vo.Member;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class enrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public enrollServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
//		회원가입 버튼 눌렀을 때 요청받는 서블릿 페이지임 (map:insert.me)
		
//		입력받은 값을 데이터베이스에 집어넣기
		
		request.setCharacterEncoding("utf-8");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String birthday = request.getParameter("birthday");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		
		Member member = new Member(userId, userPwd, name, email, birthday, gender, phone, address, "", "", "");
		
		int result = new MemberServiceImpl().insertMember(member);
		
		if(result>0) {
			// 성공하면 메인페이지로 이동
//			response.sendRedirect(request.getContextPath());
			request.getRequestDispatcher("WEB-INF/views/common/successEnroll.jsp").forward(request, response);
		} else {
			// 실패하면 에러페이지
			request.setAttribute("errorMsg", "회원가입 실패");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
		}
	}
}
//request.getRequestDispatcher("WEB-INF/views/common/successEnroll.jsp").forward(request, response);
