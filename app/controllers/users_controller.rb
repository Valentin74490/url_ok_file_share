class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      create_landing_page(@user)  # Associe une landing page après la création de l'utilisateur
      redirect_to user_path(@user), notice: 'Utilisateur et landing page créés avec succès.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end


  def whatsapp_field(url)
    return "" unless url.present?

    # Nettoyage pour enlever les espaces et ajouter l'indicatif si nécessaire
    international_number = url.gsub(/\D/, '').sub(/^0/, '33')
    "URL;TYPE=WhatsApp:https://wa.me/#{international_number}"
  end


   def download_vcard
    user = User.find(params[:id])

    vcard = <<~VCARD
      BEGIN:VCARD
      VERSION:3.0
      N:#{user.name};#{user.firstname}
      FN:#{user.firstname} #{user.name}
      #{format_company(user)}
      #{format_title(user)}
      TEL;TYPE=WORK,VOICE:#{user.phone}
      #{format_email(user)}
      ADR:;;#{user.address}
      #{linkedin_field(user.linkedin_url)}
      #{facebook_field(user.facebook_url)}
      #{whatsapp_field(user.whatsapp_url)}
      #{attach_photo(user)}
      END:VCARD
    VCARD

    send_data vcard, filename: "#{user.firstname}_#{user.name}.vcf", type: 'text/vcard'
  end




  private

  def user_params
    params.require(:user).permit(:name, :firstname, :photo, :phone, :linkedin_url,
                                 :facebook_url, :whatsapp_url, :fiche_contact_url,
                                 :address, :user_company, :user_email)
  end


  def create_landing_page(user)
    unique_token = SecureRandom.hex(10) # Génère un token unique
    landing_url = unique_token

    LandingPage.create(user: user, landing_url: landing_url)
  end

  def linkedin_field(url)
    return "" unless url.present?
    "URL;TYPE=LinkedIn:#{url}"
  end

  def facebook_field(url)
    return "" unless url.present?
    "URL;TYPE=Facebook:#{url}"
  end

  def whatsapp_field(url)
    return "" unless url.present?
    "URL;TYPE=WhatsApp:#{url}"
  end

  def attach_photo(user)
    return "" unless user.photo.attached?

    photo_data = Base64.strict_encode64(user.photo.download)
    "PHOTO;ENCODING=b;TYPE=JPEG:#{photo_data}"
  end

  def format_company(user)
    user.user_company.present? ? "ORG:#{user.user_company}" : ""
  end

  def format_title(user)
    user.respond_to?(:job_title) && user.job_title.present? ? "TITLE:#{user.job_title}" : ""
  end

  def format_email(user)
    user.user_email.present? ? "EMAIL:#{user.user_email}" : ""
  end
end
