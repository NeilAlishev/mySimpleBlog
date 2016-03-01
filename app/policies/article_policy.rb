class ArticlePolicy
  def initialize(user, article)
    @user = user
    @article = article
  end

  def manage?
    @article.user == @user
  end
end
