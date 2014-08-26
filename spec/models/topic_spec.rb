require 'rails_helper'

describe Topic do
  describe "scopes" do

    before do
      @public_topic = Topic.create
      @private_topic = Topic.create(public: false)
    end

    context "public_topic" do
      it "returns a public topic" do
        expect(Topic.public_topic).to eq( [@public_topic] )
      end
    end

    context "private_topic" do
      it "returns a private topic" do
        expect(Topic.private_topic).to eq( [@private_topic] )
      end
    end

    context "visible_to(user)" do
      it "returns all topics if the user is present" do
        user = true
        expect(Topic.visible_to(user)).to eq(Topic.all)
      end

      it "returns only public topics if user is nil" do
        user = nil
        expect(Topic.visible_to(user)).to eq( [@public_topic] )
      end
    end
  end
end