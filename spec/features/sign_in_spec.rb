require 'rails_helper'

describe "Sign in flow" do

  # include TestFactories

  context "successful" do
    it "redirects to the topics index" do
      user = authenticated_user
      visit root_path

      within '.user-info' do
        click_link 'Sign In'
      end

      fill_in 'Email', with: user.email
      fill_in "Password", with: user.password

      within 'form' do
        click_button 'Sign in'
      end

      expect(current_path).to eq topics_path
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