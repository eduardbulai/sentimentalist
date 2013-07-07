class FollowerSerializer < ActiveModel::Serializer
  attributes :emotion, :bayesian_emotion, :polarity, :created_at
end
