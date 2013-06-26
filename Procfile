web: bundle exec rails server thin -p $PORT
worker: QUEUE='*' bundle exec rake resque:work --trace
scheduler: bundle exec rake resque:scheduler


