def register(email)
	visit '/'
	click_link('Register')
  fill_in('Email address', with: email)
  fill_in('password', with: 'testtest')
  fill_in('password confirmation', with: 'testtest')
  click_button('Sign up')
end

def login_as(user)
  visit '/users/sign_in'
  fill_in 'user_email', with: user.email
  fill_in 'password', with: user.password
  click_button 'Log in'
end
