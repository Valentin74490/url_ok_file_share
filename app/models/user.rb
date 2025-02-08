class User < ApplicationRecord
  has_many :landing_pages
  has_one_attached :photo


  validates :name, presence: true  # Ce champ est obligatoire
  validates :firstname, presence: true  # Ce champ est obligatoire

  # Les champs ci-dessous sont facultatifs grâce à `allow_blank: true`
  validates :phone, format: { with: /\A\d{10}\z/, message: "doit contenir 10 chiffres" }, allow_blank: true
  validates :linkedin_url, format: { with: URI::regexp(%w[http https]) }, allow_blank: true
  validates :facebook_url, format: { with: URI::regexp(%w[http https]) }, allow_blank: true
end
