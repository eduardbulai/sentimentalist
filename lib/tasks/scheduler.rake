desc "tasks for Heroku scheduler"

task :sentimentalist_update => :environment do
  users = User.all
  users.each do |user|
    Resque.enqueue(BayesianClassificationUpdater, user.id)
    Resque.enqueue(TweetUpdater, user.id)
  end
end
