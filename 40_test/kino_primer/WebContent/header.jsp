<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Kolosej</title>
	<meta charset="utf-8" >
	<link rel="icon" href="http://dzyngiri.com/favicon.png" type="image/x-icon">
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css" media="screen">
	<link rel="stylesheet" href="responsive.css" type="text/css" media="screen">
	<link rel="stylesheet" href="style.css" type="text/css" media="screen">
	<link rel="stylesheet" href="css/responsive.css" type="text/css" media="screen">
	<link rel="stylesheet" type="text/css" href="css1.css" media="screen">
	<link rel="icon" href="img/favicon.png">
	<link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
	<link rel="stylesheet" href="css/touchTouch.css" type="text/css" media="screen">
	<link rel="stylesheet" href="css/kwicks-slider.css" type="text/css" media="screen">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>
	<script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/superfish.js"></script>
	<script type="text/javascript" src="js/jquery.flexslider-min.js"></script>
	<script type="text/javascript" src="js/validacija.js"></script>
	<script type="text/javascript" src="js/charactersLeft.js"></script>
	<script type="text/javascript" src="js/jquery.kwicks-1.5.1.js"></script>
	<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="js/jquery.cookie.js"></script>    
	<script type="text/javascript" src="js/touchTouch.jquery.js"></script>
	<script type="text/javascript">if($(window).width()>1024){document.write("<"+"script src='js/jquery.preloader.js'></"+"script>");}	</script>

	<script>		
		 jQuery(window).load(function() {	
		 $x = $(window).width();		
	if($x > 1024)
	{			
	jQuery("#content .row").preloader();    }	
		 
     jQuery('.magnifier').touchTouch();			
    jQuery('.spinner').animate({'opacity':0},1000,'easeOutCubic',function (){jQuery(this).css('display','none')});	
  		  }); 
				
	</script>

	
</head>
<body>
    <div class="spinner" style="left: -52px; top: -233px"></div> 
<!-- header start -->
<header>

        <div style="background-color:rgb(150, 18, 18)" class="container clearfix">
    <div style="background-color:rgb(150, 18, 18)" class="row">
          <div class="span12">
        <div class="navbar navbar_">
              <div class="container">
              <h1 class="brand brand_"><a href="index.jsp"><img alt="logo" src="img/logo.png" width="300px" height="100px"></a></h1>
            <a class="btn btn-navbar btn-navbar_" data-toggle="collapse" data-target=".nav-collapse_">Menu <span class="icon-bar"></span> </a>
            
            <div class="nav-collapse nav-collapse_  collapse">
              <ul class="nav sf-menu">
                            <% if(session.getAttribute("email") != null) {
                            if (((String) session.getAttribute("email")).compareTo("admin@kolosej.si")==0) {
				%>
					<li class="item3${pageContext.request.requestURI eq '/kino/admin.jsp' ? ' active' : ''}"><a href="admin.jsp">Upravljaj</a></li>
				<%} }%>
                <li class="item3${pageContext.request.requestURI eq '/kino/index.jsp' ? ' active' : ''}"><a href="index.jsp">Domov</a></li>
              
                <li class="item3${pageContext.request.requestURI eq '/kino/spored.jsp' ? ' active' : ''}"><a href="spored.jsp">Spored</a></li>
				<li class="item3${pageContext.request.requestURI eq '/kino/vstopnice.jsp' ? ' active' : ''}"><a href="vstopnice.jsp">Vstopnice</a></li>
				<li class="item3${pageContext.request.requestURI eq '/kino/filmi.jsp' ? ' active' : ''} item3${pageContext.request.requestURI eq '/kino/film.jsp' ? ' active' : ''}"><a href="filmi.jsp">Filmi</a></li>
				<li class="item3${pageContext.request.requestURI eq '/kino/glasovanje.jsp' ? ' active' : ''}"><a href="glasovanje.jsp">Glasovanje</a></li>
				<li class="sub-menu item3${pageContext.request.requestURI eq '/kino/oPodjetju.jsp' ? ' active' : ''}
					item3${pageContext.request.requestURI eq '/kino/trzenje.jsp' ? ' active' : ''}
					item3${pageContext.request.requestURI eq '/kino/pravnaObvestila.jsp' ? ' active' : ''}
					item3${pageContext.request.requestURI eq '/kino/zaposlitev.jsp' ? ' active' : ''}
					item3${pageContext.request.requestURI eq '/kino/cookies.jsp' ? ' active' : ''}
					item3${pageContext.request.requestURI eq 'http://www.arena.si/bowling/' ? ' active' : ''}
					item3${pageContext.request.requestURI eq 'http://www.arena.si/biljard/' ? ' active' : ''}
					item3${pageContext.request.requestURI eq 'http://www.casino-rio.si/' ? ' active' : ''}" ><a>Info</a>
				       <ul>
                    <li class="item3${pageContext.request.requestURI eq '/kino/oPodjetju.jsp' ? ' active' : ''}"><a href="oPodjetju.jsp">O podjetju</a></li>
                    <li class="item3${pageContext.request.requestURI eq '/kino/trzenje.jsp' ? ' active' : ''}"><a href="trzenje.jsp">Trženje</a></li>
                    <li class="item3${pageContext.request.requestURI eq '/kino/pravnaObvestila.jsp' ? ' active' : ''}"><a href="pravnaObvestila.jsp">Pravna obvestila</a></li>
                    <li class="item3${pageContext.request.requestURI eq '/kino/zaposlitev.jsp' ? ' active' : ''}"><a href="zaposlitev.jsp">Zaposlitev</a></li>
                    <li class="item3${pageContext.request.requestURI eq '/kino/cookies.jsp' ? ' active' : ''}"><a href="cookies.jsp">Piškotki</a></li>
                    <li class="item3${pageContext.request.requestURI eq 'http://www.arena.si/bowling/' ? ' active' : ''}"><a href="http://www.arena.si/bowling/">Bowling</a></li>
                    <li class="item3${pageContext.request.requestURI eq 'http://www.arena.si/biljard/' ? ' active' : ''}"><a href="http://www.arena.si/biljard/">Biljard</a></li>
                    <li class="item3${pageContext.request.requestURI eq 'http://www.casino-rio.si/' ? ' active' : ''}"><a href="http://www.casino-rio.si/">Casino</a></li>


                  </ul>
                    </li>

				                    				<%
				                    				if ((session.getAttribute("email") == null) || (((String) session.getAttribute("email")).compareTo("")==0)) {
				                    					%>
					<li class="item3${pageContext.request.requestURI eq '/kino/prijava.jsp' ? ' active' : ''} item3${pageContext.request.requestURI eq '/kino/registracija.jsp' ? ' active' : ''}"><a href="prijava.jsp">Prijava</a></li>
				<%} else { %>
					<li class="item3${pageContext.request.requestURI eq '/kino/logout.jsp' ? ' active' : ''} item3${pageContext.request.requestURI eq '/kino/registracija.jsp' ? ' active' : ''}"><a href="logout.jsp">Odjava</a></li>
				<%} %>          
                
              </ul>
                </div>
          </div>
            </div>
      </div>
        </div>
  </div>
    </header>