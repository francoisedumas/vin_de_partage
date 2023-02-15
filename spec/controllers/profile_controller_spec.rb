require "rails_helper"

RSpec.describe ProfileController, type: :controller do
  let(:user) { create(:user) }
  let(:valid_params) { { first_name: "Bob", last_name: "Marley", email: "bob@marley.com" } }

  before { sign_in user }

  describe "#edit" do
    it "returns a successful response" do
      get :edit, params: { id: user.id }
      expect(response).to be_successful
    end
  end

  describe "#update" do
    context "with valid params" do

      it "updates the requested user" do
        put :update, params: { id: user.id, user: valid_params }
        user.reload
        expect(user.first_name).to eq("Bob")
        expect(user.last_name).to eq("Marley")
        expect(user.email).to eq("bob@marley.com")
      end

      it "redirects to the edit view" do
        put :update, params: { id: user.id, user: valid_params }
        expect(response).to redirect_to(edit_profile_path)
      end
    end

    context "with invalid params" do
      let(:invalid_params) { valid_params.merge(first_name: nil, last_name: nil, email: nil) }

      it "does not update the requested user" do
        put :update, params: { id: user.id, user: invalid_params }
        user.reload
        expect(user.first_name).not_to eq(nil)
        expect(user.last_name).not_to eq(nil)
      end

      it "is unprocessable" do
        put :update, params: { id: user.id, user: invalid_params }
        expect(response).to be_unprocessable
      end
    end
  end
end
