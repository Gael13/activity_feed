class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Name or password is invalid"
      render "new"
    end
  end

  def destroy
    sessions[:user_id] = nil
    redirect-to root_url, notice: "Logged out!"
  end        	
end
