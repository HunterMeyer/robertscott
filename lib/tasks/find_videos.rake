task :find_videos => :environment do
  Video.create_from_youtube_videos
end
