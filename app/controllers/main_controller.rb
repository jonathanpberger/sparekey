class MainController < ApplicationController
  before_filter :require_user
  
  def index
    unless (! params[:user_friend_location] || params[:user_friend_location].empty?)
      @postings = Artifact.find_by_sql ["SELECT artifacts.* FROM artifacts, friends, locations "+
                                        "WHERE artifacts.friend_id = friends.id "+
                                        "AND friends.user_id = ? "+
                                        "AND artifacts.location_id = locations.id "+
                                        "AND locations.location_name = ?", 
                                        @current_user.id, 
                                        params[:user_friend_location] ]
    else
      @postings = @current_user.artifacts.all
    end
  end

end
