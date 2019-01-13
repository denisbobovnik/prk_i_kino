package si.um.feri.praktikum;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns="/Posodobitev")
public class Posodobitev extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Posodobitev() {
        super();
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	new PosodobitevBaze().main();
    	Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy HH:mm:ss");
		String cas = sdf.format(cal.getTime());
        request.setAttribute("cas", cas);
		request.getRequestDispatcher("/admin.jsp").forward(request, response);
	}
}