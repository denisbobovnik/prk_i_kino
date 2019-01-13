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

@WebServlet(urlPatterns="/Registracija")
public class Registracija extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String SOL = "moje-solno-besedilo";

    public Registracija() {
        super();
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=UTF-8");
    	String first_name = request.getParameter("first_name");
    	String last_name = request.getParameter("last_name");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String pass1 = request.getParameter("pass1");
        PrintWriter out = response.getWriter();
        if(pass.compareTo(pass1)==0) {
    	    try {
    			String slanoGeslo = SOL + pass;
    			String hashanoGeslo = new UserDao().generateHash(slanoGeslo);
				Class.forName("com.mysql.jdbc.Driver");
	    	    Connection con = DriverManager.getConnection("jdbc:mysql://svizec2.informatika.uni-mb.si:3306/s4p3_kino?autoReconnect=true&useSSL=false&useUnicode=true&characterEncoding=utf-8", "s4p3_kino", "v345qc");
	    	    Statement st = con.createStatement();
	    	    /* izloči duplikatni vnos uporabnikov v bazo */
	    		ResultSet obstojeciUporabniki = st.executeQuery("select email from users");
	    	    int flag = 0;
	    		while (obstojeciUporabniki.next())
	    			if (obstojeciUporabniki.getString(1).compareTo(email) == 0)
	    				flag++;
	    		if(flag != 0) {
	    			String obstaja = "Uporabnik s tem emailom že obstaja!";
	    	        request.setAttribute("obstaja", obstaja);
	    			request.getRequestDispatcher("/registracija.jsp").forward(request, response);
	    		}
	    		else {
	    		    PreparedStatement ss = con.prepareStatement("insert into users(first_name, last_name, email, pass) values (?,?,?,?)");
	    			ss.setString(1, first_name);
	    			ss.setString(2, last_name);
	    			ss.setString(3, email);
	    			ss.setString(4, hashanoGeslo);
	    			ss.executeUpdate();
	    			out.println("<script type=\"text/javascript\" charset=\"utf-8\">");
	    			out.println("alert('Registracija je uspešna! Preusmerjam vas na prijavo...');");
	    			out.println("location='prijava.jsp';");
	    			out.println("</script>");
	    		}
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
        }
        else {
    		String neujema = "Gesli se nista ujemali! Poskusite ponovno.";
            request.setAttribute("neujema", neujema);
    		request.getRequestDispatcher("/registracija.jsp").forward(request, response);
        }
    }
}