class HomeController < ApplicationController

  def index
    @videos = Video.all.order(published_at: :desc)
  end

end
