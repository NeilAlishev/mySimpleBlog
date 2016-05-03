class AddNotNullConstraintsToArticle < ActiveRecord::Migration
  def change
    change_column :articles, :title, :string, null: false
    change_column :articles, :content, :text, null: false
  end
end
