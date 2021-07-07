class Support < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :notifications, dependent: :destroy
  has_many :ps, dependent: :destroy
  has_many :csupports, dependent: :destroy
end
