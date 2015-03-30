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

  fill_in 'Username',              with: attributes[:username]
  fill_in 'Email address',         with: attributes[:email]
  fill_in 'password'     ,         with: attributes[:password]
  fill_in 'password confirmation', with: attributes[:password_confirmation]
  click_button 'Sign up'
end

def create_event
  user = create(:user) 
  create(:calendar, user: user)
  login_as(user)
  visit("/users/#{user.id}/events/new")
  
  fill_form(:event, {  name:  'Superhero Dance Off', 'event_date_1i' => '2015',
                              'event_date_2i'=>'March', 'event_date_3i'=>'2',
                              'event_date_4i'=>'12',
                              'event_description'=>'Why is this happening?',
                              'event_location'=>   'Hyde Park' })

end 

def fill_in_event_form(attrs)
  fill_form(:event, {  'Event Name'       => attrs[:name], 
                       'event_date_1i'    => attrs[:date].year,
                       'event_location'   => attrs[:location],
                       'event_description'=> attrs[:description],
                       'event_date_2i'    => attrs[:date].strftime("%B"),
                       'event_date_3i'    => attrs[:date].day,
                       'event_date_4i'    => attrs[:date].hour,
                       
  })
end


def event_form_with_tag(attrs)
  fill_in_event_form(attrs)
  fill_in 'Tags separated with comma', with: 'Sports'
end



