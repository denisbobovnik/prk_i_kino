<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
String vote_film1 = request.getParameter("vote_film1");
String vote_film2 = request.getParameter("vote_film2");
String vote_film3= request.getParameter("vote_film3");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://svizec2.informatika.uni-mb.si:3306/s4p3_kino?autoReconnect=true&useSSL=false&useUnicode=true&characterEncoding=utf-8", "s4p3_kino", "v345qc");

String[] vnos = {vote_film1, vote_film2, vote_film3};
PreparedStatement ss = con.prepareStatement("insert into glasovanje(Film) values (?)");
if((vote_film1.compareTo(vote_film2)==0)||(vote_film1.compareTo(vote_film3)==0)||(vote_film2.compareTo(vote_film3)==0))
{
	out.println("<script type=\"text/javascript\">");
	out.println("alert('Izbari ste več kot 2 ista filma');");
	out.println("location='admin.jsp';");
	out.println("</script>");
}
else
{
for(int i=0; i<3; i++) {
	ss.setString(1, vnos[i]);
	ss.executeUpdate();
}
request.getRequestDispatcher("/admin.jsp").forward(request, response);
}
%>