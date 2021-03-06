package mum.cs472.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mum.cs472.dao.UserDao;
import mum.cs472.dao.UserDaoImplementation;
import mum.cs472.model.User;
import mum.cs472.service.UserService;

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {
	
	public UpdateProfileServlet(UserService userService) {
		super();
		this.userService = userService;
	}

	UserDaoImplementation userdao=new UserDaoImplementation();

	private static final long serialVersionUID = 1L;
	
	private UserService userService;
	public UpdateProfileServlet(){
		
	}
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int loggedInUserId =  Integer.parseInt(request.getParameter("id"));
		System.out.println(loggedInUserId);
		
		User user=userdao.getUserById(loggedInUserId);
	
		request.setAttribute("user", user);
		System.out.println(user);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/UpdateProfile.jsp");
		dispatcher.forward(request, response);
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = new User();
		user.setFullname(request.getParameter("fullname"));
		user.setEmail(request.getParameter("email"));
		user.setPassword(request.getParameter("password"));
		user.setGender(Integer.parseInt(request.getParameter("gender")));
		user.setState(request.getParameter("state"));
		user.setZipcode(Integer.parseInt(request.getParameter("zipcode")));
		user.setStreet(request.getParameter("street"));
		user.setCity(request.getParameter("city"));
		user.setBirthyear(Integer.parseInt(request.getParameter("birthyear")));

		String userId = request.getParameter("userId");

		if (userId == null || userId.isEmpty()) {
			userService.addUser(user);
			RequestDispatcher dispatcher = request.getRequestDispatcher("profile");
			session.setAttribute("email", request.getParameter("email"));
			dispatcher.include(request, response);
		} else {
			user.setUserId(Integer.parseInt(userId));
			userService.updateUser(user);
			RequestDispatcher dispatcher = request.getRequestDispatcher("profile");
			session.setAttribute("email", request.getParameter("email"));
			dispatcher.include(request, response);
		}

	}
	

}
