package mum.cs472.service;

import java.util.List;

import mum.cs472.dao.CommentDao;
import mum.cs472.dao.CommentDaoImplementation;
import mum.cs472.model.Comment;

public class CommentServiceImplementation implements CommentService{

	CommentDao commentDao;
	public CommentServiceImplementation() {
		commentDao = new CommentDaoImplementation();
	}
	
	@Override
	public void addComment(Comment comment) {
		commentDao.addComment(comment);
	}
	@Override
	public boolean updateComment(Comment comment) {
	
		return commentDao.updateComment(comment);
	}
	@Override
	public List<Comment> getAllComments() {
		return commentDao.getAllComments();
	}
	@Override
	public String getUsernameByCommentId(int CommentId) {
		return commentDao.getUsernameByCommentId(CommentId);
	}

	@Override
	public List<Comment> getAllComments(int postId, int userId) {
		
		return commentDao.getAllComments(postId, userId);
	}
}
