Rails.application.routes.draw do
  # Route pour accéder à une landing page via un identifiant unique dans l'URL
  resources :landing_pages, only: [:show], param: :landing_url

  # Routes pour les utilisateurs et autres ressources
  resources :users do
    member do
      get :download_vcard
    end
  end  # <--- Ce 'end' ferme le bloc des utilisateurs

  resources :documents, only: [:new, :create, :show]

  # Root de l'application
  root "users#new"
end
