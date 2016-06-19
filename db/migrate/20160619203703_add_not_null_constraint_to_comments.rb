class AddNotNullConstraintToComments < ActiveRecord::Migration
  def change
    change_column_null :comments, :content, false
    change_column_null :comments, :article_id, false
    change_column_null :comments, :user_id, false
  end
end
