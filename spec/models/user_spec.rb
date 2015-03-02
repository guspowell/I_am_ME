require 'rails_helper'

RSpec.describe User, type: :model do

  context 'upon registration' do 

    it 'should automatically create a me calendar' do
      expect(Calendar.all.length).to eq(0)
      create(:user)
      expect(Calendar.all.length).to eq(1)
    end 

  end

end
