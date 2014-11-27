class SessionsController < ApplicationController
  def omni
    # Login with google / twitter
    user = User.from_omniauth(env["omniauth.auth"]) 
    # binding.pry
    session[:user_id] = user.id
    redirect_to root_path
  end

  def create
  	    # login with normal means
    	user =  User.where(:username => params[:username]).first
		if user.present? && (user.authenticate params[:password]) 
			session[:user_id] = user.id
			redirect_to user_path(user)
		else
			redirect_to login_path
		end
	end


  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end