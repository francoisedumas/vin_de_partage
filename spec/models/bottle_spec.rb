require 'rails_helper'

RSpec.describe Bottle, type: :model do
  subject { create(:bottle) }
  let(:user) { create(:user) }

  it "create and persist a bottle" do
    expect(subject).to be_valid
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
    it { should enumerize(:country).in(:france)}
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :region }
    it { is_expected.to validate_presence_of :color }
  end

  describe "#set_domaine_name" do
    let(:producer) { create(:producer, domaine_name: "Awesome Inc.") }
    subject { create(:bottle, domaine_name: nil, producer: nil) }

    it "sets the domaine_name to the associated producer's domaine_name" do
      expect {
        subject.update(producer: producer)
      }.to change { subject.domaine_name }.from(nil).to("Awesome Inc.")
    end

    it "does not set the domaine_name if domaine_name is already present" do
      subject.update(domaine_name: "My Own Name")
      subject.reload
      expect {
        subject.update(producer: producer)
      }.not_to change { subject.domaine_name }
    end
  end

  describe "#bookmark!" do
    it "adds a bookmark vote if user has not bookmarked before" do
      expect {
        subject.bookmark!(user)
      }.to change { subject.get_upvotes(vote_scope: "bookmark").count }.by(1)
    end

    it "removes the bookmark vote if user has already bookmarked" do
      subject.upvote_by user, vote_scope: "bookmark"
      expect {
        subject.bookmark!(user)
      }.to change { subject.get_upvotes(vote_scope: "bookmark").count }.by(-1)
    end
  end
end
