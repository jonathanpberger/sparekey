class Artifact < ActiveRecord::Base
  belongs_to :friend
  belongs_to :location
end
