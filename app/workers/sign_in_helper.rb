class SignInHelper
	@queue = :users_queue

	def self.perform(user_id)
		user = User.find_by_id(user_id)
		TwitterApi.get_twitter_stuff(user)
	end

end