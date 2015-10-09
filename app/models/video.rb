class Video < ActiveRecord::Base
  validates_uniqueness_of :video_id

  def self.create_from_youtube_videos
    YouTube.retrieve_videos.each do |video|
      begin
        create!(title: video.title, 
                description: video.description,
                video_id: video.resourceId['videoId'],
                position: video.position,
                thumb_url: video.thumbnails['medium']['url'],
                published_at: DateTime.parse(video.publishedAt))
      rescue
        next
      end
    end
  end

end
