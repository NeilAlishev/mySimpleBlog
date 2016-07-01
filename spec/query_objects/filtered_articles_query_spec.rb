require "rails_helper"

describe FilteredArticlesQuery do
  let(:first_user) { create :user, full_name: "First user" }
  let(:second_user) { create :user, full_name: "Second user" }

  before do
    create :article, user: first_user, title: "First user's article"
    create :article, user: second_user, title: "Second user's article"
  end

  describe "#all" do
    subject(:all) { described_class.new(filtering_params).all }

    it "returns one article" do
      expect(all.size).to eq(1)
    end

    it "returns right user's article" do
      expect(all.first.title).to eq("Second user's article")
    end
  end

  private

  def filtering_params
    { full_name: "Second user" }
  end
end
