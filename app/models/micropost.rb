class Micropost < ActiveRecord::Base
  attr_accessible :content, :parent_id   
  belongs_to :user
  belongs_to :robot_config
  belongs_to :parent, class_name: 'Micropost'
  has_many :children, class_name: 'Micropost', foreign_key: "parent_id"

  validates :content, presence: true, length: { maximum: 500 }
  validates :user_id, presence: true  
  
  default_scope order: 'microposts.created_at DESC'

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", user_id: user.id)
  end
end
