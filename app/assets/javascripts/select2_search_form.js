$(".search-form").select2({
  ajax: {
    url: "/article_search",
    method: "GET",
    dataType: "json",
    delay: 0,
    data: function (params) {
      return {
        q: params.term,
      };
    },
    processResults: function (data) {
      return {
        results: data,
      };
    },
    cache: true
  },
  escapeMarkup: function (markup) { return markup; },
  minimumInputLength: 2,
  templateResult: formatResult
}).on("change", function(e) {
        window.location = e.choice.url;
     });

function formatResult(article) {
  if(!article.loading){
  var markup = "<a href='/articles/"+article.id+"' class='select2-result-link'>"
     + article.title + "<b> author: </b>" + article.author_name + "</a>"
  return markup;}
}
