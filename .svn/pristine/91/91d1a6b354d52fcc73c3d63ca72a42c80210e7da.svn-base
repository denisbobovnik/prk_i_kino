package si.um.feri.praktikum;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns="/Prijava")
public class Prijava extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String SOL = "moje-solno-besedilo";
       
    public Prijava() {
        super();
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out = response.getWriter();
    	HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        boolean pravilnoGeslo = false;
        pravilnoGeslo = login(email, pass);
        if(pravilnoGeslo) {
        	session.setAttribute("email", email);
        	response.sendRedirect("index.jsp");
        } else {
        	out.println("<script type=\"text/javascript\" charset=\"utf-8\">");
        	out.println("alert('Nepravilno geslo ali pa uporabnik ne obstaja! Poskusite ponovno.');");
        	out.println("location='prijava.jsp';");
        	out.println("</script>");
        }
	}
	public Boolean login(String email, String password) {
		Boolean isAuthenticated = false;
		String saltedPassword = SOL + password;
		String bazniMail = "", baznoGeslo = "";
		String hashedPassword = new UserDao().generateHash(saltedPassword);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://svizec2.informatika.uni-mb.si:3306/s4p3_kino?autoReconnect=true&useSSL=false", "s4p3_kino", "v345qc");
	        Statement st = con.createStatement();
	        ResultSet rs = st.executeQuery("select * from users where email='" + email + "';");
	        if (rs.next()) {
	        	bazniMail = rs.getString(4);
	        	baznoGeslo = rs.getString(5);
	        	if((bazniMail.compareTo(email)==0)&&(baznoGeslo.compareTo(hashedPassword)==0))
	        		isAuthenticated = true;
	        	else
	        		isAuthenticated = false;
	        }
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isAuthenticated;
	}
}