require 'rails_helper'

RSpec.describe ProducerLabel, type: :model do
  let(:instance) { create(:producer_label) }

  it "create and persist a label" do
    expect(instance).to be_valid
  end

  describe "associations" do
    it { is_expected.to belong_to(:label) }
    it { is_expected.to belong_to(:producer) }
  end
end
