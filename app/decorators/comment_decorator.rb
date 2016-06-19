class CommentDecorator < ApplicationDecorator
  delegate :id, :content, :article, :user, :user_full_name

  def published_at
    "Published at #{object.created_at.to_s(:short)}"
  end
end
