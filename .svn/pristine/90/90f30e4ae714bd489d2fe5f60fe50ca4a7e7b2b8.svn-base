<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>

           <% if(session.getAttribute("email") == null) {%>

	<div class="bg-content">
		<!-- content -->
		<div id="content">
			<div class="ic"></div>
			<div class="container">
				<div class="row">
				

						<div class="inner-1">


		<form onsubmit="return validacijaPrijave()" method="post" action="/kino/Prijava" style="text-align: center">
		<h3>Prijava</h3>
		<fieldset>
		<div>
			<label class="name">
				<input type="text" id="email" name="email" value="" placeholder="Email" required>
			</label>
		</div>
		<div>
			<label class="phone">
				<input type="password" id="pass" name="pass"  value="" placeholder="Geslo" required>
			</label>
		</div>
		<div class="buttons-wrapper">
			<input type="submit" class="btn btn-1" value="Prijava" />
		</div>	
		
		<br />
				<center><p id="feedback_reg"></p></center>
		
		<h3>Še nimaš računa? Registriraj se tukaj.</h3>
		<div class="buttons-wrapper">
			<a class="btn btn-1" href="registracija.jsp">Registracija</a>
		</div>
		</fieldset>
	</form>	


						</div>
				</div>
				
			</div>
		</div>
	</div>
	
	    <% } else {
                        
    			out.println("<script type=\"text/javascript\">");
    			out.println("alert('Za prijavo se morate prvo odjaviti!');");
    			out.println("location='index.jsp';");
    			out.println("</script>");
            }
	    	
	    %>
<%@include file="footer.jsp"%>