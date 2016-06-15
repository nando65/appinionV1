class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_filter :check_user_is_active, except: [:login_page]

  before_filter :require_login
  before_filter :create_video


private

  def require_login
    unless current_user || controller_name == 'callbacks'
      #abort controller_name
      redirect_to controller: :login, action: :login_page
    end
  end

   def create_video
    @video = Video.new
  end
end
