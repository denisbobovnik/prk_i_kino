
package si.um.feri.praktikum;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MovieDao {

	
	private Connection getConnection() {
		try {
			DataSource ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/praktikum");
			return ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Movie> selectMovie() throws Exception {
		List<Movie> ret=new ArrayList<Movie>();
		Connection conn=getConnection();
		try {
			
			ResultSet rs=conn.createStatement().executeQuery("select * from movies");
			while (rs.next()) {
				Movie o=new Movie(rs.getInt("movies_id"),rs.getString("movie_id"),rs.getString("title"),rs.getString("original_title"),rs.getString("punchline"),rs.getString("trailer"), rs.getString("genre"),rs.getInt("year"),rs.getInt("duration"),rs.getString("url"),rs.getString("poster"),rs.getString("director"),rs.getString("producer"),rs.getString("writer"),rs.getString("cast"), rs.getString("distributor"),rs.getString("language"),rs.getString("country"),rs.getString("localization"),rs.getString("plot_outline"),rs.getDouble("sum_of_scores"),rs.getDouble("num_of_scores"),rs.getBoolean("na_voljo"));
				
				
				ret.add(o);
			}
			rs.close();
			
		} finally {
			conn.close();
		}
		return ret;
	}
	
	public List<Movie> select2Movie() throws Exception {
		List<Movie> ret=new ArrayList<Movie>();
		Connection conn=getConnection();
		try {
			
			ResultSet rs=conn.createStatement().executeQuery("select distinct * from movies");
			while (rs.next()) {
				Movie o=new Movie(rs.getInt("movies_id"),rs.getString("movie_id"),rs.getString("title"),rs.getString("original_title"),rs.getString("punchline"),rs.getString("trailer"),rs.getString("genre"),rs.getInt("year"),rs.getInt("duration"),rs.getString("url"),rs.getString("poster"),rs.getString("director"),rs.getString("producer"),rs.getString("writer"),rs.getString("cast"), rs.getString("distributor"),rs.getString("language"),rs.getString("country"),rs.getString("localization"),rs.getString("plot_outline"),rs.getDouble("sum_of_scores"),rs.getDouble("num_of_scores"),rs.getBoolean("na_voljo"));
				
				
				ret.add(o);
			}
			rs.close();
			
		} finally {
			conn.close();
		}
		return ret;
	}
	
	public Movie selectMovie(int movies_id) throws Exception {
		Movie ret=null;
		Connection conn=getConnection();
		try {
			
			PreparedStatement ps=conn.prepareStatement("select * from movies where movies_id=?");
			ps.setInt(1, movies_id);
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				ret=new Movie(rs.getInt("movies_id"),rs.getString("movie_id"),rs.getString("title"),rs.getString("original_title"),rs.getString("punchline"),rs.getString("trailer"), rs.getString("genre"),rs.getInt("year"),rs.getInt("duration"),rs.getString("url"),rs.getString("poster"),rs.getString("director"),rs.getString("producer"),rs.getString("writer"),rs.getString("cast"), rs.getString("distributor"),rs.getString("language"),rs.getString("country"),rs.getString("localization"),rs.getString("plot_outline"),rs.getDouble("sum_of_scores"),rs.getDouble("num_of_scores"),rs.getBoolean("na_voljo"));
				break;
			}
			rs.close();
			
		} finally {
			conn.close();
		}
		return ret;
	}
	
	public void deleteMovie(int id) throws Exception {
		Connection conn=getConnection();
		try {

			PreparedStatement ps=conn.prepareStatement("delete from movies where movies_id=?");
			ps.setInt(1, id);
			ps.executeUpdate();

		} finally {
			conn.close();
		}
	}
	
	public void insertMovie(Movie o) throws Exception {
		Connection conn=getConnection();		
		try {
			Statement st = conn.createStatement();
			ResultSet obstojeciFilmi = st.executeQuery("select movie_id from movies");
			int flag = 0;
			while (obstojeciFilmi.next())
				if (obstojeciFilmi.getString(1).compareTo(o.getKolosejevID()) == 0)
					flag++;
			
			if(flag == 0) {
				PreparedStatement ps=conn.prepareStatement("insert into movies(movies_id , movie_id , title , original_title, punchline, trailer, genre, year, duration, url, poster, director, producer, writer, cast, distributor, language, country, localization, plot_outline, sum_of_scores, num_of_scores, na_voljo) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				ps.setInt(1, o.getBazniID());
				ps.setString(2, o.getKolosejevID());
				ps.setString(3, o.getTitle());
				ps.setString(4, o.getOriginalTitle());
				ps.setString(5, o.getPunchline());
				ps.setString(6, o.getTrailer());
				ps.setString(7, o.getGenre());
				ps.setInt(8, o.getYear());
				ps.setInt(9, o.getDuration());
				ps.setString(10, o.getUrl());
				ps.setString(11, o.getPoster());
				ps.setString(12, o.getDirector());
				ps.setString(13, o.getProducer());
				ps.setString(14, o.getWriter());
				ps.setString(15, o.getCast());
				ps.setString(16, o.getDistributor());
				ps.setString(17, o.getLanguage());
				ps.setString(18, o.getCountry());
				ps.setString(19, o.getLocalization());
				ps.setString(20, o.getPlotOutline());
				ps.setDouble(21, o.getSumOfScores());
				ps.setDouble(22, o.getNumOfScores());
				ps.setBoolean(23, o.isNa_voljo());
				ps.executeUpdate();
			}
			else {
				System.out.println("Film že obstaja! Posodabljam film (za vsak slučaj).");
				posodobiObstojeciFilm(o);
			}
		} finally {
			if(conn!=null)
			conn.close();
		}
	}
	public void posodobiObstojeciFilm(Movie m) throws Exception {
		Connection conn=getConnection();		
		try {
			PreparedStatement ps=conn.prepareStatement("UPDATE movies SET title=?, original_title=?, punchline=?, genre=?, year=?, duration=?, url=?, poster=?, director=?, producer=?, writer=?, cast=?, distributor=?, language=?, country=?, localization=?, plot_outline=? WHERE movies_id = ?");
			ps.setString(1, m.getTitle());
			ps.setString(2, m.getOriginalTitle());
			ps.setString(3, m.getPunchline());
			ps.setString(4, m.getGenre());
			ps.setInt(5, m.getYear());
			ps.setInt(6, m.getDuration());
			ps.setString(7, m.getUrl());
			ps.setString(8, m.getPoster());
			ps.setString(9, m.getDirector());
			ps.setString(10, m.getProducer());
			ps.setString(11, m.getWriter());
			ps.setString(12, m.getCast());
			ps.setString(13, m.getDistributor());
			ps.setString(14, m.getLanguage());
			ps.setString(15, m.getCountry());
			ps.setString(16, m.getLocalization());
			ps.setString(17, m.getPlotOutline());
			ps.setInt(18, m.getBazniID());
			ps.executeUpdate();
			
		} finally {
			if(conn!=null)
			conn.close();
		}
	}
	public void updateMovie(int movies_id, String movie_id, String title, String original_title, String punchline, String trailer, String genre, int year, int duration, String url, String poster, String director, String producer, String writer, String cast, String distributor, String language, String country, String localization, String plot_outline, boolean na_voljo) throws Exception {
        
        Connection conn=getConnection();
        try {
                
                PreparedStatement ps=conn.prepareStatement("update movies set movie_id=?, title=?, original_title=?, punchline=?, trailer=?, genre=?, year=?, duration=?, url=?, poster=?, director=?, producer=?, writer=?, cast=?, distributor=?, language=?, country=?, localization=?, plot_outline=?, na_voljo=? where movies_id=?");
                ps.setString(1, movie_id);
                ps.setString(2, title);
                ps.setString(3, original_title);
                ps.setString(4, punchline);
                ps.setString(5, trailer);
                ps.setString(6, genre);
                ps.setInt(7, year);
                ps.setInt(8, duration);
                ps.setString(9, url);
                ps.setString(10, poster);
                ps.setString(11, director);
                ps.setString(12, producer);
                ps.setString(13, writer);
                ps.setString(14, cast);
                ps.setString(15, distributor);
                ps.setString(16, language);
                ps.setString(17, country);
                ps.setString(18, localization);
                ps.setString(19, plot_outline);
                ps.setBoolean(20, na_voljo);
        
                ps.setInt(21, movies_id);
                
                ps.executeUpdate();
                ps.close();
            
        } finally {
        conn.close();
        }

}
}