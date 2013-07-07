class UserSerializer < ActiveModel::Serializer
  attributes :id, :emotion, :bayesian_emotion, :polarity
  has_many :followers
end
