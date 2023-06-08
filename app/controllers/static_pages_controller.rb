require_relative '../../.api_keys.rb'

class StaticPagesController < ApplicationController
  
  def index
    unless params[:user].nil?
      search_for_user_photos
    end
  end
  
  private
  
  def search_for_user_photos
    flickr = Flickr.new $KEY, $SECRET
    id = params[:user][:id]
    photos = flickr.photos.search(:user_id => id, :format => "json")
    @photos_links = []
    photos.each do |photo|
      @photos_links << "https://live.staticflickr.com/#{photo["server"]}/#{photo["id"]}_#{photo["secret"]}.jpg"
    end
  end
end
