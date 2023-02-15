require 'rails_helper'

RSpec.describe Producer, type: :model do
  subject { create(:producer) }

  it "create and persist a school" do
    expect(subject).to be_valid
  end

  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:bottles).dependent(:nullify) }
    it { is_expected.to have_many(:producer_labels).dependent(:destroy) }
    it { is_expected.to have_many(:labels).through(:producer_labels) }
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

  describe "validations" do
    it { is_expected.to validate_presence_of :region }
    it { is_expected.to validate_presence_of :domaine_name }
  end
end
