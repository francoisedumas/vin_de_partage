require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(
    email: "test@example.com",
    password: "Azerty123!",
    role: "admin",
    first_name: "Alice",
    last_name: " Liddell "
  )}

  describe "validations" do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :role }
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

  it "expected to be valid with an email, a handle and a password, and to be able to authenticate" do
    expect(user).to be_valid
    expect(user.active_for_authentication?).to be true
  end

  describe "associations" do
    it { is_expected.to have_many(:bottles).dependent(:destroy) }
    it { is_expected.to have_many(:producers).dependent(:destroy) }
  end

  describe "attachement" do
    it { is_expected.to have_one_attached(:photo) }
  end

  it { should enumerize(:role).in(
    :admin,
    :maintainer,
    :default
  ) }

  describe "#full_name" do
    it "returns the user first & last name" do
      expect(user.full_name).to eq("Alice LIDDELL")
    end
  end
end
