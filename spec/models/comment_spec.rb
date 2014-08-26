require 'rails_helper'

describe Comment do

  #include TestFactories

  context "after_create" do

    before do
      @post = associated_post
      @user = authenticated_user
      @comment = Comment.new(body: 'My comment', post: @post, user_id: 10000)
    end

    context "with user's permission" do

      it "sends an email to users who have favorited the post" do
        @user.favorites.where(post: @post).create

        allow( FavoriteMailer )
          .to receive(:new_comment)
          .with(@user, @post, @comment)
          .and_return( double(deliver: true) )

        @comment.save
      end

      it "does not send emails to users who haven't favorited the post" do
        expect( FavoriteMailer )
          .not_to receive(:new_comment)

        @comment.save
      end
    end

    context "without permission" do

      before { @user.update_attribute(:email_favorites, false) }

      it "does not send emails, even to users who have favorited" do
        @user.favorites.where(post: @post).create

        expect( FavoriteMailer )
          .not_to receive(:new_comment)

        @comment.save
      end
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