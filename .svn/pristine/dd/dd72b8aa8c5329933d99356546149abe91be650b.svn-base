package si.um.feri.praktikum;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.naming.InitialContext;
import javax.servlet.http.Cookie;
import javax.sql.DataSource;
public class GlasovanjeDao  {

	private Connection getConnection() {
		try {
			DataSource ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/praktikum");
			return ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public  List<Glasovanje> dobiImena() throws Exception {
		List<Glasovanje> ret=new ArrayList<Glasovanje>();
		Connection conn=getConnection();
		try {
			
			ResultSet rs=conn.createStatement().executeQuery("select glasovanje_ID, Film  from glasovanje");
			while (rs.next()) {
				Glasovanje o=new Glasovanje(rs.getInt("glasovanje_ID"),rs.getString("Film"));
				ret.add(o);
			}
			rs.close();
			
		} finally {
			conn.close();
		}
		return ret;
	}
	
	public Glasovanje dobiImena(int id) throws Exception {
		Glasovanje ret=null;
		Connection conn=getConnection();
		try {
			
			PreparedStatement ps=conn.prepareStatement("select Film, glasovanje_ID from glasovanje where id=?");
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				ret=new Glasovanje(rs.getInt("glasovanje_ID)"),rs.getString("Film"));
				break;
			}
			rs.close();
			
		} finally {
			conn.close();
		}
		return ret;
	}


		
	
}



