class ArticlesController < ApplicationController
  respond_to :html
  respond_to :json, only: :index
  before_action :authenticate_user!, except: %i(show, index)
  before_action :authorize_user!, only: %i(destroy update)

  expose_decorated(:article, attributes: :article_params)
  expose(:comments) { article.comments.includes(:user) }

  def index
    return unless params[:q]
    articles = Article.where("LOWER(title) ~ ?", "^#{params[:q].downcase}.*").includes(:user)
    respond_with(articles, total_count: articles.size)
  end

  def create
    flash[:notice] = "Article was successfully created." if article.save
    respond_with(article)
  end

  def update
    flash[:notice] = "Article was successfully updated." if article.save
    respond_with(article)
  end

  def show
  end

  def destroy
    article.destroy
    respond_with(article)
  end

  private

  def article_params
    params.require(:article).permit(:title, :content).merge(user_id: current_user.id)
  end

  def authorize_user!
    authorize(article, :manage?)
  end
end
