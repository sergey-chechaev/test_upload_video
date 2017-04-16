module Ffmpeg
  class WatermarkService
    def initialize(video_post)
      @video_post = video_post
    end

    def call
      system "ffmpeg -i #{@video_post.video.path} -vf \
      drawtext=\"fontfile=public/agreverence-obliquemedium.ttf:
      text='#{@video_post.watermark}': fontcolor=white: fontsize=24: box=1: \
      boxcolor=black@0.5: boxborderw=5: x=(w-text_w)/2: y=(h-text_h)/2\" \
      #{@video_post.watered_video.path} -y"
      @video_post.update(status: VideoPost::STATUS[:tagged])
    rescue => detail
      @video_post.update(status: VideoPost::STATUS[:fail])
      puts detail
    end
  end
end
