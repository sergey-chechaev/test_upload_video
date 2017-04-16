json.extract! video_post, :id, :title, :watermark, :created_at, :updated_at
json.url video_post_url(video_post, format: :json)
