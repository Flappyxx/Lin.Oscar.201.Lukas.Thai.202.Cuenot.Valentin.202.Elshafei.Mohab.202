$(document).ready(function(){

	var map = L.map('map', {center: [37.40507, 139.72412],zoom: 6});
	var base = L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png').addTo(map);
	var liste_marqueur=[];
	$.ajax({
        	//L'URL de la requête 
        	url: "getStudio.php",

	        //La méthode d'envoi (type de requête)
	        method: "GET",
		dataType:"json"
		
    	})
    	//Ce code sera exécuté en cas de succès - La réponse du serveur est passée à done()
    	/*On peut par exemple convertir cette réponse en chaine JSON et insérer
    	 * cette chaine dans un div id="res"*/
    	.done(function(response){
    	    let data = JSON.stringify(response);
		let studio = L.marker([parseFloat(response.Latitude), parseFloat(response.Longitude)]);
		studio.addTo(map);
		liste_marqueur.push(studio);
    	})
	});