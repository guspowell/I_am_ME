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
  fill_in 'user_login', with: user.username
  fill_in 'user_password', with: user.password
  click_button 'Log in'
end

def sign_up_with(attributes)
  visit '/users/sign_up'
  puts attributes
  fill_in 'Username',              with: attributes[:username]
  fill_in 'Email address',         with: attributes[:email_address]
  fill_in 'password'     ,         with: attributes[:password]
  fill_in 'password confirmation', with: attributes[:password_confirmation]
  click_button 'Sign up'
end
