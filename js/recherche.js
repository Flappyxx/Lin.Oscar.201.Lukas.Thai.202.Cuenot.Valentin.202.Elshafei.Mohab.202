var query = `
    query($search : String){
        Media (search: $search, type : ANIME){
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
    $("div#rep").text(data.data.Media.title.romaji);
    $("img").attr("src",data.data.Media.coverImage.large);
    $("#favori").css("display","block");
    $("#id").attr("value",data.data.Media.id);
}

function handleError(error){
    $("#favori").css("display","none");
    $("div#rep").text("");
    $("img").attr("src","");
    $("#id").val("");
    alert('No result');
    console.error(error);
}

$(document).ready(init)

function init(){
    $("button#rechercher").click(afficher);

    $("button#favori").click(favori);
    
    $('input').keypress(function(event){
      var keycode = (event.keyCode ? event.keyCode : event.which);
      if(keycode == '13'){
        afficher();
      }
    });

    //rajouter l'event du bouton favori
}

function afficher(){
    var search = $("input#recherche").val();
    var variables = {
        search: search
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

function favori(){
    let idAnime = $("#id").val();
    let data = {id : idAnime}
    $.ajax({
        //L'URL de la requête 
        url: "putFavAnime.php",

        data: data,

        //La méthode d'envoi (type de requête)
        method: "POST"
    
    })
}