<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<div class="bg-content"> 
      <!-- content -->
      <div id="content"><div class="ic"></div>
    <div class="container">
          <div class="row">
        <article class="span12">
             
              <div class="inner-1">
              

						
											

              
              
		<form method="post" onsubmit="return validacijaRegistracije()" action="/kino/Registracija" style=" text-align:center">
			<h3>Registracija</h3>
			<fieldset>
				<div>
					<label class="name">
						<input type="text" id="first_name" name="first_name" value="" placeholder="Ime" required>
					</label>
				</div>
				<div>
					<label class="name">
						<input type="text" id="last_name" name="last_name" value="" placeholder="Priimek" required>
					</label>
				</div>
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
				<div>
					<label class="phone">
						<input type="password" id="pass1" name="pass1"  value="" placeholder="Ponovi geslo" required>
					</label>
				</div>
				<div class="buttons-wrapper">
					<input type="submit" class="btn btn-1" value="Registriraj se" />
				</div>
				
				<br />
				<center><p id="feedback_reg"></p></center>
				
				              						<%String obstaja = "";
						if(request.getAttribute("obstaja")!= null) {
							obstaja = (String) request.getAttribute("obstaja");%>
							<br /><center><%=obstaja %></center>
						<%}%>
						
						
						
						<%String neujema = "";
						if(request.getAttribute("neujema")!= null) {
							neujema = (String) request.getAttribute("neujema");%>
							<br /><center><%=neujema %></center>
						<%}%>
				
				<h3>Že imaš račun? Prijavi se tukaj.</h3>
				<div class="buttons-wrapper">
					<a class="btn btn-1" href="prijava.jsp">Prijava</a>
				</div>
           </fieldset>
        </form>
                     
                
          </div>
            </article>
      </div>
        </div>
  </div>
    </div>
<%@include file="footer.jsp"%>