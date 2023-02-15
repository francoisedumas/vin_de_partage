require "rails_helper"
require "i18n"

RSpec.describe ProducerLabelsController, type: :controller do
  subject { create(:producer_label) }
  let(:user) { create(:user) }

  before { sign_in user }

  describe "#destroy" do

    it "sets a flash message" do
      delete :destroy, params: { id: subject.id }
      expect(flash[:notice]).to eq(I18n.t("producer_labels.destroy.success"))
    end

    it "destroys the producer label" do
      subject
      expect {
        delete :destroy, params: { id: subject.id }
      }.to change(ProducerLabel, :count).by(-1)
    end

    it "redirects to the producers page" do
      delete :destroy, params: { id: subject.id }
      expect(response).to redirect_to(producers_url)
    end

    it "returns a JSON response with success: true", :aggregate_failures do
      delete :destroy, params: { id: subject.id }, format: :json
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to eq({ "success" => true })
    end
  end
end
