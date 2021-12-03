require "rails_helper"

RSpec.describe FavoritedWork, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:artwork) }

    it { should belong_to(:favoriter) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
