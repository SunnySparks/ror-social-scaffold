require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'test_user', email: 'user@gmail.com', password: 'password') }

  context 'Validations tests' do
    it 'user is valid if it has a name' do
      expect(user).to be_valid
    end

    it 'user should be invalid if name is empty' do
      user.name = ''
      expect(user).not_to be_valid
    end
  end
end
