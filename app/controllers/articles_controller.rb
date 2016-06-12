class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i(new edit create update destroy)
  before_action :authorize_user!, only: %i(destroy update)

  expose_decorated(:articles) { Article.all.includes(:user).recent.page(params[:page]).per(5) }
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
