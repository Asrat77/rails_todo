class UsersController < ApplicationController

    def index
        @users = User.all
        render json: {data: @users, success: true, status: 200}
    end

    'def show
        @users = User.find(params[:id])
        render json: {data: @users, success: true, status: 200}
    
    end
'
    
    def create
        @user = User.new(user_params)
        if @user.save
            render json: {data: @user, success: true, status: 200}
        else
            render json: {data: @user.errors, success: false, status: 400}
        end
    end
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            render json: {data: @user, success: true, status: 200}
        else
            render json: {data: @user.errors, success: false, status: 400}
        end
    end
    
    def destroy
        @user = User.find(params[:id])
        if @user.destroy
            render json: {data: @user, success: true, status: 200}
        else
            render json: {data: @user.errors, success: false, status: 400}
        end
    end
    
        private
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
    
    end
    
    