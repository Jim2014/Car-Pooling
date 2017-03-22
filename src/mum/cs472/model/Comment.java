package mum.cs472.model;

import java.util.Date;

public class Comment {
	private int commentId;
	private int userId;
	private int postId;
	private String comment;
	private Date dateCreated;
	private Date dateUpdated;
	private String username;
	public Comment() {
	}

	
	public Comment(String comment, Date dateCreated, Date dateUpdated) {
		this.comment = comment;
		this.dateCreated = dateCreated;
		this.dateUpdated = dateUpdated;
	}


	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public Date getDateUpdated() {
		return dateUpdated;
	}

	public void setDateUpdated(Date dateUpdated) {
		this.dateUpdated = dateUpdated;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUsername() {
		return username;
	}

	@Override
	public String toString() {
		return "Comment [commentId=" + commentId + ", userId=" + userId + ", postId=" + postId + ", comment=" + comment
				+ ", dateCreated=" + dateCreated + ", dateUpdated=" + dateUpdated + username+"]";
	}
	
	
	
}

