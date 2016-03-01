class AddUniqueIndexToFullName < ActiveRecord::Migration
  def change
    add_index :users, :full_name, unique: true
  end
end
