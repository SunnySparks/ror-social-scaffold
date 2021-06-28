require 'rails_helper'

RSpec.describe Friendship, type: :model do
  context 'Associations tests' do
    it { should belong_to(:user) }
  end
end