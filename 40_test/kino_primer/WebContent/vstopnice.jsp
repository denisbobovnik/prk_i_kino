<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<%@page import="si.um.feri.praktikum.VstopniceDao"%>
<%@page import="si.um.feri.praktikum.Vstopnice"%>
<%@page import="java.text.*" %>
<div class="bg-content">       
  <!--  content  -->      
   <div id="content"><div class="ic"></div>
    <div class="container" >
          <div class="row">
        <article class="span12">
         <div class="inner-1">         
          <ul class="list-blog">
            <li>  
            <h4 style="color:rgb(150, 18, 18);">Vstopnice </h4>  
            <p>Koliko stane vstopnica? Kdaj jo lahko kupim? Ali moram vstopnico nujno kupiti na blagajni?
             Ali lahko rezerviram vstopnico vnaprej? Kakšne popuste ponujate? Odgovore na vsa vprašanja o
              kino vstopnicah najdete v nadaljevanju!</p>
           
        <% VstopniceDao a = new VstopniceDao(); %>
        <% double cena1=0; 
           double cena2=0;
           double cena3=0;
           double cena4=0;
           double cena5=0;
           double cena6=0;
           double cena7=0;
  
        %>
           
        <% for(Vstopnice v : a.selectVstopnice()){ %>
        <% if(v.getVrsta().compareTo("do120")==0){  %>
        <%	 if(v.getKraj().compareTo("Ljubljana")==0){ %>
        <%   	cena1 = v.getCena(); %>
        <%   }else if(v.getKraj().compareTo("Kranj")==0){ %>
        <%   	cena2 = v.getCena(); %>
        <%   }%>
        
        <% }else if(v.getVrsta().compareTo("nad120")==0){ %>
        <%	 if(v.getKraj().compareTo("Ljubljana")==0){ %>
        <%   	cena3 = v.getCena(); %>
        <%   }else if(v.getKraj().compareTo("Kranj")==0){ %>
        <%   	cena4 = v.getCena(); %>
        <%   }%>
        
        <% }else if(v.getVrsta().compareTo("3D")==0){ %>
        <%	 if(v.getKraj().compareTo("Ljubljana")==0){ %>
        <%   	cena5 = v.getCena(); %>
        <%   }else if(v.getKraj().compareTo("Kranj")==0){ %>
        <%   	cena6 = v.getCena(); %>
        <%   }else if(v.getKraj().compareTo("XPAND Ljubljana")==0){ %>
        <%   	cena7 = v.getCena(); %>
        <%   }%>
        
        <% } %> 
        <% } %>
        <% System.out.print(cena1+ " "+ cena2); %>
           
            <h5>Cena stopnic za filme do 120 minut</h5>   
             <div class="clear"></div>            
              <table class="standard" style="width:480px">
		<tr>
			<th>&nbsp; </th>
			<th style="text-align:center;">redna cena<br/><nobr>(pon.-pet.)</nobr> </th>
			<th style="text-align:center;">redna cena<br/><nobr>(sob.-ned.,</nobr> prazniki) </th>
			<th style="text-align:center;">cena s popustom * </th>
			<th style="text-align:center;">cena do 14. ure </th>
			
		</tr>
		<tr>
			<td> Ljubljana </td>
			<td style="text-align:center;"><nobr><%=cena1 %> &euro;</nobr> </td>
			<td style="text-align:center;"><nobr><%=cena1*1.22 %> &euro;</nobr> </td>
			<td style="text-align:center;"><nobr><%=cena1*0.80 %> &euro;</nobr> </td>
			<td style="text-align:center;"><nobr><%=cena1*0.90 %> &euro;</nobr> </td>
			
		</tr>
		<tr>
			<td> Kranj </td>
			<td style="text-align:center;"><%=cena2 %> &euro;	</td>
			<td style="text-align:center;"><%=cena2*1.22 %> &euro; </td>
			<td style="text-align:center;"><%=cena2*0.80 %> &euro; </td>
			<td style="text-align:center;"><%=cena2*0.90 %> &euro; </td>
			
		</tr>
	</table>   
	<%NumberFormat formatter = NumberFormat.getInstance(); 
					formatter.setMaximumFractionDigits(2);	
					formatter.setMinimumFractionDigits(2);	
					
					String cenaFormatirana = formatter.format(cena3*0.80);
					String cenaFormatirana2 = formatter.format(cena4*0.80);%>
					
					
	
	
	<br> 
	<h5>Cena stopnic za filme od 120 minut</h5>                           
              <table class="standard" style="width:480px">
		<tr>
			<th>&nbsp; </th>
			<th style="text-align:center;">redna cena<br/><nobr>(pon.-pet.)</nobr> </th>
			<th style="text-align:center;">redna cena<br/><nobr>(sob., ned.,</nobr> prazniki) </th>
			<th style="text-align:center;">cena s popustom * </th>
			<th style="text-align:center;">cena do 14. ure </th>
			
		</tr>
		<tr>
			<td> Ljubljana </td>
			<td style="text-align:center;"><nobr><%=cena3 %> &euro;</nobr> </td>
			<td style="text-align:center;"><nobr><%=cena3*1.22 %> &euro;</nobr> </td>
			<td style="text-align:center;"><nobr><%= cenaFormatirana %> &euro;</nobr> </td>
			<td style="text-align:center;"><nobr><%= cena3*0.90 %> &euro;</nobr> </td>
			
		</tr>
		<tr>
			<td> Kranj </td>
			<td style="text-align:center;"><%=cena4 %> &euro;	</td>
			<td style="text-align:center;"><%=cena4*1.22 %> &euro; </td>
			<td style="text-align:center;"><%= cenaFormatirana2 %> &euro; </td>
			<td style="text-align:center;"><%=cena4*0.90 %> &euro; </td>
			
		</tr>
	</table>
	<br>
	<h5>Cene vstopnic za 3D filme</h5>
	
		<table class="standard" style="width:480px">
		<tr>
			<th>&nbsp; </th>
			<th style="text-align:center;">redna cena<br/><nobr>(pon.-pet.)</nobr> </th>
			<th style="text-align:center;">redna cena<br/><nobr>(sob., ned.,</nobr> prazniki) </th>
			<th style="text-align:center;">cena s popustom * </th>
			<th style="text-align:center;">cena do 14. ure </th>
			
		</tr>
		<tr>
			<td> <span class="caps">XPAND</span> Ljubljana *** </td>
			<td style="text-align:center;"><nobr><%=cena7 %> &euro;</nobr> </td>
			<td style="text-align:center;"><nobr><%=cena7*1.22 %> &euro;</nobr> </td>
			<td style="text-align:center;"><nobr><%=cena7*0.80 %> &euro;</nobr> </td>
			<td style="text-align:center;"><nobr><%=cena7*0.90 %> &euro;</nobr> </td>
			
		</tr>
		<tr>
			<td> Ljubljana </td>
			<td style="text-align:center;"><nobr><%=cena5 %> &euro;</nobr> </td>
			<td style="text-align:center;"><nobr><%=cena5*1.22 %> &euro;</nobr> </td>
			<td style="text-align:center;"><nobr><%=cena5*0.80 %> &euro;</nobr> </td>
			<td style="text-align:center;"><nobr><%=cena5*0.90 %> &euro;</nobr> </td>
			
		</tr>
		<tr>
			<td> Kranj </td>
			<td style="text-align:center;"><%=cena6 %> &euro;	</td>
			<td style="text-align:center;"><%=cena6*1.22 %> &euro; </td>
			<td style="text-align:center;"><%=cena6*0.80 %> &euro; </td>
			<td style="text-align:center;"><%=cena6*0.90 %> </td>
			
		</tr>
	</table>
	<br>
	<p>Študentje in dijaki, seniorji, otroci. Študentski popust velja od ponedeljka do petka (razen ob praznikih), 
	popust za otroke in seniorje pa vsak dan v tednu. Vstopnice za otroke, dijake, študente niso prenosljive.</p>
	<p>Za ogled filma v 3D tehniki potrebujete 3D očala. Za uporabo 3D očal, ki so obiskovalcem na voljo
	 za uporabo v Kolosejevih kinocentrih (Ljubljana, Kranj), je potrebno doplačati 1€, ki 
	 ga cena v tabeli že vključuje. Za uporabo 3D očal, ki so obiskovalcem na voljo za uporabo
	  v Kolosejevih kinocentrih (Ljubljana, Kranj), dobite pri nakupu vstopnice poseben račun,
	   s katerim očala prevzamete pred vhodom v dvorano. Če vstopnico za ogled 3D filma kupujete 
	   prek avtomatskih sistemov prodaje (Joker na internetu in Simobilova Kino vstopnica)
	 se vam strošek za očala avtomatično prišteje k ceni, očala prav tako dobite pred vhodom v dvorano.</p>
	 <p>Dvorana XPAND v Ljubljani je v centru Arena Play & Party nasproti Koloseja.</p>
	 <p>Poseben dan v tednu pa je torek - Kinodan, ko veljajo še posebni popusti pri nakupu vstopnice.
	  Kinodan trenutno velja samo v Ljubljani. V Kranju pa namesto Kinodneva poteka akcija Super ponedeljek.</p>
	  <p>Prodaja vstopnic poteka vsak dan 30 minut pred prvo predstavo.</p>
	  
	  <h5>Način nakupa vstopnic</h5>
	  
	  <table class="standard" style="width:480px">
		<tr>
			<th>prodajno mesto </th>
			<th>nakup</th>
			<th>rezervacije</th>
			<th>plačilno sredstvo</th>
			<th>prevzem </th>
		</tr>
		<tr>
			<td> blagajna </td>
			<td> DA </td>
			<td> NE </td>
			<td> gotovina, kartica Joker </td>
			<td> / </td>
		</tr>
		<tr>
			<td> avtomat za vstopnice </td>
			<td> DA </td>
			<td> NE </td>
			<td> kartica Joker </td>
			<td> / </td>
		</tr>
		<tr>
			<td> <a href="https://vstopnice.kolosej.si/">https://vstopnice.kolosej.si</a> </td>
			<td> DA </td>
			<td> NE </td>
			<td> kartica Joker </td>
			<td> avtomat za vstopnice, blagajna. Prevzem je možen samo na lokaciji, kjer je predstava, za katero so vstopnice. </td>
		</tr>
	</table>
    <h5>Vstopnice s popusti</h5>

