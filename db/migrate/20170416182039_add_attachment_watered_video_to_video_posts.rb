class AddAttachmentWateredVideoToVideoPosts < ActiveRecord::Migration
  def self.up
    change_table :video_posts do |t|
      t.attachment :watered_video
    end
  end

  def self.down
    remove_attachment :video_posts, :watered_video
  end
end
