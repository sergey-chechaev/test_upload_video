class VideoPost < ApplicationRecord
  has_attached_file :video, styles: {
    medium: {
      geometry: '640x480',
      format: 'mp4'
    },
    thumb: { geometry: '160x120', format: 'jpeg', time: 10 }
  }, processors: [:transcoder]
  validates_attachment_content_type :video, content_type: %r{\Avideo\/.*\Z}

  has_attached_file :watered_video, styles: {
    medium: {
      geometry: '640x480',
      format: 'mp4'
    },
    thumb: { geometry: '160x120', format: 'jpeg', time: 10 }
  }, processors: [:transcoder]
  validates_attachment_content_type :video, content_type: %r{\Avideo\/.*\Z}

  STATUS = { not_tagged: 0, tagged: 1, fail: 2 }.freeze

  def video_path=(val)
    @video_path = val
  end
end