<p>V Kolosejevem sistemu pri nakupu vstopnice nudimo posebne popuste seniorjem nad 60 let, otrokom do 10. leta in
študentom ter dijakom - cena je za vse tri skupine obiskovalcev enotna, nakup vstopnice s takim popustom pa je možen
samo na blagajni, ne pa prek sistemov avtomatske prodaje, kot so aparat za vstopnice, Simobilova Kino vstopnica ali
internet.</p>

<p>Študentski popust velja od vključno ponedeljka do vključno petka,
otroški popust in popust za seniorje pa vsak dan v tednu. Študentje so
do popusta upravičeni ob predložitvi svoje študentske oziroma dijaške
izkaznice z nalepko za tekoče šolsko leto ali indeksom, otroci z
zdravstveno izkaznico, seniorji pa z osebnim dokumentom.</p>


<h5>Rezervacije vstopnic</h5>

<p>Rezervacije vstopnic za filmske predstave v Koloseju niso možne. Vstopnice je mogoče kupiti v predprodaji na blagajnah vseh Kolosejevih centrov in kina Komune, in sicer za vse predstave, ki so vidne v sporedu na naši spletni strani, v kolikor niso razprodane.</p>


<h5>Kdaj so vstopnice naprodaj?</h5>

<p>V Koloseju kino vstopnice praviloma prodajamo za en kino teden vnaprej. Kino teden traja od vključno četrtka do vključno srede, potem pa se s četrtkom spet zamenja. Nov spored je
praviloma objavljen najkasneje do srede do 12. ure (razen izjemoma). To pomeni, da je v sredo popoldne možno kupiti vstopnice za skoraj teden dni (do vključno naslednje srede), potem pa se
seznam dni s predstavami krajša - spet do srede, ko se seznam napolni s predstavami v novem kino-tednu. Spored na spletni strani www.kolosej.si se generira neposredno iz prodajnega sistema,
kar pomeni, da so vstopnice na voljo, če so vidne na sporedu na www.kolosej.si.</p>


