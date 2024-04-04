class ProfileController < ApplicationController
  before_action :authenticate_user!

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params.merge(user_id: current_user.id))
    if @profile.save
      redirect_to @profile
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @profile = current_user.profile    
  end

  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      redirect_to @profile
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @profile = current_user.profile    
  end


  private

  def profile_params
    params.require(:profile).permit(:user_id, :user_name, :about, :location, :avatar)
  end
end
