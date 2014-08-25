require 'rails_helper'

describe "Visiting profiles" do

  #include TestFactories

  before do
    @user = authenticated_user
  end

  context "not signed in" do

    it "shows profile" do

      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))
    end

  end
end

 def associated_post(options={})
  post_options = {
    title: 'Post title',
    body: 'Post bodies must be pretty long.',
    topic: Topic.create(name: 'Topic name'),
    user: authenticated_user
    }.merge(options)

    Post.create(post_options)
  end

  def authenticated_user(options={})
    user_options = {email: "email#{rand}@fake.com", password: 'password'}.merge(options)
    user = User.new(user_options)
    user.skip_confirmation!
    user.save
    user
  end