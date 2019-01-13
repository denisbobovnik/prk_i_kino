package si.um.feri.praktikum;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CommentDao {

	private Connection getConnection() {
		try {
			DataSource ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/praktikum");
			return ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Comment> selectComment() throws Exception {
		List<Comment> ret=new ArrayList<Comment>();
		Connection conn=getConnection();
		try {
			
			ResultSet rs=conn.createStatement().executeQuery("select * from comments");
			while (rs.next()) {
				Comment c=new Comment(rs.getInt("comments_id"),rs.getString("content"),rs.getInt("movies_movie_id"),rs.getInt("users_user_id"));
				
				
				ret.add(c);
			}
			rs.close();
			
		} finally {
			conn.close();
		}
		return ret;
	}
	
	
	
	public Comment selectComment(int comment_id) throws Exception {
		Comment ret=null;
		Connection conn=getConnection();
		try {
			
			PreparedStatement ps=conn.prepareStatement("select * from comments where comments_id=?");
			ps.setInt(1, comment_id);
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				ret=new Comment(rs.getInt("comments_id"),rs.getString("content"),rs.getInt("movies_movie_id"),rs.getInt("users_user_id"));
				break;
			}
			rs.close();
			
		} finally {
			conn.close();
		}
		return ret;
	}
	
	public void deleteComment(int id) throws Exception {
		Connection conn=getConnection();
		try {

			PreparedStatement ps=conn.prepareStatement("delete from comments where comments_id=?");
			ps.setInt(1, id);
			ps.executeUpdate();

		} finally {
			conn.close();
		}
	}
	
	public void insertComment(Comment c) throws Exception {
		Connection conn=getConnection();
		try {

			PreparedStatement ps=conn.prepareStatement("insert into comments(comments_id , content , movies_movie_id , users_user_id) values (?,?,?,?)");
			ps.setInt(1, c.getCommentID());
			ps.setString(2, c.getContent());
			ps.setInt(3, c.getMoviesID());
			ps.setInt(4, c.getUsersID());
			
			
			
			ps.executeUpdate();

		} finally {
			if(conn!=null)
			conn.close();
		}
	}
	
	
}

