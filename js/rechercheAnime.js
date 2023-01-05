var query = `
    query($id : Int){
        Media (id: $id, type : ANIME){
          id
          coverImage{
            large
          }
          title{
            romaji
        }
      }
    }
`;


function handleResponse(response){
    return response.json().then(function (json) {
        return response.ok ? json :Promise.reject(json);
    })
}

function handleData(data){
    $("p#nom").text(data.data.Media.title.romaji);
    $("img").attr("src",data.data.Media.coverImage.large);
}

function handleError(error){
    //Pas d'anime favori
}

$(document).ready(init)

function init(){
    chercher();
}

function chercher(){
     //chercher l'id depuis la BD
    $.ajax({
        //L'URL de la requête 
        url: "getFavAnime.php",

        //La méthode d'envoi (type de requête)
        method: "GET",
    dataType:"json"
    
    })
    //Ce code sera exécuté en cas de succès - La réponse du serveur est passée à done()
    /*On peut par exemple convertir cette réponse en chaine JSON et insérer
     * cette chaine dans un div id="res"*/
    .done(function(response){
        let id = response.IdAnimeFav;
        var variables = {
            id: id
        };
    
        var url = 'https://graphql.anilist.co',
        options = {
        method: 'POST',
        headers: {
            'Content-Type' : 'application/json',
            'Accept' : 'application/json',
        },
        body : JSON.stringify({
            query: query,
            variables: variables
        })
        };
    
        fetch (url,options).then(handleResponse)
                        .then(handleData)
                        .catch(handleError);
    })
    
}

