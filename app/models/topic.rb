class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  scope :visible_to, -> (user) { user ? all : public_topic }

  scope :public_topic, -> { where(public: true) }

  scope :private_topic, -> { where(public: false) }
end
