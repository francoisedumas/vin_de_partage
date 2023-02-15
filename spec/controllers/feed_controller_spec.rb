require "rails_helper"

RSpec.describe FeedController, type: :controller do
  let(:user) { create(:user) }

  before { sign_in user }

  describe "#show" do
    it "returns a successful response" do
      get :show
      expect(response).to be_successful
    end
  end
end
