class ArticleDecorator < ApplicationDecorator
  delegate :id, :title, :content, :user_full_name, :user_id

  def published_at
    "Published at #{object.created_at.to_s(:short)}"
  end
end
