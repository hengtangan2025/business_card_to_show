class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.where(phone_num: params[:session][:phone_num]).first
    if user && user.authenticate(params[:session][:password])
      sign_in :user, user
      redirect_to "/users/#{user.id}", notice: 'login successfully'
    else
      flash[:danger] = 'Invalid email/password combination' # 不完全正确
      render 'new'
    end
  end

  def destroy
    sign_out if user_signed_in?
    redirect_to '/login'
  end
end
