# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb


# db/seeds.rb

# Message avant de supprimer les anciens enregistrements
puts "Suppression des anciens utilisateurs..."

# Supprimer tous les utilisateurs existants
User.destroy_all

# Message avant d'ajouter les nouveaux utilisateurs
puts "Ajout des nouveaux utilisateurs..."

# Création des utilisateurs
User.create!(
  name: "Dupont",
  firstname: "Jean",
  password: "password123",
  phone: "0601020304",
  linkedin_url: "https://www.linkedin.com/in/jeandupont",
  facebook_url: "https://www.facebook.com/jeandupont",
  whatsapp_url: "https://wa.me/0601020304",
  image_user: "https://www.example.com/images/jean.jpg",
  fiche_contact_url: "https://www.example.com/fiche_contact_jean",
  address: "12 rue de Paris, 75001 Paris"
)

User.create!(
  name: "Martin",
  firstname: "Sophie",
  password: "password456",
  phone: "0708091011",
  linkedin_url: "https://www.linkedin.com/in/sophiemartin",
  facebook_url: "https://www.facebook.com/sophiemartin",
  whatsapp_url: "https://wa.me/0708091011",
  image_user: "https://www.example.com/images/sophie.jpg",
  fiche_contact_url: "https://www.example.com/fiche_contact_sophie",
  address: "34 avenue de la République, 75011 Paris"
)

User.create!(
  name: "Durand",
  firstname: "Pierre",
  password: "password789",
  phone: "0809101112",
  linkedin_url: "https://www.linkedin.com/in/pierredurand",
  facebook_url: "https://www.facebook.com/pierredurand",
  whatsapp_url: "https://wa.me/0809101112",
  image_user: "https://www.example.com/images/pierre.jpg",
  fiche_contact_url: "https://www.example.com/fiche_contact_pierre",
  address: "56 boulevard Saint-Germain, 75005 Paris"
)

# Message de confirmation une fois que les utilisateurs sont ajoutés
puts "Seed à jour avec succès !"
