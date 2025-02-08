class LandingPagesController < ApplicationController
  def show
    @landing_page = LandingPage.find_by(landing_url: params[:landing_url])

    if @landing_page
      @user = @landing_page.user
    else
      redirect_to root_path, alert: "Landing page non trouvée."
    end
  end
end
