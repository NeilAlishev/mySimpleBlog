class CommentDecorator < ApplicationDecorator
  delegate_all
  delegate :full_name, to: :user, prefix: :user

  def published_at
    "Published at #{object.created_at.to_s(:short)}"
  end
end
