require 'rails_helper'

RSpec.describe Comment, type: :model do

  context '#update_valid?' do
  let (:user) { create(:user) }
  let (:post) { create(:post) }
    it "update is still valid if posted within the last 10 mins" do

      comment = user.comments.create(message: "Can you update me", post_id: post.id)
      expect(comment.update_valid?).to be_truthy
    end
  end
end
