class User < ActiveRecord::Base
  belongs_to :location
  acts_as_authentic
  
end
