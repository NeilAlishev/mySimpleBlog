class FilteredArticlesQuery
  attr_reader :articles
  private :articles

  def initialize(filtering_params, articles = Article.all)
    @articles = articles

    @filtering_params = filtering_params
  end

  def all
    filter_by_author.recent.includes(:user)
  end

  private

  def filter_by_author
    return articles unless @filtering_params.present?

    articles.by_author(@filtering_params[:full_name])
  end
end
