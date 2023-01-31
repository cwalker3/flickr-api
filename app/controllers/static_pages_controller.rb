class StaticPagesController < ApplicationController
  def index
    @flickr = Flickr.new Figaro.env.flickr_api_key, Figaro.env.flickr_shared_secret

    return unless params[:id]

    @photos = @flickr.photos.search(user_id: params[:id]).to_a
  end
end
