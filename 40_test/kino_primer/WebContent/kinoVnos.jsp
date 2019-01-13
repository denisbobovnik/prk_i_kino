<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Vnos podatkov</title>
	</head>
	
	<body>
		<h1>Vnesite podatke</h1>
		
		<a href="kinoSeznam.jsp">Domov</a>
		
		<form action="kinoSeznam.jsp" method="post">
			MovieID: <input type="text" name="movie_id" /> <br/>
			Title: <input type="text" name="title" /> <br/>
			Original Title: <input type="text" name="originalTitle" /> <br/>
			Punchline: <input type="text" name="punchline" /> <br/>
			Genre: <input type="text" name="genre" /> <br/>
			Year: <input type="text" name="year" /> <br/>
			Duration: <input type="text" name="duration" /> <br/>
			Url: <input type="text" name="url" /> <br/>
			Poster: <input type="text" name="poster" /> <br/>
			Director: <input type="text" name="director" /> <br/>
			Producer: <input type="text" name="producer" /> <br/>
			Writer: <input type="text" name="writer" /> <br/>
			Cast: <input type="text" name="cast" /> <br/>
			Distributor: <input type="text" name="distributor" /> <br/>
			Language: <input type="text" name="language" /> <br/>
			Country: <input type="text" name="country" /> <br/>
			Localization: <input type="text" name="localization" /> <br/>
			Plot Outline: <input type="text" name="plot_outline" /> <br/>
			Sum of Scores: <input type="text" name="sum_of_scores" /> <br/>
			Num of Scores: <input type="text" name="num_of_scores" /> <br/>
			
			<input type="submit" name="vnos" value="Vnos">
		</form>

	</body>
</html>