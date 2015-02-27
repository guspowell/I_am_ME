def register(email)
	visit '/'
	click_link('Register')
  fill_in('Email address', with: email)
  fill_in('password', with: 'testtest')
  fill_in('password confirmation', with: 'testtest')
  click_button('Sign up')
end
