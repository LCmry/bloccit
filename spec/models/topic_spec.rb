require 'rails_helper'

describe Topic do
  describe "scopes" do

    let(:pub_topic) { Topic.create }
    let(:priv_topic) { Topic.create(public: false) }

    context "public_topic" do
      it "returns a public topic" do
        expect(Topic.public_topic).to eq( [pub_topic] )
      end
    end

    context "private_topic" do
      it "returns a private topic" do
        expect(Topic.private_topic).to eq( [priv_topic] )
      end
    end

    context "visible_to(user)" do
      it "returns all topics if the user is present" do
        user = true
        expect(Topic.visible_to(user)).to eq(Topic.all)
      end

      it "returns only public topics if user is nil" do
        user = nil
        expect(Topic.visible_to(user)).to eq( [pub_topic] )
      end
    end
  end
end