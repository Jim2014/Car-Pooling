package mum.cs472.dao;

import java.util.List;

import mum.cs472.model.Comment;

public interface CommentDao {

	void addComment(Comment comment);

	boolean updateComment(Comment comment);

	List<Comment> getAllComments();

	String getUsernameByCommentId(int commentId);

	List<Comment> getAllComments(int postId, int userId);
}
