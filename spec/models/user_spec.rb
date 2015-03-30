require 'rails_helper'

RSpec.describe User, type: :model do

  context 'upon registration' do 

    it 'should automatically create a me calendar' do
      user = create(:user)

      expect(user.get_me_calendar.name).to eq "Me" 
    end 

  end

  it 'has a method that returns users Me Calendar' do
    user = create(:user)
    expect(user.get_me_calendar).to eq(user.calendars.find_by(name: "Me"))
  end

end
