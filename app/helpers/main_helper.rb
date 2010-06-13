module MainHelper
  
  def self.filter_facebook_feed data_objects
    
    filtered_objects = Array.new
    data_objects.each do |posting|
      if contains_travel_reference(posting)
        filtered_objects.push(posting)
      end
    end
    return filtered_objects
  end
  
  def self.contains_travel_reference posting
    message = posting[:message]
    return true if message =~ /^(is|will\s+be)\s+(going\s+to|traveling\s+to|flying\s+to|taking\s+a\s+train\s+to)\s+[A-Z]/
    return true if message =~ /am\s+(going\s+to|traveling\s+to|flying\s+to|taking\s+a\s+train\s+to)\s+[A-Z]/
  end
  
  # load the current user's news feed from the Facebook Graph API
  # remove all entries that don't have anything to do with travel
  # for all entries that have to do with travel, ensure that the friend is loaded
  # for the friend, ensure that their location exists, and save the location
  # save the friend
  # save the entry as a travel 'artifact' posting
  def self.load_facebook_feed

    # load the current user's news feed from the Facebook Graph API

    # hardcode token for now
    token = "2227470867|2.t5FrOE91aDHzk3ETfHW2SQ__.3600.1276444800-218639|WDefUjL5HsE4tKdMbG5cCY_xk7Q."
     
    url = "https://graph.facebook.com/me/home?limit=200&access_token=#{token}"
    buffer = open(URI.encode(url), "UserAgent" => "Ruby-Wget").read
    result = ActiveSupport::JSON.decode(buffer)
    items = result['data']
    logger.debug("load_facebook_feed: items is [#{items.inspect}]")
    
    # remove all entries that don't have anything to do with travel
    # filtered_items = filter_facebook_feed(items)
    
    # create dummy filtered items in lieu of filtered hash coming back
    filtered_items = [{"from"=>{"name"=>"Lee Jones", "id"=>"671290026"}, "id"=>"671290026_131088470242747", "created_time"=>"2010-06-13T12:20:56+0000", "type"=>"status", "updated_time"=>"2010-06-13T12:20:56+0000", "message"=>"Day 2: Exhausted.", "likes"=>3}]
    
    filtered_items do |f|
      friend = Friend.find f["from"]["id"] 
      if friend.nil?
        url = "https://graph.facebook.com/me/home?limit=200&access_token=#{token}"
        
      end
      
    end
    
    
    
    
  end  
  
end
