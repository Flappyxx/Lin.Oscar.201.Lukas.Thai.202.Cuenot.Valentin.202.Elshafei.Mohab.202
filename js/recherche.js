var query = `
    query($id: Int,$page: Int,$perPage: Int,$search : String){
      Page(page: $page, perPage: $perPage){
        pageInfo{
          total
          currentPage
          lastPage
          hasNextPage
          perPage
        }
        media (id: $id,search: $search, type : ANIME){
          id
          coverImage{
            medium
            large
          }
          title{
            romaji
          }
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
    $("div#rep").text(data.data.Page.media[0].id + " : " + data.data.Page.media[0].title.romaji + "\n"
    + data.data.Page.media[1].id + " : " + data.data.Page.media[1].title.romaji + "\n"
    + data.data.Page.media[2].id + " : " + data.data.Page.media[2].title.romaji + "\n"
    )
    $("img").attr("src",data.data.Page.media[0].coverImage.large)
}

function handleError(error){
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

