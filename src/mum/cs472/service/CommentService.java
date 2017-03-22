package mum.cs472.service;

import java.util.List;

import mum.cs472.model.Comment;

public interface CommentService {


	void addComment(Comment comment);

	boolean updateComment(Comment comment);

	List<Comment> getAllComments();

	String getUsernameByCommentId(int CommentId);

	List<Comment> getAllComments(int postId, int userId);

	
}
