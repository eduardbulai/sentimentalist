require 'spec_helper'

FactoryGirl.define do

  factory :user do
  	name 'user'
    uid '823121243'
    provider 'twitter'
  end
end

