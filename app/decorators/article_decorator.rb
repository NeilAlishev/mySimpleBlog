class ArticleDecorator < ApplicationDecorator
  delegate :id, :title, :content, :user_full_name, :user_avatar,
    :comments_count

  def published_at
    "Published at #{object.created_at.to_s(:short)}"
  end

  def comments_count
    object.comments.count
  end
end
