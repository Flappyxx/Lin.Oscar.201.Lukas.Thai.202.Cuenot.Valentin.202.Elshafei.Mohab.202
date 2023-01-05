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
    $("#id").text(data.data.Media.id);
}

function handleError(error){
    $("#favori").css("display","none");
    $("div#rep").text("");
    $("img").attr("src","");
    $("#id").text("");
    alert('No result');
    console.error(error);
}

$(document).ready(init)

function init(){
    $("button").click(afficher);

    
    $('input').keypress(function(event){
      var keycode = (event.keyCode ? event.keyCode : event.which);
      if(keycode == '13'){
        afficher();
      }
    });

    //rajouter l'event du bouton favori
}

function afficher(){
    var search = $("input").val();
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

