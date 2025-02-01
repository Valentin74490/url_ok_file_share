class AddNomToDocuments < ActiveRecord::Migration[7.2]
  def change
    add_column :documents, :nom, :string
  end
end
