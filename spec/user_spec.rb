require 'rails_helper'

RSpec.describe User, type: :model do
    let(:user) { User.new(name: 'test_user', email: 'user@gmail.com', password: 'password') }

        context 'Validations tests' do
            it 'user is valid if it has a name' do
            expect(user).to be_valid
            end
        
            it "user should be invalid if name is empty" do
            user.name = ''
            expect(user).not_to be_valid
            end
        end


        context 'user#friends' do
        let(:friend) { User.create(name: 'friend', email: 'friend@gmail.com', password: 'password') }
    
        it "should return a collection of the user's friends" do
          user.save
          Friendship.create(user_id: user.id, friend_id: friend.id, status: 'accepted')
          expect(user.friends).to include(friend)
        end
      end

end