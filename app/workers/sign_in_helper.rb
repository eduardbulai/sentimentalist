class SignInHelper

	@queue = :users_queue

	def self.perform(user_id)
		user = User.find_by_id(user_id)
		TwitterApi.get_twitter_stuff(user)
    #dp - consider using a timestamp - maybe we might want to run this routine again when they sign in after
    # 7 days
    user.resque_complete = true
    #dp - because this is in a job we probably want a save!
    user.save
	end

end
