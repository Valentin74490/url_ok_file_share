class AddPostPresentationAndLogoToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :user_post, :string
    add_column :users, :user_presentation, :text
    add_column :users, :user_logo, :string
  end
end
