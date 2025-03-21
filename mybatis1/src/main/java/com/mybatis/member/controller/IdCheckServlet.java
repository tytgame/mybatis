package com.mybatis.member.controller;

import java.io.IOException;

import com.mybatis.member.service.MemberServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class IdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("checkId");
		int result = new MemberServiceImpl().checkID(userId);
		if(result > 0) {
			response.getWriter().print("idN");
		}
	}
}