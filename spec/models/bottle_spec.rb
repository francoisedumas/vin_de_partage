require 'rails_helper'

RSpec.describe Bottle, type: :model do
  let(:instance) { create(:bottle) }

  it "create and persist a bottle" do
    expect(instance).to be_valid
  end

  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:producer).optional(true) }
    it { is_expected.to have_one_attached(:photo) }
  end

  describe "enumerize color" do
    it { should enumerize(:color).in(
      :pink,
      :red,
      :yellow,
      :white
    )}
  end

  describe "enumerize region" do
    it { should enumerize(:region).in(
      :alsace_lorraine,
      :beaujolais,
      :bordeaux,
      :bourgogne,
      :champagne,
      :corse,
      :jura_bugey_savoie,
      :languedoc_roussillon,
      :loire,
      :provence,
      :rhone,
      :sud_ouest
    )}
  end

  describe "enumerize country" do
    it { should enumerize(:country).in(
      :france
    )}
  end

  describe "#set_producer_name" do
    let(:producer) { create(:producer, domaine_name: "Awesome Inc.") }
    let(:bottle) { create(:bottle, producer_name: nil, producer: nil) }

    it "sets the producer_name to the associated producer's domain_name" do
      expect {
        bottle.update(producer: producer)
      }.to change { bottle.producer_name }.from(nil).to("Awesome Inc.")
    end

    it "does not set the producer_name if producer_name is already present" do
      bottle.update(producer_name: "My Own Name")
      bottle.reload
      expect {
        bottle.update(producer: producer)
      }.not_to change { bottle.producer_name }
    end
  end
end
