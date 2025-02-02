class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :firstname
      t.string :password
      t.string :phone
      t.string :linkedin_url
      t.string :facebook_url
      t.string :whatsapp_url
      t.string :image_user
      t.string :fiche_contact_url
      t.string :address

      t.timestamps
    end
  end
end
