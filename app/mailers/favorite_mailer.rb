class FavoriteMailer < ActionMailer::Base
  default from: "lc_monterey@hotmail.com"

  def new_comment(user, post, comment)

    # New Headers
    headers["Message-ID"] = "<comments/#{comment.id}@lc-bloccit.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@lc-bloccit.com>"
    headers["References"] = "<post/#{post.id}@lc-bloccit.com"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
