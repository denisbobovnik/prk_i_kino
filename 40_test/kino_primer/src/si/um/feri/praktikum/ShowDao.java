package si.um.feri.praktikum;



import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ShowDao {

	
	private Connection getConnection() {
		try {
			DataSource ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/praktikum");
			return ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Show> selectShow() throws Exception {
		List<Show> ret=new ArrayList<Show>();
		Connection conn=getConnection();
		try {
			
			ResultSet rs=conn.createStatement().executeQuery("select * from shows");
			while (rs.next()) {
				Show s=new Show(rs.getInt("shows_id"),rs.getString("show_id"),rs.getDate("date_time"),rs.getTime("date_time"),rs.getString("city"),rs.getString("center"),rs.getString("theater"),rs.getInt("movies_movie_id"));
				
				
				ret.add(s);
			}
			rs.close();
			
		} finally {
			conn.close();
		}
		return ret;
	}
	
	public Show selectShow(int id) throws Exception {
		Show ret=null;
		Connection conn=getConnection();
		try {
			
			PreparedStatement ps=conn.prepareStatement("select * from shows where id=?");
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				ret=new Show(rs.getInt("shows_id"),rs.getString("show_id"),rs.getDate("date_time"),rs.getTime("date_time"),rs.getString("city"),rs.getString("center"),rs.getString("theater"),rs.getInt("movies_movie_id"));
				break;
			}
			rs.close();
			
		} finally {
			conn.close();
		}
		return ret;
	}
	
	public void deleteShow(int id) throws Exception {
		Connection conn=getConnection();
		try {

			PreparedStatement ps=conn.prepareStatement("delete from shows where shows_id=?");
			ps.setInt(1, id);
			ps.executeUpdate();

		} finally {
			conn.close();
		}
	}
	
	public Show selectShow2(int id) throws Exception {
		Show ret=null;
		Connection conn=getConnection();
		try {
			
			PreparedStatement ps=conn.prepareStatement("select * from shows where shows_id=?");
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				ret=new Show(rs.getInt("shows_id"),rs.getString("show_id"),rs.getDate("date_time"),rs.getTime("date_time"),rs.getString("city"),rs.getString("center"),rs.getString("theater"),rs.getInt("movies_movie_id"));
				break;
			}
			rs.close();
			
		} finally {
			conn.close();
		}
		return ret;
	}
	
	public void insertShow(Show s) throws Exception {
		Connection conn=getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("insert into shows(shows_id, show_id, date_time, city, center, theater, movies_movie_id) values (?,?,?,?,?,?,?)");
			ps.setInt(1, s.getShowID());
			ps.setString(2, s.getShowsID());
			ps.setDate(3, new java.sql.Date(s.getDate().getTime()));
			ps.setString(4, s.getCity());
			ps.setString(5, s.getCenter());
			ps.setString(6, s.getTheater());
			ps.setInt(7, s.getMovieID());
			ps.executeUpdate();
		} finally {
			if(conn!=null)
			conn.close();
		}
	}
	
	public void insertShow2(Show s) throws Exception {
		Connection conn=getConnection();
		try {
			Statement st = conn.createStatement();
			ResultSet obstojecePredstave = st.executeQuery("select show_id from shows");
			int flag = 0;
			while (obstojecePredstave.next())
				if (obstojecePredstave.getString(1).compareTo(s.getShowsID()) == 0)
					flag++;
			
			if(flag == 0) {
				PreparedStatement ps=conn.prepareStatement("INSERT INTO shows(shows_id, show_id, date_time, city, center, theater, movies_movie_id) VALUES (?,?,?,?,?,?,?)");
				ps.setInt(1, s.getShowID());
				ps.setString(2, s.getShowsID());
				ps.setTimestamp(3, s.getTimestamp());
				ps.setString(4, s.getCity());
				ps.setString(5, s.getCenter());
				ps.setString(6, s.getTheater());
				ps.setInt(7, s.getMovieID());
				ps.executeUpdate();
			}
			else {
				System.out.println("Predstava že obstaja! Posodabljam predstavo (za vsak slučaj).");
				posodobiObstojecoPredstavo(s);
			}
		} finally {
			if(conn!=null)
			conn.close();
		}
	}
	public void posodobiObstojecoPredstavo(Show s) throws Exception {
		Connection conn=getConnection();		
		try {
			PreparedStatement ps=conn.prepareStatement("UPDATE shows SET date_time=?, city=?, center=?, theater=? WHERE shows_id = ?");
			ps.setTimestamp(1, s.getTimestamp());
			ps.setString(2, s.getCity());
			ps.setString(3, s.getCenter());
			ps.setString(4, s.getTheater());
			ps.setInt(5, s.getShowID());
			ps.executeUpdate();

		} finally {
			if(conn!=null)
			conn.close();
		}
	}
	public ArrayList<Show> predstavePoIDjuFilma(int bazniIDfilma) throws Exception {
		ArrayList<Show> predstave = new ArrayList<Show>();
		Connection conn=getConnection();
		try {
			PreparedStatement predstaveFilmaStavek = conn.prepareStatement("select shows_id from shows where movies_movie_id = ?");
			predstaveFilmaStavek.setInt(1, bazniIDfilma);
			
			ResultSet predstaveFilma = predstaveFilmaStavek.executeQuery();
			while (predstaveFilma.next()) {
				predstave.add(selectShow2(predstaveFilma.getInt(1)));
			}
			predstaveFilma.close();
			
		} finally {
			conn.close();
		}
		return predstave;
	}
}