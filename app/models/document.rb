class Document < ApplicationRecord
  has_one_attached :image
  has_one_attached :file # Active Storage pour gérer les fichiers

  before_create :generate_uuid # Génère un UUID avant la sauvegarde

  validates :file, presence: true
  validate :file_must_be_dump

  def to_param
    uuid # Utiliser UUID à la place de l'ID dans les URLs
  end

  private

  def generate_uuid
    self.uuid = SecureRandom.uuid
  end

  def file_must_be_dump
    if file.attached? && !file.content_type.in?(%w(application/octet-stream application/x-dump))
      errors.add(:file, "doit être un fichier .dump")
    end
  end
end