<h5>Nakup vstopnic prek spleta</h5>

<p>Nakup vstopnic prek spleta lahko opravite s Kolosejevo kartico kino Joker in kmalu s kreditno kartico (MasterCard ali Visa).  Spored na spletni strani <a href="http://www.kolosej.si/">www.kolosej.si</a> se generira neposredno iz prodajnega sistema, kar pomeni, da so vstopnice na voljo, če so vidne na sporedu na spletni strani <a href="www.kolosej.si">www.kolosej.si</a>. Če se odločite za nakup prek interneta, si izberite enoto, kjer si boste film ogledali (izbirate lahko med kinocentri Kolosej Ljubljana, Mestna dvorana Komuna in Kolosej De Luxe Kranj). V izbrani enoti si izberite kateri film si želite ogledati ter željeni datum ter uro predstave. V preglednem programu izberete sedež in vrsto, kjer bi želeli sedeti. Vstopnice, ki ste jih kupili, prevzamete v izbranem kinocentru z voucherjem oziroma prevzemno kodo, ki jo prejmete na elektronski naslov oziroma se vam izpiše ob potrditvi nakupa.</p>


<h5>Joker</h5>

<p>Za filmske navdušence, ki v kinu preživijo nadpovprečno veliko
časa, je prav gotovo najbolj primerna rešitev kino <a
href="./kino-joker/">Joker</a>, s katerim imate popust pri nakupu
vstopnic.

