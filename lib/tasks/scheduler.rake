desc "tasks for Heroku scheduler"

task :sentimentalist_update => :environment do
  Resque.enqueue(UpBayesianClassificationUpdaterdate, current_user.id)
  Resque.enqueue(UpBayesianClassificationUpdaterdate, current_user.id)
end
