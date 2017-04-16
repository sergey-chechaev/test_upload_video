class AddAttachmentVideoToVideoPosts < ActiveRecord::Migration
  def self.up
    change_table :video_posts do |t|
      t.attachment :video
    end
  end

  def self.down
    remove_attachment :video_posts, :video
  end
end
