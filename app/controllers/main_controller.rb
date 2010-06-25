class MainController < ApplicationController
  before_filter :require_user, :only  => :index

  require 'open-uri'
  require 'travel_posts_filter'
  require 'openssl'
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
  
  # hardcode token for now
  def facebook_token
    "2227470867|2.5667SG_L0Cniv1E2ThhrOQ__.3600.1277514000-699493134|cGcDN8uwY2Gwuwg-OGTrmbqUkwQ."
  end

  def index
    load_facebook_feed
    sql_start = "SELECT artifacts.* FROM artifacts, friends "
    sql_end =   " WHERE artifacts.friend_id = friends.id"+
                " AND friends.user_id = ? "
                             
    query_params = [@current_user.id]
    #This is really for searching posts by the place where friends live, not by the place names
    #in the content of their posts. The homepage is misleading (and so is the dummy data).
    if(params[:user_friend_location] && ! params[:user_friend_location].empty?)
      sql_start << ", locations"
      sql_end << "AND artifacts.location_id = locations.id "+
                 "AND locations.location_name LIKE ?"
      query_params << params[:user_friend_location] + '%'
    end
    
    #Add to SQL again if params for start date and end date come in
    
    @postings = Artifact.find_by_sql [sql_start + sql_end, *query_params]
  end
  
  private
  def load_facebook_feed

    # load the current user's news feed from the Facebook Graph API
    url = "https://graph.facebook.com/me/home?limit=200&access_token=#{facebook_token}"
    begin 
      buffer = open(URI.encode(url), "UserAgent" => "Ruby-Wget").read
    rescue
      return
    end
    result = ActiveSupport::JSON.decode(buffer)
    items = result['data']

    # remove all entries that don't have anything to do with travel
    filter = TravelPostsFilter.new
    filtered_items = filter.filter_facebook_feed items
    
    #Limit this to deleting the ones for this user
    Artifact.delete_all
    filtered_items.each do |posting|
      friend = verify_friend posting # ensure that the friend is loaded
      create_artifact_from_posting(friend, posting)
    end
  end
 
  def verify_friend posting
    friend = Friend.find_or_create_by_social_network_handle posting['from']['name']
    friend.save
    friend_info = get_friend_from_facebook(posting['from']['id'])
    begin
      if friend_info['location'] && friend_info['location']['name']
        location = Location.find_or_create_by_location_name(friend_info['location']['name'])
        location.save
        location.reload
        friend.location = location
        friend.save
      end
    rescue
    end
    friend.reload
    return friend
  end
  
  def get_friend_from_facebook id
    url = "https://graph.facebook.com/#{id}?access_token=#{facebook_token}"
    logger.debug("load_facebook_feed: friend url is [#{url.inspect}]")
    buffer = open(URI.encode(url), "UserAgent" => "Ruby-Wget").read
    result = ActiveSupport::JSON.decode(buffer)
    logger.debug("load_facebook_feed: result is [#{result.inspect}]")
  end

# Sample post data from Facebook:
#   @post = {"from"=>{"name"=> arg1, "id"=>"671290026"}, "id"=>"671290026_131088470242747", "created_time"=>"2010-06-13T12:20:56+0000", "type"=>"status", "updated_time"=>"2010-06-13T12:20:56+0000", "message"=>"Day 2: Exhausted.", "likes"=>3}
 
  def create_artifact_from_posting(friend, posting)
    artifact = Artifact.create( :when_posted => '',
                     :location => friend.location,
                     :content => posting['message'],
                     :friend => friend)
    artifact.save
    artifact.reload
    return artifact
  end

end
