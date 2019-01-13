package si.um.feri.praktikum;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDao {

	private Connection getConnection() {
		try {
			DataSource ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/praktikum");
			return ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<User> selectUser() throws Exception {
		List<User> ret=new ArrayList<User>();
		Connection conn=getConnection();
		try {
			
			ResultSet rs=conn.createStatement().executeQuery("select * from users");
			while (rs.next()) {
				User o=new User(rs.getInt("users_id"),rs.getString("first_name"),rs.getString("last_name"),rs.getString("email"),rs.getString("pass"));
				
				
				ret.add(o);
			}
			rs.close();
			
		} finally {
			conn.close();
		}
		return ret;
	}
	
	
	
	public User selectUser(int users_id) throws Exception {
		User ret=null;
		Connection conn=getConnection();
		try {
			
			PreparedStatement ps=conn.prepareStatement("select * from users where users_id=?");
			ps.setInt(1, users_id);
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				ret=new User(rs.getInt("users_id"),rs.getString("first_name"),rs.getString("last_name"),rs.getString("email"),rs.getString("pass"));
				break;
			}
			rs.close();
			
		} finally {
			conn.close();
		}
		return ret;
	}
	
	public void deleteUser(int id) throws Exception {
		Connection conn=getConnection();
		try {

			PreparedStatement ps=conn.prepareStatement("delete from users where users_id=?");
			ps.setInt(1, id);
			ps.executeUpdate();

		} finally {
			conn.close();
		}
	}
	
	public void insertUser(User o) throws Exception {
		Connection conn=getConnection();
		try {

			PreparedStatement ps=conn.prepareStatement("insert into users(users_id , first_name , last_name , email, pass) values (?,?,?,?,?)");
			ps.setInt(1, o.getUserID());
			ps.setString(2, o.getFirst_name());
			ps.setString(3, o.getLast_name());
			ps.setString(4, o.getEmail());
			ps.setString(5, o.getPass());
			
			
			ps.executeUpdate();

		} finally {
			if(conn!=null)
			conn.close();
		}
	}
	public static String generateHash(String input) {
		StringBuilder hash = new StringBuilder();

		try {
			MessageDigest sha = MessageDigest.getInstance("SHA-1");
			byte[] hashedBytes = sha.digest(input.getBytes());
			char[] digits = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
					'a', 'b', 'c', 'd', 'e', 'f' };
			for (int idx = 0; idx < hashedBytes.length; ++idx) {
				byte b = hashedBytes[idx];
				hash.append(digits[(b & 0xf0) >> 4]);
				hash.append(digits[b & 0x0f]);
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return hash.toString();
	}
}