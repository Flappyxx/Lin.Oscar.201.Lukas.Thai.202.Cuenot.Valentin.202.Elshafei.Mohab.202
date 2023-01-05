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
    //afficher l'anime
}

function handleError(error){
    //Pas d'anime favori
}

$(document).ready(init)

function init(){
    chercher();
}

function chercher(){
    var id = $("input").val();
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
}

