package si.um.feri.praktikum;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class VstopniceDao {

	private Connection getConnection() {
		try {
			DataSource ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/praktikum");
			return ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Vstopnice> selectVstopnice() throws Exception {
		List<Vstopnice> ret=new ArrayList<Vstopnice>();
		Connection conn=getConnection();
		try {
			
			ResultSet rs=conn.createStatement().executeQuery("select * from tickets");
			while (rs.next()) {
				Vstopnice o=new Vstopnice(rs.getInt("idtickets"),rs.getDouble("cena"),rs.getString("kraj"),rs.getString("vrsta"));
				ret.add(o);
			}
			rs.close();
			
		} finally {
			conn.close();
		}
		return ret;
	}
	
	public Vstopnice selectVstopnice(int idtickets) throws Exception {
		Vstopnice ret=null;
		Connection conn=getConnection();
		try {
			
			PreparedStatement ps=conn.prepareStatement("select * from tickets where idtickets=?");
			ps.setInt(1, idtickets);
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				ret=new Vstopnice(rs.getInt("idtickets"),rs.getDouble("cena"),rs.getString("kraj"),rs.getString("vrsta"));
				break;
			}
			rs.close();
			
		} finally {
			conn.close();
		}
		return ret;
	}
	
	
public void updateVstopnice(double cena, String kraj, String vrsta) throws Exception {
		
		Connection conn=getConnection();
		try {
			
			PreparedStatement ps=conn.prepareStatement("update tickets set cena=? where kraj=? and vrsta=?");
			
			ps.setDouble(1, cena);
			ps.setString(2, kraj);
			ps.setString(3, vrsta);
			
			
			ps.executeUpdate();
			ps.close();
			
		} finally {
			conn.close();
		}
		
	}
	
	
	
	
	
	
	
}
