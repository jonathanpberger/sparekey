class Location < ActiveRecord::Base
  has_many :users
  has_many :friends
  has_many :artifacts

  def self.contains_location
    
  end
end
