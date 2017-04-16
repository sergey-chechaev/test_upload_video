module Ffmpeg
  class OriginLoadService
    def initialize(video_post, path = nil)
      @video_post = video_post
      @path = path || @video_post.video.path
    end

    def call
      @video_post.video = File.new(@path, 'r')
      @video_post.watered_video = File.new(@path, 'r')
      @video_post.save
      @video_post
    end
  end
end
