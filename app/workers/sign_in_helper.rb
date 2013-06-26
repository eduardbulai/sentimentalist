class SignInHelper

  extend Resque::Plugins::Heroku

	@queue = :users_queue

	def self.perform(user_id)
		user = User.find_by_id(user_id)
		TwitterApi.get_twitter_stuff(user)
    user.resque_complete = true
    user.save
	end

end
