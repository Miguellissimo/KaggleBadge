class UsersController < ApplicationController
  attr_accessor :remember_token
  before_action :logged_in_user
  before_action :correct_user
  def create
    @user = User.new(user_params)
    if @user.save
      # do a redirect
      redirect_to @user
    else
      # handle unsuccessful sign up
    end
  end

  def show
    #id = params[:id]
    #if id.to_i > User.count
    #    return
    #  end
    
    @user = User.find(params[:id])
    @new_challenge = Challenge.new
    @challenges = Challenge.where(:user_id => params[:id])
  end  

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in"
        redirect_to root_path
      end
    end

    def correct_user
      id = params[:id]
      if id.to_i > User.count
        redirect_to root_url
        return
      end
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
