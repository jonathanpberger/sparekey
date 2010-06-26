class TravelPostsFilter
  def filter_facebook_feed data_objects
    filtered_objects = Array.new
    data_objects.each do |posting|
      if contains_travel_reference?(posting['message'])
        filtered_objects.push(posting)
      end
    end
    return filtered_objects
  end
  
  def contains_travel_reference? posting
    return true if message =~ /(going\s+to|traveling\s+to|flying\s+to|taking\s+a\s+train\s+to)\s+[A-Z].*/i
    return true if message =~ /(going\s+to|traveling\s+to|flying\s+to|taking\s+a\s+train\s+to)\s+[A-Z].*/i
    return true if message =~ /(am|is|will\s+be)\s+(planning\s+a\s+trip\s+to|taking\s+a\s+trip\s+to|going\s+on\s+a\s+trip\s+to)\s+[A-Z].*/i
    return true if message =~ /can\'t\s+wait\s+to\s+go\+sto\s+.*/i
    return true if message =~ /headed\+sto\s+.*/i
    return true if message =~ /planning\s+to\s+go\+sto\s+.*/i
  end
end