<h5>Joker+</h5>

<p><a href="./joker-plus/">Joker+</a> je Jokerju popolnoma enaka
storitev, le da je namenjena pravnim osebam.

<h5>Filmski abonmaji 2016/2017</h5>

<p>V Koloseju smo tudi letos pripravili <a href="./abonma/">filmske
abonmaje</a>, ki so izbor najboljših filmov za najmlajše ljubitelje
filma, za najstnike s stilom in za filmske strastneže.

<h5>S šolo v kino</h5>

<p>V dopoldanskem času vam ponujamo animirane filme za najmlajše,
mladinske filme, akcije komedije, ameriške, evropske in slovenske
filme; filme, ki so nastali na osnovi literarne predloge in pomembnih
zgodovinskih dogodkov ali pa izvirajo iz tegob odraščanja in nas
popeljejo v svet domišljije ter zabave. <a href="./solske/">Naročite
svojo predstavo!</a>

<h5>Bianco kuponi</h5>

<p>Kupone, ki ste jih dobili prek študentskih servisov, podjetij ali
kako drugače, morate vedno zamenjati za vstopnico za določeno
predstavo. Vstop v dvorano samo s kuponom ni mogoč. Kupone lahko
vnovčite samo na blagajnah, ne pa prek avtomatskih sistemov prodaje
vstopnic. Edina možnost je, da si prek Hitre vstopnice
<b>rezervirate</b> sedež, ob prevzemu in plačilu rezervacije pa za plačilo
uporabite svoj kupon. <b>Pozor</b>: če boste prek Hitre
vstopnice vstopnico <b>kupili</b>, kupona ne boste več mogli vnovčiti, ampak
bo pri transakciji uporabljena redna cena vstopnice za izbrano
predstavo, zato v takih primerih pozorno izberite <b>rezervacijo</b> in ne
nakupa. Menjava vstopnic ali stornacija nakupov, opravljenih prek
sistemov avtomatske prodaje, <b>ni mogoča!</b></p>
<h5>Splošni pogoji spletnega nakupa digitalnih vstopnic</h5>

<p><a href="http://www.kolosej.si/static/cms/vstopnice/SPDV-Reit-Splosni-pogoji-spletnega-nakupa-digitalnih-vstopnic.194224573032.pdf">Splošni pogoji spletnega nakupa digitalnih vstopnic</a> (pdf)</p>
               
             
                        
                                      
          </ul>
          </div>  
        </article>
        
      </div>
     </div>
  </div>
 </div>
<%@include file="footer.jsp"%>