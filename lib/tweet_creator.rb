module TweetCreator

  def object_in_database(stored_ids, object)
    stored_ids.include?(object.id)
  end

  def get_twitter_timeline
    Twitter.user_timeline(self.twitter_handle)
  end

end
