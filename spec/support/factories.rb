FactoryGirl.define do

  factory :user do
  	email 'user@example.com'
    password 'example00'
    password_confirmation 'example00'
    remember_me false


    trait :unregistered do
      email 'unregistered@email.com'
    end

    factory :unregistered_user, traits: [:unregistered]
  end
end

