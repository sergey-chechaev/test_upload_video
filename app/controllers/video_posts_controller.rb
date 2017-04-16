class VideoPostsController < ApplicationController
  before_action :set_video_post, only: [:show, :edit, :update, :destroy]

  # GET /video_posts
  # GET /video_posts.json
  def index
    @video_posts = VideoPost.all
  end

  # GET /video_posts/1
  # GET /video_posts/1.json
  def show
  end

  # GET /video_posts/new
  def new
    @video_post = VideoPost.new
  end

  # GET /video_posts/1/edit
  def edit
  end

  # POST /video_posts
  # POST /video_posts.json
  def create

    @video_post = VideoPost.new(video_post_params)

    respond_to do |format|
      if @video_post.save
				OriginLoadWorker.perform_async(@video_post.id, video_post_params["video_path"].tempfile.path)
        format.html { redirect_to @video_post, notice: 'Video post was successfully created.' }
        format.json { render :show, status: :created, location: @video_post }
      else
        format.html { render :new }
        format.json { render json: @video_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /video_posts/1
  # PATCH/PUT /video_posts/1.json
  def update
    respond_to do |format|
      if @video_post.update(video_post_params)
				WatermarkWorker.perform_async(@video_post.id)
        format.html { redirect_to @video_post, notice: 'Video post was successfully updated.' }
        format.json { render :show, status: :ok, location: @video_post }
      else
        format.html { render :edit }
        format.json { render json: @video_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /video_posts/1
  # DELETE /video_posts/1.json
  def destroy
    @video_post.destroy
    respond_to do |format|
      format.html { redirect_to video_posts_url, notice: 'Video post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video_post
      @video_post = VideoPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_post_params
      params.require(:video_post).permit(:title, :watermark, :video_path)
      # require 'pry'; binding.pry
    end
end
