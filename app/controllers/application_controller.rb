class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  helper_method :current_user, :logged_in?  
  #↑ヘルパー側でもメソッドが使えるようにしている、引き継ぐアクション名を書かないといけない
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
  
end
