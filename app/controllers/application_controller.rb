class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_by_resource
  before_filter :create_video

  protected

  def layout_by_resource
    if devise_controller?
      'devise'
    else
      'application'
    end
  end

  def create_video
    @video = Video.new
  end
end