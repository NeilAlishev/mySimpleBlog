if <%= !articles.empty? %>
  $(".articles").html "<%= j render articles %>"
  $(".paginator").html "<%= j paginate articles, remote: true %>"
else
  $(".articles").html "No articles were found"
  $(".paginator").empty()
