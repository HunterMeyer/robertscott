class YouTube
  class << self
    def playlist_id
      'UU34xp0_WvobosrCJeBTlmYg'
    end

    def api_key
      ENV['RS_YOUTUBE_KEY']
    end

    def playlist_url(page_token = nil)
      "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&"\
      "playlistId=#{playlist_id}&key=#{api_key}&maxResults=50&pageToken=#{page_token}"
    end

    def get_playlist(page_token = nil)
      HTTParty.get(playlist_url(page_token), verify: false)
    end

    def retrieve_videos
      page_token = ''
      videos     = []
      while page_token != nil do
        response = get_playlist(page_token)
        response['items'].map { |v| videos << OpenStruct.new(v['snippet']) }
        page_token = response['nextPageToken']
      end
      videos
    rescue => ex
      ap "Error retrieving videos: #{ex.message}"
    end
  end
end
