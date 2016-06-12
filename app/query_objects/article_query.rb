class ArticleQuery
  def initialize(relation = Article)
    @relation = relation
  end

  def search(query)
    @relation.where("title ilike ?", "#{query}%").includes(:user)
  end
end
