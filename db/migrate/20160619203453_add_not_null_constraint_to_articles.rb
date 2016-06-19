class AddNotNullConstraintToArticles < ActiveRecord::Migration
  def change
    change_column_null :articles, :user_id, false
  end
end
