class ArticlePolicy < ApplicationPolicy
  def manage?
    record.user == user
  end
end
