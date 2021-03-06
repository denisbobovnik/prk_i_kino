package si.um.feri.praktikum;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;

@WebServlet(urlPatterns="/IzvoziVXML")
public class IzvoziVXML extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public IzvoziVXML() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int bazniIDfilma = Integer.parseInt(request.getParameter("idFilma"));
			Movie filmZaIzvoz = new MovieDao().selectMovie(bazniIDfilma);
			ArrayList<Show> predstave = new ShowDao().predstavePoIDjuFilma(bazniIDfilma);

			response.setCharacterEncoding("UTF-8");
			
			PrintWriter out = response.getWriter();
			StringBuffer sb = new StringBuffer();
			sb.append("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n");
			sb.append("<movie id=\"" + filmZaIzvoz.getKolosejevID() + "\">");
				sb.append("<movies_id>" + filmZaIzvoz.getBazniID() + "</movies_id>\n");
				sb.append("<title>" + parseIllegalCharacters(filmZaIzvoz.getTitle()) + "</title>\n");
				sb.append("<original_title>" + parseIllegalCharacters(filmZaIzvoz.getOriginalTitle()) + "</original_title>\n");
				sb.append("<punchline>" + parseIllegalCharacters(filmZaIzvoz.getPunchline()) + "</punchline>\n");
				sb.append("<trailer>" + parseIllegalCharacters(filmZaIzvoz.getTrailer()) + "</trailer>\n");
				sb.append("<genre>" + parseIllegalCharacters(filmZaIzvoz.getGenre()) + "</genre>\n");
				sb.append("<year>" + filmZaIzvoz.getYear() + "</year>\n");
				sb.append("<duration>" + filmZaIzvoz.getDuration() + "</duration>\n");
				sb.append("<url>" + filmZaIzvoz.getUrl() + "</url>\n");
				sb.append("<poster>" + filmZaIzvoz.getPoster() + "</poster>\n");
				sb.append("<director>" + parseIllegalCharacters(filmZaIzvoz.getDirector()) + "</director>\n");
				sb.append("<producer>" + parseIllegalCharacters(filmZaIzvoz.getProducer()) + "</producer>\n");
				sb.append("<writer>" + parseIllegalCharacters(filmZaIzvoz.getWriter()) + "</writer>\n");
				sb.append("<cast>" + parseIllegalCharacters(filmZaIzvoz.getCast()) + "</cast>\n");
				sb.append("<distributor>" + parseIllegalCharacters(filmZaIzvoz.getDistributor()) + "</distributor>\n");
				sb.append("<language>" + parseIllegalCharacters(filmZaIzvoz.getLanguage()) + "</language>\n");
				sb.append("<country>" + parseIllegalCharacters(filmZaIzvoz.getCountry()) + "</country>\n");
				sb.append("<localization>" + parseIllegalCharacters(filmZaIzvoz.getLocalization()) + "</localization>\n");
				sb.append("<plot_outline>" + parseIllegalCharacters(filmZaIzvoz.getPlotOutline()) + "</plot_outline>\n");
				sb.append("<sum_of_scores>" + filmZaIzvoz.getSumOfScores() + "</sum_of_scores>\n");
				sb.append("<num_of_scores>" + filmZaIzvoz.getNumOfScores() + "</num_of_scores>\n");
				sb.append("<na_voljo>" + filmZaIzvoz.isNa_voljo() + "</na_voljo>\n");
				sb.append("<shows>\n");
					for(Show s : predstave) {
						sb.append("<show id=\"" + s.getShowsID() + "\">");
							sb.append("<shows_id>" + s.getShowID() + "</shows_id>\n");
							sb.append("<date>" + s.getDate() + "</date>\n");
							sb.append("<time>" + s.getTime() + "</time>\n");
							sb.append("<city>" + parseIllegalCharacters(s.getCity()) + "</city>\n");
							sb.append("<center>" + parseIllegalCharacters(s.getCenter()) + "</center>\n");
							sb.append("<theater>" + parseIllegalCharacters(s.getTheater()) + "</theater>\n");
						sb.append("</show>\n");
					}
				sb.append("</shows>\n");
			sb.append("</movie>");
			out.println(sb.toString());
			out.flush();
						
			System.out.println("Podatki so izvoženi v XML!");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String parseIllegalCharacters(String neveljaven) {
		return neveljaven.replace("&", "&amp;");
	}
}