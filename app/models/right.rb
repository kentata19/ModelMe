class Right < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :sympathies, dependent: :destroy
  has_many :criterions, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :content, presence: true, length: { maximum: 150 }
  validates :deadline, presence: true
  validates :due, presence: true
  has_many_attached :images
  has_many :zipfiles, dependent: :destroy
  has_many :definitions, dependent: :destroy
  enum status: { open: 0, closed: 1 }
  has_many :rejections, dependent: :destroy
  
end
