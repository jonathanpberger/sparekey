class MainController < ApplicationController
  before_filter :require_user

  require 'openssl'
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

  require 'open-uri'
  
  def index
#    load_facebook_feed
    
    unless (! params[:user_friend_location] || params[:user_friend_location].empty?)
      @postings = Artifact.find_by_sql ["SELECT artifacts.* FROM artifacts, friends, locations "+
                                        "WHERE artifacts.friend_id = friends.id "+
                                        "AND friends.user_id = ? "+
                                        "AND artifacts.location_id = locations.id "+
                                        "AND locations.location_name = ?", 
                                        @current_user.id, 
                                        params[:user_friend_location] ]
    else
      @postings = @current_user.artifacts.all
    end
  end
  

  protected
  
  # load the current user's news feed from the Facebook Graph API
  # remove all entries that don't have anything to do with travel
  # for all entries that have to do with travel, ensure that the friend is loaded
  # for the friend, ensure that their location exists, and save the location
  # save the friend
  # save the entry as a travel 'artifact' posting
  def load_facebook_feed

    # load the current user's news feed from the Facebook Graph API

    # hardcode token for now
    token = "2227470867|2.TkZn6HxO6Xj6qCpKN02AWA__.3600.1276452000-218639|C8HLfX6cDxa3nGCRB5HTznnpyKA."
     
    url = "https://graph.facebook.com/me/home?limit=200&access_token=#{token}"
    buffer = open(URI.encode(url), "UserAgent" => "Ruby-Wget").read
    result = ActiveSupport::JSON.decode(buffer)
    items = result['data']
    # logger.debug("load_facebook_feed: items is [#{items.inspect}]")
    
    # remove all entries that don't have anything to do with travel
    # filtered_items = filter_facebook_feed(items)
    
    # create dummy filtered items in lieu of filtered hash coming back
    filtered_items = [{"from"=>{"name"=>"Lee Jones", "id"=>"408"}, "id"=>"671290026_131088470242747", "created_time"=>"2010-06-13T12:20:56+0000", "type"=>"status", "updated_time"=>"2010-06-13T12:20:56+0000", "message"=>"Day 2: Exhausted.", "likes"=>3}]
    
    filtered_items.each do |f|
      #friend = Friend.find f["from"]["id"] 

      friend_id = f["from"]["id"]
      if Friend.exists? friend_id
        friend = Friend.find friend_id
      else
        url = "https://graph.facebook.com/#{friend_id}?access_token=#{token}"
        logger.debug("load_facebook_feed: friend url is [#{url.inspect}]")
        buffer = open(URI.encode(url), "UserAgent" => "Ruby-Wget").read
        result = ActiveSupport::JSON.decode(buffer)
        logger.debug("load_facebook_feed: result is [#{result.inspect}]")
        
        # for the friend, ensure that their location exists, and save the location
        Loca
        
        
      end
      
    end
    
    
    
    
  end
  

end
