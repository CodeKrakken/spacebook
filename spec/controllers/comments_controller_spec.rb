require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

    before(:each) do
        allow(subject).to receive(:redirect_if_user_is_not_signed_in).and_return(nil)
        allow(subject).to receive(:current_user).and_return(create(:user))
    end

    describe "POST /" do

        it "redirects to posts_url" do
          post :create, params: { comment: { message: "Hello!", user_id: 1, post_id: 1} }
          expect(response).to redirect_to(posts_url)
        end

        it "creates a comment" do
            postOne = create(:post, id: 2, message: "Hello, world!", user_id: 1)
            post :create, params: { comment: { message: "A nice comment", user_id: 1, post_id: 2} }
            expect(Comment.find_by(message: "A nice comment")).to be
        end

    end 

end
