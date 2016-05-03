class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def log_in_user
    find_user = User.find(params[:user_id])
    sign_out if user_signed_in?
    sign_in :user, find_user 
    render :json => {
      current_user_name:find_user.name
      }, :status => 200
  end


  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        sign_in :user, @user
        format.html { redirect_to '/login', notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :phone_num, :password, :password_confirmation)
  end
end