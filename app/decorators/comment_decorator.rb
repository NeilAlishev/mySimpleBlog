class CommentDecorator < ApplicationDecorator
  delegate_all

  def published_at
    "Published at #{object.created_at.to_s(:short)}"
  end
end
