module Api

  def self.aggregate_emotion(emotions={}, users=User.all)
    users.each do |user|
      emotion = user.emotion
      emotions[emotion] ||= 0
      emotions[emotion] += 1
    end
    checked_emotion(emotions)
  end

  def self.aggregate_polarity(polarities=[], users=User.all)
    users.each do |user|
      polarity = user.polarity
      polarities << polarity
    end
    checked_polarity
  end

  private

    def self.checked_emotion(emotions)
      if emotions.empty?
        "ambiguous"
      else
        emotions.max_by{|k, v| v}[0]
      end
    end

    def self.checked_polarity(polarities)
      if polarity_scores.empty?
        # polarity unreadable; return a neutral score of 5
        5
      else
        polarity_scores.inject(0.0){ |sum, el| sum + el}/polarity_scores.length
      end
    end

end
