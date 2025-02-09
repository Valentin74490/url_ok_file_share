class AddCompanyAndEmailToUsers < ActiveRecord::Migration[7.2]
  def change
    unless column_exists?(:users, :user_company)
      add_column :users, :user_company, :string
    end

    unless column_exists?(:users, :user_email)
      add_column :users, :user_email, :string
    end
  end
end
