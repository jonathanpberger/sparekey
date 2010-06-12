class Friend < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  belongs_to :social_networking_site
  has_many :artifacts
end
