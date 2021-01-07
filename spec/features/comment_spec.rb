require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'Comment model validation' do
    comment = Comment.new(post_id: '2', user_id: '1', content: 'A random comment')
    it 'Comment content' do
      expect(comment.content).to eql('A random comment')
    end
    it 'Comment must not be empty' do
      expect(comment.content).not_to be_empty
    end
  end
end
