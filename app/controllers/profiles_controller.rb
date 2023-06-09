class ProfilesController < ApplicationController
  def index
    @profiles = policy_scope(Profile)
    @profiles = Profile.all
    if params[:query].present?
      sql_subquery = "boyfriendname ILIKE :query OR location ILIKE :query"
      @profiles = @profiles.where(sql_subquery, query: "%#{params[:query]}%")
    end
    # The `geocoded` scope filters only flats with coordinates
    @markers = @profiles.geocoded.map do |profile|
      {
        lat: profile.latitude,
        lng: profile.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {profile: profile})
      }
    end
  end

  def show
    @profile = Profile.find(params[:id])
    authorize @profile
    @user = @profile.user
  end

  def new
    @profile = Profile.new # Needed to instantiate the form_with
    authorize @profile
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    @profile.location = profile_params[:location]
    authorize @profile

    if @profile.save
      redirect_to @profile, notice: 'Profile was successfully created.'
    else
      render :new
    end
  end

  def edit
    @profile = Profile.find(params[:id])
    authorize @profile
  end

  def update
    @profile = Profile.find(params[:id])
    authorize @profile
    if @profile.update(profile_params)
      redirect_to @profile, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    authorize @profile

    @profile.destroy

    redirect_to profiles_path, status: :see_other
  end

  private

  def profile_params
    params.require(:profile).permit(:boyfriendname, :location, :age, :description, photos: [])
  end
end
