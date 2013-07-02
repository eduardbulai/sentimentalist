module TweetCreator

  def object_in_database(stored_ids, object)
    stored_ids.include?(object.id)
  end

end
