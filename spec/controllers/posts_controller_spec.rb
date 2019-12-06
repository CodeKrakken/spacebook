require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  before(:each) do
    allow(subject).to receive(:redirect_if_user_is_not_signed_in).and_return(nil)
  end

  describe "GET /new " do
    xit "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    xit "responds with 200" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(posts_url)
    end

    xit "creates a post" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
