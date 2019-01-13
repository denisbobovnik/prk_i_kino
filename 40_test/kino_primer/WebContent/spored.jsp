<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="si.um.feri.praktikum.MovieDao"%>
<%@page import="si.um.feri.praktikum.Movie"%>
<%@include file="header.jsp"%>
<div class="bg-content">       
  <!-- Content -->      
      <div id="content"><div class="ic"></div>
    <div class="container">
          <div class="row">
        <article class="span12">
        <h4 style="color:rgb(150, 18, 18);">Spored</h4>
        <form method="post" action="spored.jsp">
		<select name="poslji1">
			<option value="vsi">Vsi</option>
  			<option value="drama">Drama</option>
  			<option value="komedija">Komedija</option>
  			<option value="animacija">Animacija</option>
  			<option value="pustolovscina">Pustolovščina</option>
  			<option value="mladinski film">Mladinski film</option>
  			<option value="akcija">Akcija</option>
  			<option value="kriminalka">Kriminalka</option>
  			<option value="domislijska zgodba">Domišlijska zgodba</option>
  			<option value="romanca">Romanca</option>
  			<option value="spektakel">Spektakel</option>
  			<option value="druzinski film">Družinski film</option>
  			<option value="znanstvena fantastika">Znanstvena fantastika</option>
  			<option value="grozljivka">Grozljivka</option>
  			
		</select>
		<input type="submit" class="btn btn-1" value="Izberi"/>
		</form>
         </article>
         
        <div class="clear"></div>
         
            
            <ul class="portfolio clearfix">           
          <% MovieDao od=new MovieDao(); %>
           <%
          CharSequence a = "";
          String c ="";
          if(request.getParameter("poslji1")!=null){
      		a=request.getParameter("poslji1");
      		c=request.getParameter("poslji1");
      		%>  
      		
      		<% for (Movie o :od.selectMovie()) { %>
           <% String b = o.getGenre();
           if(c.compareTo("vsi")==0){%>
    	   <% boolean d = o.isNa_voljo(); %>
           <% if(d == true){ %>
           
           <li class="box" style="width:200px;height:330px;"><a href="film.jsp?poslji=<%=o.getBazniID() %>" ><img alt="" src="<%=o.getPoster()%>" style="width:200px;height:270px;"><h5><%=o.getTitle() %></h5></a></li>
           
            <% } %>
       	
      	 <% }
           
              if(b.contains(a)){ %>
           <% boolean d = o.isNa_voljo(); %>
           <% if(d == true){ %>
           
           <li class="box" style="width:200px;height:330px;"><a href="film.jsp?poslji=<%=o.getBazniID() %>" ><img alt="" src="<%=o.getPoster()%>" style="width:200px;height:270px;"><h5><%=o.getTitle() %></h5></a></li>
           
            <% } %> 
           <% } %> 
           <% } %>
          
          <% }else{ %>
           
           <% for (Movie o :od.selectMovie()) { %>
           
           <% boolean b = o.isNa_voljo(); %>
           <% if(b == true){ %>
           
           <li class="box" style="width:200px;height:330px;"><a href="film.jsp?poslji=<%=o.getBazniID() %>" ><img alt="" src="<%=o.getPoster()%>" style="width:200px;height:270px;"><h5><%=o.getTitle() %></h5></a></li>
           
            <% } %> 
           
            <% } %> 
           
           <% } %> 
                     
            </ul> 
      </div>
        </div>
  </div>
    </div>
<%@include file="footer.jsp"%>