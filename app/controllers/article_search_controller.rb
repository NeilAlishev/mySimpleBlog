class ArticleSearchController < ApplicationController
  respond_to :json

  def index
    articles = Article.by_query(params[:q])
    respond_with articles, root: false
  end
end
