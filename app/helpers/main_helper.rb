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
 
  def self.verify_friend posting
    friend = Friend.find_or_create_by_social_network_handle posting['from']['name']
    friend.save
    friend_info = get_friend_from_facebook(posting['from']['id'])
    if friend_info['location'] && friend_info['location']['name']
      location = Location.find_or_create_by_location_name(friend_info['location']['name'])
      location.save
    end
    new_location = Location.find_by_location_name(friend_info['location']['name'])
  end
  
  def self.get_friend_from_facebook id

  end

  def self.create_artifact_from_posting
    
  end
end
