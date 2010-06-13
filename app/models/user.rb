class User < ActiveRecord::Base
  belongs_to :location
  has_many :friends
  has_many :artifacts, :through => :friends
  acts_as_authentic
end
