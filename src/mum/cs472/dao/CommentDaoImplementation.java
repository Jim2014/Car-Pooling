package mum.cs472.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;

import mum.cs472.model.Comment;
import mum.cs472.model.Like;
import mum.cs472.util.DBUtil;

public class CommentDaoImplementation implements CommentDao {

	private Connection conn;
	private PreparedStatement preparedStatement;

	public CommentDaoImplementation() {
		conn = DBUtil.getConnection();
	}


	@Override
	public void addComment(Comment Comment) {
	
		try {
			String insertQuery = "INSERT INTO comments (userid, postid,comment, datecreated,dateupdated)"
					+ "VALUES (?,?,?,?,?)";
			preparedStatement = (PreparedStatement) conn.prepareStatement(insertQuery);

			preparedStatement.setInt(1, Comment.getUserId());
			preparedStatement.setInt(2, Comment.getPostId());
			preparedStatement.setString(3, Comment.getComment());
			preparedStatement.setDate(4, (Date)Comment.getDateCreated());
			preparedStatement.setDate(5, (Date)Comment.getDateUpdated());
			
			preparedStatement.executeUpdate();
			
			preparedStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	@Override
	public boolean updateComment(Comment comment) {
		
		return false;
	}


	@Override
	public List<Comment> getAllComments() {
		List<Comment> Comments = new ArrayList<Comment>();
        try {
        	String Query = "SELECT Comments.*,users.fullname FROM Comments RIGHT JOIN users ON Comments.userid = users.userid ORDER BY Comments.dateupdated desc;";
        	preparedStatement = (PreparedStatement) conn.prepareStatement(Query);
        	ResultSet resultSet = preparedStatement.executeQuery();
        	
            while (resultSet.next()) {
                Comment Comment = new Comment();
                Comment.setCommentId(resultSet.getInt("Commentid"));
                Comment.setUserId(resultSet.getInt("userid"));
                Comment.setCommentId(resultSet.getInt("commentid"));
                Comment.setComment(resultSet.getString("comment"));
     
                Comment.setDateCreated(resultSet.getDate("datecreated"));
                Comment.setDateUpdated(resultSet.getDate("dateupdated"));
                Comment.setUsername(resultSet.getString("fullname"));
          
                Comments.add(Comment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return Comments;
	}


	@Override
	public String getUsernameByCommentId(int commentId) {
		String username = "Not found for---"+commentId;
		int userId = 0;
		 try {
	        	String Query = "select * from  Comments where Commentid = ?";
	        	preparedStatement = (PreparedStatement) conn.prepareStatement(Query);
	        	preparedStatement.setInt(1, commentId);
	        	
	        	ResultSet resultSet = preparedStatement.executeQuery();
	        	 while (resultSet.next()) {
	        		 userId = resultSet.getInt("userid");
	        	 }
	        	 String Query2 = "select * from  user where userid = ?";
		        	preparedStatement = (PreparedStatement) conn.prepareStatement(Query2);
		        	preparedStatement.setInt(1, userId);
		        	ResultSet resultSet2 = preparedStatement.executeQuery();
		        	 while (resultSet2.next()) {
		        		 username = resultSet.getString("fullname");
		        	 }
		        	
		 }catch (SQLException e) {
	            e.printStackTrace();
	        }
		return username;
	}


	@Override
	public List<Comment> getAllComments(int postId, int userId) {
		List<Comment> commentList = new ArrayList<>(); 
		try {
			String query = "SELECT comments.*,users.fullname FROM comments JOIN users ON comments.userid = ? AND comments.postid = ? ORDER BY comments.dateupdated desc;";
			preparedStatement = (PreparedStatement) conn.prepareStatement(query);
			preparedStatement.setInt(1, userId);
			preparedStatement.setInt(2, postId);
			
			ResultSet resultSet = preparedStatement.executeQuery();
        	
            while (resultSet.next()) {
               Comment comment = new Comment();
               	comment.setUserId(resultSet.getInt("userid"));
               	comment.setPostId(resultSet.getInt("postid"));
                comment.setCommentId(resultSet.getInt("commentid"));
				comment.setComment(resultSet.getString("comment"));
                comment.setUsername(resultSet.getString("fullname"));
                commentList.add(comment);
            }
			preparedStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return commentList;
	}

}
