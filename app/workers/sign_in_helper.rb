class SignInHelper
	@queue = :users_queue

	def self.perform(user_id)
		user = User.find_by_id(user_id)
		# TwitterApi.get_twitter_stuff(user)
    sleep(5)
    user.resque_complete = true
    user.save
	end

end
