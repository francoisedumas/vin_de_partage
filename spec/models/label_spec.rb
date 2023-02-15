require 'rails_helper'

RSpec.describe Label, type: :model do
  subject { create(:label) }

  it "create and persist a label" do
    expect(subject).to be_valid
  end

  describe "associations" do
    it { is_expected.to have_many(:producer_labels).dependent(:destroy) }
    it { is_expected.to have_many(:producers).through(:producer_labels) }
    it { is_expected.to have_one_attached(:photo) }
  end
end
