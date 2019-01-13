var countDownDate = new Date("Jun 17, 2017 00:00:00").getTime();

	var x = setInterval(function() {


	    var now = new Date().getTime();
	    

	    var distance = countDownDate - now;
	    
	    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
	    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
	    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
	    
	    document.getElementById("demo").innerHTML = days + "d " + hours + "h "
	    + minutes + "m " + seconds + "s ";
	    
	    if (distance < 0) {
	        clearInterval(x);
	        document.getElementById("demo").innerHTML = "Glasovanje je končano";
	        var p = document.createElement('p');
	    	p.innerHTML = 0;
	    	    setTimeout(function () {
	    	        document.getElementById('foo').style.display='none';
	    	    }, 0);
	    }
	}, 1000);
	
	function myFunction() {
	    var x = document.getElementById("myDate").value;
	    document.getElementById("demo").innerHTML = x;
	}
	
	var el = document.getElementById('foo');
	el.parentNode.insertBefore(p, el);