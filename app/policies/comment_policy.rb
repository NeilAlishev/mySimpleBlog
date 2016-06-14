class CommentPolicy < ApplicationPolicy
  def manage?
    record.user == user
  end
end
