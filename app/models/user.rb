class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :posts
    mount_uploader :avatar, AvatarUploader
  has_many :comments
  has_many :favorites, dependent: :destroy

  def role?(base_role)
    role == base_role.to_s
  end

  def favorited(post)
    favorites.where(post_id: post.id).first
  end
end
