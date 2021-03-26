class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def update_without_current_password(params, *options)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
  
  has_one_attached :profile_photo , dependent: :destroy
  #likeに関するアソシエーション
  has_many :likes, dependent: :destroy
  has_many :like_reviews, dependent: :destroy

  #postテーブル
  has_many :posts, dependent: :destroy

  has_many :rights, dependent: :destroy
  has_many :supports, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :sympathies, dependent: :destroy
  has_many :criterions, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :zipfiles, dependent: :destroy
  has_many :definitions, dependent: :destroy
  has_many :rejections, dependent: :destroy
  has_many :reply_reviews, dependent: :destroy
  #通知に関するメソッド
  has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy
  #follow機能に関するアソシエーション
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow, dependent: :destroy
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :user, dependent: :destroy

  #follow機能のメソッド
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
end
