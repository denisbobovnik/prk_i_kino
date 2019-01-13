<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="si.um.feri.praktikum.*"%>
<%@page import="si.um.feri.praktikum.GlasovanjeDao"%>
<%@page import="java.text.*" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.Random" %>
<%@include file="header.jsp"%>
<%

request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");



%>
<script type="text/javascript" src="js/casGlasovanje.js"></script>
<div class="bg-content">
		<!-- content -->
		<div id="content">
			<div class="ic"></div>
			<div class="container">
				<div class="row">
						<div class="inner-1">
<h4>Termini glasovanja</h4>
<h5><span>Glasovanje se konča: </span><span id="demo"></span></h5>


<%/*
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://svizec2.informatika.uni-mb.si:3306/s4p3_kino?autoReconnect=true&useSSL=false", "s4p3_kino", "v345qc");
ResultSet naslovi = con.prepareStatement("select title from movies").executeQuery();
ResultSet sestevki = con.prepareStatement("select sum_of_scores from movies").executeQuery();
ResultSet stevila = con.prepareStatement("select num_of_scores from movies").executeQuery();
Map<String, double> skupaj = new HashMap<String, double>();

*/
%>
     
  <% GlasovanjeDao os=new GlasovanjeDao();
  Glasovanje o = new Glasovanje();
 
  %>
<div id="foo">
<form action="/kino/Glasovalnik?poslji=<%=o.getIDglasovanje() %>" method="post">					
<table frame="above">
  <tr>
    <th>Filmi</th>
    <th>Petek</th>
    <th>Sobota</th>
  </tr>
  <tr>


 


   <td><select name="glasovanje_ID"  <% for (Glasovanje s:os.dobiImena()){ %>> 
    <option id="title"  value="<%=s.getIDglasovanje()%>"><%=s.getFilm() %></option> 
     <% } %> 
</select></td>
  <td><input type="radio"  id="datum"  name="datum1" value="1">Pet_14:00<br> 
  <input type="radio" id="datum" name="datum2" value="1">Pet_15:00<br> 
  <input type="radio" id="datum" name="datum3" value="1">Pet_21:00<br> </td>

	<td><input type="radio" id="datum" name="datum4" value="1">Sob_14:00<br> 
	<input type="radio" id="datum" name="datum5" value="1">Sob_15:00<br> 
	<input type="radio" id="datum" name="datum6" value="1">Sob_21:00<br> </td>
 
</table>

  <input type="submit" value="Glasuj">
</form>
<script type="text/javascript" src="js/casGlasovanje.js"></script>
</div>
						</div>
				</div>
				
			</div>
		</div>
	</div>
<%@include file="footer.jsp"%>