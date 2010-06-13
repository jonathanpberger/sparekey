class MainController < ApplicationController
  before_filter :require_user

  require 'openssl'
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

  require 'open-uri'
  
  def index
    #load_facebook_feed
    
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
    filtered_items = filter_facebook_feed items
    
    filtered_items.each do |f|
      verify_friend f
    end
  end

  def filter_facebook_feed data_objects
    filtered_objects = Array.new
    data_objects.each do |posting|
      if contains_travel_reference(posting)
        filtered_objects.push(posting)
      end
    end
    return filtered_objects
  end
  
  def contains_travel_reference posting
    message = posting[:message]
    return true if message =~ /^(is|will\s+be)\s+(going\s+to|traveling\s+to|flying\s+to|taking\s+a\s+train\s+to)\s+[A-Z]/
    return true if message =~ /am\s+(going\s+to|traveling\s+to|flying\s+to|taking\s+a\s+train\s+to)\s+[A-Z]/
  end
 
  def verify_friend posting
    friend = Friend.find_or_create_by_social_network_handle posting['from']['name']
    friend.save
    friend_info = get_friend_from_facebook(posting['from']['id'])
    if friend_info['location'] && friend_info['location']['name']
      location = Location.find_or_create_by_location_name(friend_info['location']['name'])
      location.save
    end
    new_location = Location.find_by_location_name(friend_info['location']['name'])
  end
  
  def get_friend_from_facebook id
    url = "https://graph.facebook.com/#{friend_id}?access_token=#{token}"
    logger.debug("load_facebook_feed: friend url is [#{url.inspect}]")
    buffer = open(URI.encode(url), "UserAgent" => "Ruby-Wget").read
    result = ActiveSupport::JSON.decode(buffer)
    logger.debug("load_facebook_feed: result is [#{result.inspect}]")
  end

  def create_artifact_from_posting
    
  end  

end
