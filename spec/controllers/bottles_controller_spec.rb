require "rails_helper"

RSpec.describe BottlesController, type: :controller do
  let(:user) { create(:user) }
  let(:bottle) { create(:bottle, user: user) }

  before { sign_in user }

  describe "#index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "#show" do
    it "returns a successful response" do
      get :show, params: { id: bottle.id }
      expect(response).to be_successful
    end
  end

  describe "#new" do
    it "returns a successful response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "#create" do
    context "with valid params" do
      let(:valid_attributes) { { name: "Château Margaux", country: "france", domaine_name: "Château Margaux", producer: "Château Margaux", appelation: "Margaux", region: "bordeaux", color: "red", year: "1995", user_id: user.id } }

      it "creates a new bottle" do
        expect {
          post :create, params: { bottle: valid_attributes }
        }.to change(Bottle, :count).by(1)
      end

      it "redirects to the created bottle" do
        post :create, params: { bottle: valid_attributes }
        expect(response).to redirect_to(Bottle.last)
      end
    end

    context "with invalid params" do
      let(:invalid_attributes) { { domaine_name: nil, region: nil } }

      it "does not create a new bottle" do
        expect {
          post :create, params: { bottle: invalid_attributes }
        }.to change(Bottle, :count).by(0)
      end

      it "is unprocessable" do
        post :create, params: { bottle: invalid_attributes }
        expect(response).to be_unprocessable
      end
    end
  end

  describe "#edit" do
    it "returns a successful response" do
      get :edit, params: { id: bottle.id }
      expect(response).to be_successful
    end
  end

  describe "#update" do
    context "with valid params" do
      let(:new_attributes) { { name: "Château Margaux", country: "france", domaine_name: "Château Margaux", producer: "Château Margaux", appelation: "Margaux", region: "bordeaux", color: "red", year: "1995" } }

      it "updates the requested bottle" do
        put :update, params: { id: bottle.id, bottle: new_attributes }
        bottle.reload
        expect(bottle.name).to eq("Château Margaux")
        expect(bottle.year).to eq(1995)
      end

      it "redirects to the bottle" do
        put :update, params: { id: bottle.id, bottle: new_attributes }
        expect(response).to redirect_to(bottle)
      end
    end

    context "with invalid params" do
      let(:invalid_attributes) { { domaine_name: nil, region: nil } }

      it "does not update the requested bottle" do
        put :update, params: { id: bottle.id, bottle: invalid_attributes }
        bottle.reload
        expect(bottle.name).not_to eq(nil)
        expect(bottle.country).not_to eq(nil)
      end

      it "is unprocessable" do
        put :update, params: { id: bottle.id, bottle: invalid_attributes }
        expect(response).to be_unprocessable
      end
    end
  end
end
