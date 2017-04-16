class WatermarkWorker
  include Sidekiq::Worker

  def perform(video_post_id)
    video_post = VideoPost.find_by(id: video_post_id)
    Ffmpeg::WatermarkService.new(video_post).call
  end
end
