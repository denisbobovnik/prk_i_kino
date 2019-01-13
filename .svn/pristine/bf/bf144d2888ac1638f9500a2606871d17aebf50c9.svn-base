package si.um.feri.praktikum;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet(urlPatterns="/Ocenjevalnik")
public class Ocenjevalnik extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Ocenjevalnik() {
        super();
    }

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int bazniIDfilma = Integer.parseInt(request.getParameter("idFilma"));
			double ocena = Double.parseDouble(request.getParameter("rating-input-1"));
			
			Cookie[] piskotki = request.getCookies();
			int flag = 0, vr;
			for(int i=0; i<piskotki.length; i++) {
				try {
				    vr = Integer.parseInt(piskotki[i].getValue());
				} catch (NumberFormatException e) {
				    vr = -1;
				}
				if(vr==bazniIDfilma) {
					flag++;
				}
			}
			
			if(flag == 0) {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://svizec2.informatika.uni-mb.si:3306/s4p3_kino?autoReconnect=true&useSSL=false", "s4p3_kino", "v345qc");
				PreparedStatement stevilo = con.prepareStatement("select num_of_scores from movies where movies_id = ?");
				stevilo.setInt(1, bazniIDfilma);
				PreparedStatement sestevek = con.prepareStatement("select sum_of_scores from movies where movies_id = ?");
				sestevek.setInt(1, bazniIDfilma);
				
				double steviloVrednost = 0;
				ResultSet steviloOcen = stevilo.executeQuery();
				while (steviloOcen.next())
					steviloVrednost = steviloOcen.getDouble(1);
				steviloVrednost++;
				
				double vsotaVrednost = 0;
				ResultSet sestevekOcen = sestevek.executeQuery();
				while (sestevekOcen.next())
					vsotaVrednost = sestevekOcen.getDouble(1);
				vsotaVrednost += ocena;
				
				PreparedStatement psi = con.prepareStatement("UPDATE movies SET num_of_scores = ?, sum_of_scores = ? WHERE movies_id = ?");
				psi.setDouble(1, steviloVrednost);
				psi.setDouble(2, vsotaVrednost);
				psi.setInt(3, bazniIDfilma);
				psi.executeUpdate();
				
				String nazivPiskotka = "Film_" + bazniIDfilma;
				String vsebinaPiskotka = "" + bazniIDfilma;
				Cookie piskotek = new Cookie(nazivPiskotka, vsebinaPiskotka);
				response.addCookie(piskotek);
				
				request.getRequestDispatcher("/film.jsp?poslji=" + bazniIDfilma).forward(request, response);
			}
			else {
				String ocenili = "Ta film ste že ocenili!";
		        request.setAttribute("ocenili", ocenili);
		        request.getRequestDispatcher("/film.jsp?poslji=" + bazniIDfilma).forward(request, response);
			}
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}