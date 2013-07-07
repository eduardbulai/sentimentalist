class UserTweet < ActiveRecord::Base
  attr_accessible :text,
    :user_id,
    :tweet_id,
    :emotion,
    :bayesian_emotion

  belongs_to :user, inverse_of: :user_tweets

  validates_presence_of :text,
    :user_id,
    :tweet_id


    def clean_tweet
      tweet = self.text
      tweet.gsub!(non_alphabetic_characters, '')
      tweet.downcase!
      tweet.gsub!(urls, '')
      tweet.gsub!(http, '')
      tweet.gsub!(multiple_spaces,' ')
      tweet
    end

    def update_emotions(new_emotion)
      self.emotion = new_emotion
      self.bayesian_emotion = new_emotion
    end

    def non_alphabetic_characters
      /[^a-z ]/i
    end

    def urls
      /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/
    end

    def http
      /(?=\w*h)(?=\w*t)(?=\w*t)(?=\w*p)\w*/
    end

    def multiple_spaces
      /\s\s+/
    end

end
