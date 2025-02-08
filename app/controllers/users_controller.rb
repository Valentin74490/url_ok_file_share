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

  private

  def user_params
    params.require(:user).permit(:name, :firstname, :photo)
  end

  def create_landing_page(user)
    unique_token = SecureRandom.hex(10) # Génère un token unique
    landing_url = unique_token

    LandingPage.create(user: user, landing_url: landing_url)
  end
end
