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
  
end
