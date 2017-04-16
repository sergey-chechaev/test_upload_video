class CreateVideoPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :video_posts do |t|
      t.string :title
      t.string :watermark
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
