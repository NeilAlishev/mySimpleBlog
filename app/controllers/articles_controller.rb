class ArticlesController < ApplicationController
  respond_to :html

  expose(:article, attributes: :article_params)
  expose(:articles) { Article.page(params[:page]) }
  expose(:comments) { article.comments }


  def create
    flash[:notice] = 'Article was successfully created.' if article.save
    respond_with(article)
  end

  def update
    flash[:notice] = 'Article was successfully updated.' if article.save
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
    params.require(:article).permit(:title, :content)
  end
end
