package mum.cs472.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.google.gson.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mum.cs472.model.Comment;
import mum.cs472.service.CommentService;
import mum.cs472.service.CommentServiceImplementation;

@WebServlet("/comment")
public class CommentServlet extends HttpServlet {

	/**
	* 
	*/
	private CommentService commentService;
	public CommentServlet() {
		commentService = new CommentServiceImplementation();
	}
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		int loggedInUserId = Integer.parseInt(request.getParameter("loggedInUserId"));
		int postId = Integer.parseInt(request.getParameter("postId"));
		int userId = Integer.parseInt(request.getParameter("userId"));
		
		List<Comment> commentLists = commentService.getAllComments(postId, userId);
		
		response.setContentType("text/html");
	    PrintWriter out = response.getWriter();
	    
		StringBuilder sb = new StringBuilder();
		sb.append("<ul>");
		int count = 0;
		for(Comment comment : commentLists) {
			System.out.println("----------");
			sb.append("<li><b>"+comment.getUsername()+"</b> <i> commented as </i> :"+comment.getComment()+"</li>");
			count++;
		}
//		Comment c = commentLists.get(0);
//		System.out.println(JSON.toJSONString(c));
		sb.append("</ul>");
		response.getWriter().write(sb.toString());
//		response.getWriter().write(JSON.toJSONString(c));

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int loggedInUserId = Integer.parseInt(request.getParameter("loggedInUserId"));
		Comment comment = new Comment();
		int postId = Integer.parseInt(request.getParameter("postId"));
		comment.setUserId(loggedInUserId);
		comment.setPostId(postId);
		comment.setComment(request.getParameter("comment"));

		String commentId = (String) request.getParameter("commentId");

		if (commentId == null || commentId.isEmpty()) {
			commentService.addComment(comment);
		}
		response.setContentType("text/plain");
		response.getWriter().write(request.getParameter("comment"));
	}

}

