class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

 #  	def authenticate
	# 	@current_user = User.find_by(:id => session[:user_id])
	# 	session[:user_id] = nil unless @current_user.present?
	# end

end