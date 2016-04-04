class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :author_name

  def author_name
    object.user.full_name
  end
end
