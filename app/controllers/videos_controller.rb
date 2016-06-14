class VideosController < ApplicationController
  before_action :authenticate_user!

  # All published videos
  def index
    @videos = Video.where(published: 1)
  end

  def show
    if params[:id]
      @video = Video.find_by(id: params[:id])
    end
  end

  def new
    @video = Video.new
  end

  def edit
  end

  def create
    @video = Video.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to :back, notice: 'Video was successfully created.' }

      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # Likes video, increment likes count
  def like
    @video.like!
  end

  # Dislikes video, increment likes count
  def dislike
    @video.dislike!
  end

  private


  def video_params
    params.require(:video).permit(:video_file, :name, :user_id)
  end
end