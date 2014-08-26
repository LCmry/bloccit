require 'rails_helper'

describe Post do

  include TestFactories
  
  describe "vote methods" do

    before do
      @post = associated_post
      3.times { @post.votes.create(value: 1) }
      2.times { @post.votes.create(value: -1) }
    end

    context '#up_votes' do
      it "counts the number of votes with value = 1" do
        expect( @post.up_votes ).to eq(3)
      end
    end

    context '#down_votes' do
      it "counts the number of votes with value = -1" do
        expect( @post.down_votes ).to eq(2)
      end
    end

    context '#points' do
      it "returns the sum of all down and up votes" do
        expect( @post.points ).to eq(1)
      end
    end
  end

  context '#create_vote' do
    it "generates an up-vote when explicitly called" do
      post = associated_post
      expect( post.up_votes ).to eq(0)
      post.create_vote
      expect( post.up_votes ).to eq(1)
    end
  end
end