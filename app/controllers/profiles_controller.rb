class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
    @user = @profile.user
  end

  def new
    @profile = Profile.new # Needed to instantiate the form_with
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    if @profile.save
      redirect_to @profile, notice: 'Profile was successfully created.'
    else
      render :new
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:boyfriendname, photos: [])
  end
end
