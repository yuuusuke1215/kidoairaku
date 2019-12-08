class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :posts, dependent: :destroy
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverses_of_relationship, source: :user
  
  has_many :rejects, dependent: :destroy
  has_many :refusals, through: :rejects, source: :reject
  has_many :reverses_of_reject, class_name: 'Reject', foreign_key: 'reject_id'
  has_many :refusers, through: :reverses_of_reject, source: :user
  
  has_many :favorites, dependent: :destroy
  has_many :likes, through: :favorites, source: :post, dependent: :destroy
  
  has_many :comments, dependent: :destroy
  
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
  
  def refuse(other_user)
    unless self == other_user
      self.rejects.find_or_create_by(reject_id: other_user.id)
    end
  end
  
  def unrefuse(other_user)
    reject = self.rejects.find_by(reject_id: other_user.id)
    reject.destroy if reject
  end
  
  def refusing?(other_user)
    self.refusals.include?(other_user)
  end
  
  def favorite(postFavorite)
    self.favorites.find_or_create_by(post_id: postFavorite.id)
  end
  
  def unfavorite(postFavorite)
    favorite = self.favorites.find_by(post_id: postFavorite.id)
    favorite.destroy if favorite
  end
  
  def favoritePost?(postFavorite)
    self.likes.include?(postFavorite)
  end
  
  def feed_posts
    Post.where.not(user_id: self.refusal_ids)
  end
  
  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end
  
  mount_uploader :image, ImageUploader
end
