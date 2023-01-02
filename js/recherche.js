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
    console.log(data);
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
}

function afficher(){
    var search = $("input").val();
    var variables = {
        page: 1,
        perPage: 3,
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

