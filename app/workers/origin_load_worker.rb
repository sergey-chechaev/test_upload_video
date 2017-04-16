class OriginLoadWorker
  include Sidekiq::Worker

  def perform(video_post_id, path)
    video_post = VideoPost.find_by(id: video_post_id)
    obj = Ffmpeg::OriginLoadService.new(video_post, path).call
    WatermarkWorker.perform_async(obj.id)
  end
end
