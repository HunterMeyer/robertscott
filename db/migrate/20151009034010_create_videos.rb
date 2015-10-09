class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.text :title
      t.text :description
      t.text :thumb_url
      t.text :video_id
      t.integer  :position
      t.datetime :published_at
      t.timestamps
    end
  end
end
