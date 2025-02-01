class AddUuidToDocuments < ActiveRecord::Migration[7.2]
  def change
    add_column :documents, :uuid, :string # Ajoute la colonne uuid
    add_index :documents, :uuid, unique: true # Ajoute un index unique
  end
end
