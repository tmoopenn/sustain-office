class UsersController < ApplicationController

    def show
        id = params[:id]
        @user = User.find(id)
    end

    def leaderboard
      @champions = User.rank1
      @advocates = User.rank2
      @associates = User.rank3
    end

    # def create
    #     user = User.new(create_update_params)
    #     if user.save
    #         flash[:notice] = "New user \'#{user.name}\' created"
    #         redirect_to events_path
    #     else
    #         flash[:error] = "Error in creating user"
    #         redirect_to new_user_path
    #     end
    # end
    #
    # private
    # def create_update_params
    #   params.require(:user).permit(:name, :classification)
    # end
end
