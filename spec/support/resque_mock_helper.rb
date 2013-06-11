require 'resque'
require 'resque/mock'

class VerifyUserTest < Test::Unit::TestCase
  def setup
    Resque.mock!
  end

  def test_verify_user
    # model with a some states
    user = FactoryGirl.create(:user_with_followers)

    # resque job which verifies a user
    TweetUpdater.perform

    # probably have to reload this guy
    user.reload!

    # the job has ran, the user should be verified
    assert_equal user.state, :verified
  end
end