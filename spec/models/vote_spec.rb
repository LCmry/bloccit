require 'rails_helper'

describe Vote do
  describe "validations" do
    context "value validation" do
      it "only allows -1 or 1 as values" do
        expect( @vote.new(value: 1).valid? ).to eq(true)
        expect( @vote.new(value: -1).valid? ).to eq(true)
        expect( @vote.new(value: 2).valid? ).to eq(false)
      end
    end
  end
end