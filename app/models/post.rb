class Post < ApplicationRecord
  #userに関する
  belongs_to :user

  #likeに関する
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
  def liked_by(user)
    # user_idとpost_idが一致するlikeを検索する
    Like.find_by(user_id: user.id, post_id: id)
  end

  #photoに関する
  validates :caption, presence: true
  
  
  has_many_attached :images
  has_many :photos, dependent: :destroy
  has_many :rights, dependent: :destroy
  has_many :supports, dependent: :destroy
  has_many :reps, dependent: :destroy
  has_many :sympathies, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :ps, dependent: :destroy
  #通知に関するvalidation
  has_many :notifications, dependent: :destroy
  def create_notification_reply!(current_user, reply_id)
    save_notification_reply!(current_user, reply_id, user_id)
  end

  def save_notification_reply!(current_user, reply_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      post_id: id,
      reply_id: reply_id,
      visited_id: visited_id,
      action: 'reply'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visiter_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
  

  #rightの通知に関するメソッド
  def create_notification_right!(current_user, right_id)
    save_notification_right!(current_user, right_id, user_id)
  end

  def save_notification_right!(current_user, right_id, visited_id)
      # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
      notification = current_user.active_notifications.new(
        post_id: id,
        right_id: right_id,
        visited_id: visited_id,
        action: 'right'
      )
      # 自分の投稿に対するコメントの場合は、通知済みとする
      if notification.visiter_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
  end
  

  #supportの通知に関するメソッド
  def create_notification_support!(current_user, support_id)
    save_notification_support!(current_user, support_id, user_id)
  end

  def save_notification_support!(current_user, support_id, visited_id)
      # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
      notification = current_user.active_notifications.new(
        post_id: id,
        support_id: support_id,
        visited_id: visited_id,
        action: 'support'
      )
      # 自分の投稿に対するコメントの場合は、通知済みとする
      if notification.visiter_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
  end

  #zipfileの通知に関するメソッド
  def create_notification_zipfile!(current_user, zipfile_id)
    
    zipfile = Zipfile.find(zipfile_id)
    sympathies = zipfile.right.sympathies
    sympathies.each do |sympathy|
      save_notification_zipfile!(current_user, zipfile_id, sympathy.user.id)
    end
  end

  def save_notification_zipfile!(current_user, zipfile_id, visited_id)
      # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
      notification = current_user.active_notifications.new(
        post_id: id,
        zipfile_id: zipfile_id,
        visited_id: visited_id,
        action: 'zipfile'
      )
      # 自分の投稿に対するコメントの場合は、通知済みとする
      if notification.visiter_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
  end
end
