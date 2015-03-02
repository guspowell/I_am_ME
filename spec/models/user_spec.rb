require 'rails_helper'

RSpec.describe User, type: :model do

  context 'upon registration' do 

    it 'should automatically create a me calendar' do
      user = create(:user)
      expect(user.calendars.length).to eq(1)
    end 

  end

end
