class Artifact < ActiveRecord::Base
  belongs_to :friend
  belongs_to :location
  
  named_scope :by_location, lambda { |location| { :conditions => ['artifacts.location_id = locations.id AND locations.location_name = ?', location] } }
end
