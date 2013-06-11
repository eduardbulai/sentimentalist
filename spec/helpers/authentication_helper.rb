module AuthenticationHelper
  ACCESS_TOKEN = {
    :access_token => "LEGIT"
  }

  def stub_auth_response(user, provider = :twitter)
    OmniAuth.config.test_mode = true

    if user.persisted? && user.uid.empty?
      user.save!
    end

    info = {
      'provider' => 'twitter',
      'uid'   => user.persisted? && user.uid.present? ? user.uid : 'fake_uid',
      'info' => {
        'name'  => 'fake_name'
      },
      'credentials' => {
        'token' => '823627243-UDZhCacE9mWVMbFprLKq90Rk2sD3iPYujpDXPV4I',
        'secret' => 'eJKYJf3IKVRQDTlH59GXWnsrBohMHP49HRrNZA8HXo'
      }
    }

    OmniAuth.config.mock_auth[:twitter] = info
  end

  def sign_in_as(user, provider = :twitter)
    bypass_authorization do
      stub_auth_response(user, provider)
      visit '/auth/twitter'
    end
  end

  def bypass_authorization(&block)
    old_value = Authentication::Attempt.bypass_team_check
    begin
      Authentication::Attempt.bypass_team_check = true
      yield
    ensure
      Authentication::Attempt.bypass_team_check = old_value
    end
  end
end
