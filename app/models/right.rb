class Right < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :sympathies, dependent: :destroy
  has_many :criterions, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :content, presence: true, length: { maximum: 150 }
  has_many_attached :images
  has_many :zipfiles, dependent: :destroy
  has_many :definitions, dependent: :destroy
end
