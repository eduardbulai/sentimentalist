class UserTweet < ActiveRecord::Base
  attr_accessible :text,
    :user_id,
    :tweet_id,
    :emotion,
    :bayesian_emotion,
    :polarity

  belongs_to :user, inverse_of: :user_tweets

  validates_presence_of :text,
    :user_id,
    :tweet_id


    def clean_tweet
      tweet = self.text
      tweet.downcase!
      tweet.gsub!(/((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/, '')
      tweet.gsub!(/(?=\w*h)(?=\w*t)(?=\w*t)(?=\w*p)\w*/, '')
      tweet.gsub!(/\s\s+/,' ')
    end

    def update_emotions(new_emotion)
      self.emotion = new_emotion
      self.bayesian_emotion = new_emotion
    end

end
