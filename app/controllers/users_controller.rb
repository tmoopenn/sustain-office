class UsersController < ApplicationController
    
    def create
        user = User.new(create_update_params)
        if user.save
            flash[:notice] = "New user \'#{user.first} #{user.last}\' created"
            redirect_to events_path
        else
            flash[:error] = "Error in creating user"
            redirect_to new_user_path
    end

private
  def create_update_params
      params.require(:user).permit(:first, :last, :classification)
  end
end
