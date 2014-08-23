require 'rails_helper'

describe Post do
  describe "vote methods" do

    before do
      @post = Post.new(title: 'post title', body: 'Post bodies must be pretty long.')
      allow(@post).to receive(:create_vote)
      @post.save
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
end