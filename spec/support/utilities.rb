def sign_in(user)

  stub_auth_response(user, :twitter)
  visit root_path
  click_link 'Sign in with Twitter'

end