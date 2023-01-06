$(document).ready(function(){

	var map = L.map('map', {center: [35.34819669272675, 138.24222350736719],zoom: 9});
	var base = L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png').addTo(map);
	var liste_studio=[];
	var liste_endroit=[];
	var icone_endroit = L.icon({
    iconUrl: '../img/endroit.svg',
	iconSize:     [40, 40],
	iconAnchor:   [20, 40],
	popupAnchor: [0, -31]
	});
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
		for(let ligne=0;ligne<response.length;ligne++){
			let studio = L.marker([parseFloat(response[ligne].Latitude), parseFloat(response[ligne].Longitude)]);
			studio.addTo(map);
			liste_studio.push(studio);
			let html ="<h3>Studio "+response[ligne].Nom+"</h3><p>"+response[ligne].Description+"</p><center><img width = '100%' src='"+response[ligne].Path+"'></center>";
			let popup = L.popup({keepInView:true,closeButton:true}).setContent(html);
			studio.bindPopup(popup);
		}
    	})
		
		$.ajax({
        	//L'URL de la requête 
        	url: "getEndroit.php",

	        //La méthode d'envoi (type de requête)
	        method: "GET",
		dataType:"json"
		
    	})
    	//Ce code sera exécuté en cas de succès - La réponse du serveur est passée à done()
    	/*On peut par exemple convertir cette réponse en chaine JSON et insérer
    	 * cette chaine dans un div id="res"*/
    	.done(function(response){
		for(let ligne=0;ligne<response.length;ligne++){
			let endroit = L.marker([parseFloat(response[ligne].Latitude), parseFloat(response[ligne].Longitude)],{icon: icone_endroit});
			endroit.addTo(map);
			liste_endroit.push(endroit);
			let html ="<h3>"+response[ligne].Nom+"</h3><p>"+response[ligne].Description+"</p><center><img width = '100%' src='"+response[ligne].Path+"'></center>";
			let popup = L.popup({keepInView:true,closeButton:true}).setContent(html);
			
			endroit.bindPopup(popup);
		}
    	})
	});
