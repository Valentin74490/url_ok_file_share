class RemoveImageUserFromUsers < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :image_user, :string
  end
end
