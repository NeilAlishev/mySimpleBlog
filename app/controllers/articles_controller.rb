class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i(new edit create update destroy)
  before_action :authorize_user!, only: %i(destroy update)

  expose_decorated(:recent_articles, decorator: ArticleDecorator) do
    Article.recent.includes(:user).page(params[:page]).per(5)
  end
  expose_decorated(:article, attributes: :article_attributes)
  expose_decorated(:comments) { article.comments.includes(:user) }

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
end
