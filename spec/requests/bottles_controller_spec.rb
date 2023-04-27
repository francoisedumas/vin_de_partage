require "rails_helper"

RSpec.describe BottlesController do
  subject { response }

  let(:user) { create(:user) }
  let(:do_request) { get(path, params: params) }
  let(:params) { {} }
  let(:bottle) { create(:bottle, user: user) }

  before do
    sign_in(user)
    do_request
  end

  describe "#index" do
    let(:path) { "/bottles" }

    it { is_expected.to have_http_status(:ok) }

    it "has the correct content type" do
      expect(response.content_type).to eq("text/html; charset=utf-8")
    end
  end

  describe "#show" do
    let(:params) { { id: bottle.id } }

    it { is_expected.to have_http_status(:ok) }

    it "has the correct content type" do
      expect(response.content_type).to eq("text/html; charset=utf-8")
    end
  end
end
