function validacijaRegistracije() {
    var ide = [
        "first_name",
        "last_name",
        "email",
        "pass",
        "pass1"
    ];
    var regex = [
    	/^[a-zA-Z_\u00A1-\uFFFF_\s]{2,45}$/,
    	/^[a-zA-Z_\u00A1-\uFFFF_\s]{2,45}$/,
    	/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/,
    	/^(?=.*[a-zšđžćč])(?=.*[A-ZŠĐŽĆČ])(?=.*\d.*)(?=.*\W.*)[a-zšđžćčA-ZŠĐŽĆČ0-9\S]{8,15}$/,
    	/^(?=.*[a-zšđžćč])(?=.*[A-ZŠĐŽĆČ])(?=.*\d.*)(?=.*\W.*)[a-zšđžćčA-ZŠĐŽĆČ0-9\S]{8,15}$/
    ];
    var sporocilo = [
        "Nepravilno vneseno ime. Zahteve: 2-45 znakov, le male in velike črke ter presledki.",
        "Nepravilno vnesen priimek. Zahteve: 2-45 znakov, le male in velike črke ter presledki.",
        "Nepravilno vnesen email. Zahteve: klasična oblika emaila (npr. xxx@xxx.xxx).",
        "Nepravilno vneseno geslo. Zahteve: 8-15 znakov, vsaj ena mala in velika črka, številka in en poseben znak (brez presledka).",
        "Nepravilno vneseno geslo. Zahteve: 8-15 znakov, vsaj ena mala in velika črka, številka in en poseben znak (brez presledka)."
    ];
    for(var i=0; i<ide.length; i++)
        document.getElementById(ide[i]).style.borderColor = "green";
    
    var flag = 0;
    for(var i=0; i<ide.length; i++) {
        if((validirajPosamezno(ide[i], regex[i], sporocilo[i])) != true) {
            flag++;
            break;
        }
    }
    if(flag != 0)
        return false;
    return true;
}
function validacijaPrijave() {
    var ide = [
        "email",
        "pass"
    ];
    var regex = [
    	/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/,
    	/^(?=.*[a-zšđžćč])(?=.*[A-ZŠĐŽĆČ])(?=.*\d.*)(?=.*\W.*)[a-zšđžćčA-ZŠĐŽĆČ0-9\S]{8,15}$/
    ];
    var sporocilo = [
        "Nepravilno vnesen email. Zahteve: klasična oblika emaila (npr. xxx@xxx.xxx).",
        "Nepravilno vneseno geslo. Zahteve: 8-15 znakov, vsaj ena mala in velika črka, številka in en poseben znak (brez presledka)."
    ];
    for(var i=0; i<ide.length; i++)
        document.getElementById(ide[i]).style.borderColor = "green";
    
    var flag = 0;
    for(var i=0; i<ide.length; i++) {
        if((validirajPosamezno(ide[i], regex[i], sporocilo[i])) != true) {
            flag++;
            break;
        }
    }
    if(flag != 0)
        return false;
    return true;
}
function validirajPosamezno(ide, regex, sporocilo) {
    var vrednostPolja = document.getElementById(ide).value;
    if((vrednostPolja == "")||(vrednostPolja.search(regex)==-1)) {
        document.getElementById(ide).style.borderColor = "red";
        document.getElementById("feedback_reg").innerHTML = sporocilo.replace(/(.{54})/g, "$1<br />");;
        return false;
    }
    return true;
}