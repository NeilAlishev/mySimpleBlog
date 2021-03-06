class ArticlesController < ApplicationController
  respond_to :js, only: :index

  before_action :authenticate_user!, only: %i(new edit create update destroy)
  before_action :authorize_user!, only: %i(destroy update)

  expose_decorated(:articles) { scoped_articles }
  expose_decorated(:article, attributes: :article_attributes)

  expose_decorated(:comments) { article.comments.includes(:user) }

  def index
    respond_with articles
  end

  def create
    article.user = current_user
    article.save

    respond_with(article)
  end

  def update
    article.save
    respond_with(article)
  end

  def destroy
    article.destroy
    respond_with(article)
  end

  private

  def article_attributes
    params.require(:article).permit(:title, :content)
  end

  def authorize_user!
    authorize(article, :manage?)
  end

  def scoped_articles
    FilteredArticlesQuery.new(filtering_params).all.page(params[:page]).per(5)
  end

  def filtering_params
    params.fetch(:author, {}).permit(:full_name)
  end
end
