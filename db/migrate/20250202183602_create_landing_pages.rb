class CreateLandingPages < ActiveRecord::Migration[7.2]
  def change
    create_table :landing_pages do |t|
      t.references :user, null: false, foreign_key: true
      t.string :landing_url

      t.timestamps
    end
  end
end
