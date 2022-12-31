class UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users
    end
    
    def create
        @user = User.new(user_params)

        if @user.valid?
            @token = issue_token(@user)
            @user.save
            render json: { user: UserSerializer.new(user), jwt: @token }
        else
            if @user.errors.messages
                render json: { error: @user.errors.messages }
            else
                render json: { error: "User could not be created, please try again." }
            end 
        end 
    end

    def show
        if logged_in?
            render json: current_user
        else
            render json: { error: "User is not logged in/could not be found." }
        end
    end
    
    private

    def user_params
        params.require(:user).permit(:username, :name, :email, :password)
    end
end
