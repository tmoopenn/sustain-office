class UsersController < ApplicationController
  skip_before_action :check_profile, only: [:edit, :update]
  def show
      id = params[:id]
      @user = User.find(id)
      @signed_in = current_user.id == @user.id.to_i
  end

  def edit
    id = params[:id]

    if current_user.id != id.to_i
      flash[:notice] = "You cannot edit some one else's profile!"
      redirect_to action: "show", id: id
    end
    @user = User.find(id)
    @classifications = [["Student", "Student"], ["Faculty", "Faculty"], ["Staff", "Staff"]]
  end

  def leaderboard
    @champions = User.rank1
    @advocates = User.rank2
    @associates = User.rank3
  end

  def contact
  end

  def index
    @users = User.all
  end

  def update
    id = params[:id]
    @user = User.find(id)

    if current_user.id == id.to_i || current_user.admin
      @user.update create_update_params
      if @user.save
        flash[:notice] = "#{@user.name} has been updated"
        redirect_to user_path @user
      else
        flash[:error] = "Error updating user"
        redirect_to edit_user_path(@user)
      end
    end
  end

  private
  def create_update_params
    params.require(:user).permit(:name, :classification, :admin, :image)
  end
end
