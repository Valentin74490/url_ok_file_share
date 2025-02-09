class AddCompanyAndEmailToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :user_company, :string
    add_column :users, :user_email, :string
  end
end
