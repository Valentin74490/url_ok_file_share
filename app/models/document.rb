class Document < ApplicationRecord
  has_one_attached :image

  has_one_attached :file # Active Storage pour gérer les fichiers

  before_create :generate_uuid # Génère un UUID avant la sauvegarde

  def to_param
    uuid # Utiliser UUID à la place de l'ID dans les URLs
  end

  private

  def generate_uuid
    self.uuid = SecureRandom.uuid
  end

end
