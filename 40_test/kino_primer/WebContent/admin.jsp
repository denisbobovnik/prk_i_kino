<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<%@page import="java.util.HashMap"%>
<%@page import="si.um.feri.praktikum.*"%>
<%@page import="java.text.*" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.util.HashMap" %>
<script type="text/javascript" src="js/casGlasovanje.js"></script>
                          
                          <% if(session.getAttribute("email") != null) {
                            if (((String) session.getAttribute("email")).compareTo("admin@kolosej.si")==0) {
				%>
				
				<%
			MovieDao od=new MovieDao();
			ShowDao sh=new ShowDao();
			
			request.setCharacterEncoding("UTF-8");
			
			if (request.getParameter("vnos")!=null) {
				od.insertMovie(new Movie(0,request.getParameter("movie_id"),request.getParameter("title"),request.getParameter("originalTitle"),request.getParameter("punchline"),request.getParameter("trailer"),request.getParameter("genre"),Integer.parseInt(request.getParameter("year")),Integer.parseInt(request.getParameter("duration")),request.getParameter("url"),request.getParameter("poster"),request.getParameter("director"),request.getParameter("producer"),request.getParameter("writer"),request.getParameter("cast"), request.getParameter("distributor"),request.getParameter("language"),request.getParameter("country"),request.getParameter("localization"),request.getParameter("plot_outline"),0,0,true));
			}
			if (request.getParameter("update")!=null) {
				
				od.updateMovie(Integer.parseInt(request.getParameter("movies_id")),request.getParameter("movie_id"),request.getParameter("title"),request.getParameter("originalTitle"),request.getParameter("punchline"),request.getParameter("trailer"),request.getParameter("genre"),Integer.parseInt(request.getParameter("year")),Integer.parseInt(request.getParameter("duration")),request.getParameter("url"),request.getParameter("poster"),request.getParameter("director"),request.getParameter("producer"),request.getParameter("writer"),request.getParameter("cast"), request.getParameter("distributor"),request.getParameter("language"),request.getParameter("country"),request.getParameter("localization"),request.getParameter("plot_outline"), Boolean.parseBoolean(request.getParameter("na_voljo")));
		
			}

		%>
				
				

	<div class="bg-content">
		<!-- content -->
		<div id="content">
			<div class="ic"></div>
			<div class="container">
				<div class="row">
				

						<div class="inner-1">
						

						
			
	<form action="${pageContext.request.contextPath}/Posodobitev" method="post">
		<center>
			<br /><input type="submit" class="btn btn-1" value="Osveži bazo" />
		</center>
	</form>
	
							<%String cas = "";
						if(request.getAttribute("cas")!= null) {
							cas = (String) request.getAttribute("cas");%>
							<br /><center>Nazadnje posodobljeno: <%=cas %></center>
						<%}%>


		<form method="post" action="admin.jsp" style="text-align: center">
		<h3>Vnos filma</h3>
		<fieldset>
		<table style="margin: 0px auto;">
			<tr>
				<td>ID filma:</td>
				<td>Naslov:</td>
				<td>Originalni naslov:</td>
				<td>Punchline:</td>
			</tr>
			<tr>
				<td><input type="text" name="movie_id" value="" placeholder="MovieID"></td>
				<td><input type="text" name="title" value="" placeholder="Title"></td>
				<td><input type="text" name="originalTitle" value="" placeholder="Original_Title"></td>
				<td><input type="text" name="punchline" value="" placeholder="Punchline"></td>
			</tr>
			<tr>
				<td>Žanr:</td>
				<td>Leto:</td>
				<td>Dolžina:</td>
				<td>URL:</td>
			</tr>
			<tr>
				<td><input type="text" name="genre" value="" placeholder="Genre"></td>
				<td><input type="text" name="year" value="" placeholder="Year"></td>
				<td><input type="text" name="duration" value="" placeholder="Duration"></td>
				<td><input type="text" name="url" value="" placeholder="Url"></td>
			</tr>
			<tr>
				<td>Poster:</td>
				<td>Direktor:</td>
				<td>Producent::</td>
				<td>Scenarij:</td>
			</tr>
			<tr>
				<td><input type="text" name="poster" value="" placeholder="Poster"></td>
				<td><input type="text" name="director" value="" placeholder="Director"></td>
				<td><input type="text" name="producer" value="" placeholder="Producer"></td>
				<td><input type="text" name="writer" value="" placeholder="Writer"></td>
			</tr>
			<tr>
				<td>Igrajo:</td>
				<td>Distributer:</td>
				<td>Jezik:</td>
				<td>Država:</td>
			</tr>
			<tr>
				<td><input type="text" name="cast" value="" placeholder="Cast"></td>
				<td><input type="text" name="distributor" value="" placeholder="Distributor"></td>
				<td><input type="text" name="language" value="" placeholder="Language"></td>
				<td><input type="text" name="country" value="" placeholder="Country"></td>
			</tr>
			<tr>
				<td>Lokalizacija:</td>
				<td>Trailer link:</td>
				<td colspan="2">Opis zgodbe:</td>
				
			</tr>
			<tr>
				<td valign="top"><input type="text" name="localization" value="" placeholder="Localization"></td>
				<td valign="top"><input type="text" name="trailer" value="" placeholder="Trailer"></td>
				<td valign="top" colspan="2" ><textarea style="resize:none;width:97%;" rows="4" cols="50" name="plot_outline" placeholder="Plot_Outline"></textarea></td>
			</tr>
		</table>
		
		
		
		
		<div class="buttons-wrapper">
			<input type="submit" class="btn btn-1" name="vnos" value="Vnesi" />
		</div>	
		</fieldset>
	</form>	
	
	
	<form method="post" action="vote.jsp" style="text-align: center">
		<h3>Izbira filmov za glasovanje</h3>
		<h5><span>Konec Glasovanja: </span><span id="demo" ></span></h5>
		<fieldset>
					<div>
			<label class="name">
				

  
   <select name="vote_film1" <% for (Movie o :od.selectMovie()) { %> > 
  
  <option value="<%=o.getTitle() %>"><%=o.getTitle() %></option> 

    <% } %> 
</select>
  
  
   <select  name="vote_film2" <% for (Movie o :od.selectMovie()) { %>> 
  
  <option   value="<%=o.getTitle() %>"><%=o.getTitle() %></option> 

    <% } %> 
</select>
  
  
   <select name="vote_film3" <% for (Movie o :od.selectMovie()) { %>> 
  
  <option value="<%=o.getTitle() %>"><%=o.getTitle() %></option> 

    <% } %> 
</select>

				

			
			
			</label>
		</div>
			<div class="buttons-wrapper">
			<input type="submit" class="btn btn-1" value="Dodaj" />
			
		</div>	
		</fieldset>
		</form>
		<h3 style="text-align: center">Update filma</h3>
		<% int id1=0; %>
		<form method="post" action="admin.jsp" style="text-align: center">
		<select name="poslji1">
		<% for(Movie o : od.selectMovie()){%>
  			<option value="<%=o.getBazniID() %>"><%=o.getTitle() %></option>
		<% } %>
		</select>
		<input type="submit" class="btn btn-1" value="Izberi"/>
		</form>
		
		<%
		if(request.getParameter("poslji1")!=null){
		id1=Integer.parseInt(request.getParameter("poslji1")); 
		}
		//System.out.println(id1);
		%>
		
		<% for(Movie o : od.selectMovie()){ 
		   if(request.getParameter("poslji1")!=null){
		   		if(o.getBazniID()==id1){
		%>
		
		<form method="post" action="admin.jsp" style="text-align: center">
		
		<fieldset>
		
		<table style="margin: 0px auto;">
			<tr>
				<td>ID filma:</td>
				<td>Naslov:</td>
				<td>Originalni naslov:</td>
				<td>Punchline:</td>
			</tr>
			<tr>
				<td><input type="text" name="movie_id" value="<%=o.getKolosejevID()%>" placeholder="<%=o.getKolosejevID()%>"></td>
				<td><input type="text" name="title" value="<%=o.getTitle()%>" placeholder="<%=o.getTitle()%>"></td>
				<td><input type="text" name="originalTitle" value="<%=o.getOriginalTitle()%>" placeholder="<%=o.getOriginalTitle()%>"></td>
				<td><input type="text" name="punchline" value="<%=o.getPunchline()%>" placeholder="<%=o.getPunchline()%>"></td>
			</tr>
			<tr>
				<td>Žanr:</td>
				<td>Leto:</td>
				<td>Dolžina:</td>
				<td>URL:</td>
			</tr>
			<tr>
				<td><input type="text" name="genre" value="<%=o.getGenre()%>" placeholder="<%=o.getGenre()%>"></td>
				<td><input type="text" name="year" value="<%=o.getYear()%>" placeholder="<%=o.getYear()%>"></td>
				<td><input type="text" name="duration" value="<%=o.getDuration()%>" placeholder="<%=o.getDuration()%>"></td>
				<td><input type="text" name="url" value="<%=o.getUrl()%>" placeholder="<%=o.getUrl()%>"></td>
			</tr>
			<tr>
				<td>Poster:</td>
				<td>Direktor:</td>
				<td>Producent::</td>
				<td>Scenarij:</td>
			</tr>
			<tr>
				<td><input type="text" name="poster" value="<%=o.getPoster()%>" placeholder="<%=o.getPoster()%>"></td>
				<td><input type="text" name="director" value="<%=o.getDirector()%>" placeholder="<%=o.getDirector()%>"></td>
				<td><input type="text" name="producer" value="<%=o.getProducer()%>" placeholder="<%=o.getProducer()%>"></td>
				<td><input type="text" name="writer" value="<%=o.getWriter()%>" placeholder="<%=o.getWriter()%>"></td>
			</tr>
			<tr>
				<td>Igrajo:</td>
				<td>Distributer:</td>
				<td>Jezik:</td>
				<td>Država:</td>
			</tr>
			<tr>
				<td><input type="text" name="cast" value="<%=o.getCast()%>" placeholder="<%=o.getCast()%>"></td>
				<td><input type="text" name="distributor" value="<%=o.getDistributor()%>" placeholder="<%=o.getDistributor()%>"></td>
				<td><input type="text" name="language" value="<%=o.getLanguage()%>" placeholder="<%=o.getLanguage()%>"></td>
				<td><input type="text" name="country" value="<%=o.getCountry()%>" placeholder="<%=o.getCountry()%>"></td>
			</tr>
			<tr>
				<td>Lokalizacija:</td>
				<td>Trailer link:</td>
				<td>Na sporedu:</td>
				<td>Opis zgodbe:</td>
				
			</tr>
			<tr>
				<td valign="top"><input type="text" name="localization" value="<%=o.getLocalization()%>" placeholder="<%=o.getLocalization()%>"></td>
				<td valign="top"><input type="text" name="trailer" value="<%=o.getTrailer()%>" placeholder="<%=o.getTrailer()%>"></td>
				<td valign="top"><input type="radio" name="na_voljo" value="<%=true%>" checked>Na voljo
							 	 <input type="radio" name="na_voljo" value="<%=false%>">Ni na voljo</td>
				<td valign="top"><textarea style="resize:none;" rows="4" cols="50" name="plot_outline" placeholder="<%=o.getPlotOutline()%>"><%=o.getPlotOutline()%></textarea></td>
			</tr>
		</table>
		
		<input type="hidden" name="movies_id" value="<%=o.getBazniID() %>">
		
		<div class="buttons-wrapper">
			<input type="submit" class="btn btn-1" name="update" value="Posodobi" />
		</div>	
		</fieldset>
	</form>	
		<% } %>
	<% } %>
<% } %>

<% if(request.getParameter("kraj")!=null){
	String kraj = request.getParameter("kraj");
	//System.out.println(kraj);
} %>
<% if(request.getParameter("vrsta")!=null){
	String vrsta = request.getParameter("vrsta");
	//System.out.println(vrsta);
} %>

<%
VstopniceDao a = new VstopniceDao();

if (request.getParameter("posodobiCena")!=null) {
	a.updateVstopnice(Integer.parseInt(request.getParameter("cena")), request.getParameter("kraj"), request.getParameter("vrsta"));
}


%>


<h3 style="text-align: center">Spreminjanje cen vstopnic</h3>
<form method="post" action="admin.jsp">
<table style="margin: 0px auto;">
<tr>
	<td>Kraj:</td>
	<td>Vrsta:</td>
	<td>Cena:</td>
	<td></td>
	
</tr>
<tr>
	<td>
	<select name="kraj">
		<option value="">Vsi</option>
		<option value="Ljubljana">Ljubljana</option>
		<option value="Kranj">Kranj</option>
		<option value="XPAND Ljubljana">XPAND Ljubljana</option>
	</select>
	</td>
	<td>
	<select name="vrsta">
		<option value="">Vsi</option>
		<option value="do120">Do 120 min</option>
		<option value="nad120">Nad 120 min</option>
		<option value="3D">3D</option>
	</select>
	</td>
	<td><input type="text" name="cena" value=""></td>
	<td><input type="submit" class="btn btn-1" name="posodobiCena" value="Izberi"/></td>
</tr>
</table>
</form>
						</div>
				</div>
				
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	<%}
                            else {                 
                    			out.println("<script type=\"text/javascript\">");
                    			out.println("alert('Za dostop do strani morate biti administrator!');");
                    			out.println("location='index.jsp';");
                    			out.println("</script>");
                            }
     } 
	 else
		request.getRequestDispatcher("/prijava.jsp").forward(request, response);
				%>
	
<%@include file="footer.jsp"%>