class TravelPostsFilterTest < Test::Unit::TestCase

  def setup
    @non_travel_related = {"from"=>{"name"=>"Lee Jones", "id"=>"671290026"}, "id"=>"671290026_131088470242747", "created_time"=>"2010-06-13T12:20:56+0000", "type"=>"status", "updated_time"=>"2010-06-13T12:20:56+0000", "message"=>"Day 2: Exhausted.", "likes"=>3}
    @travel_related = {"from"=>{"name"=>"Sam Smith", "id"=>"671290024"}, "id"=>"671290026_131043270242747", "created_time"=>"2010-06-12T13:20:56+0000", "type"=>"status", "updated_time"=>"2010-06-12T13:20:56+0000", "message"=>"Going to Paris", "likes"=>5}
  end

  def test_filtering_facebook_feed_for_news_related_posts
    newsfeed = []
    newsfeed.push(@non_travel_related)
    newsfeed.push(@travel_related)
    result = TravelPostsFilter.new.filter_facebook_feed(newsfeed)
    assert ! result.include?(@non_travel_related)
    assert result.include?(@travel_related)
  end
  
  def test_filter
    
  end
  
end