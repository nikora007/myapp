class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_profile, only: [:show, :edit, :update]

  def show

  end #show

  def new
    #カレントユーザーが存在していたら
    return redirect_to edit_profile_path(current_user.profile) if current_user.profile.present?
    @profile = Profile.new
  end #new

  def edit
  end #edit

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save!
      redirect_to root_path, notice: "プロフィール情報の登録が完了しました"
    else
      render :new
    end #@profile
  end #create

  def update
    if @profile = Profile.new(profile_params)
      @profile = Profile.update(profile_params)
      redirect_to root_path, notice: "プロフィール情報の更新が完了しました"
    else
      render :edit
    end #@profile
  end #update

  def destroy
  end #destroy

  private

  def find_profile
    @profile = Profile.find(params[:id])
  end #find_profile

  def profile_params
    params.require(:profile).permit(
      :name, :learning_history, :purpose, :image
    )
  end #profiles_params





end #class ProfilesController
