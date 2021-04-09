class Zipfile < ApplicationRecord
  has_one_attached :file
  belongs_to :user
  belongs_to :right
  has_many :pzs, dependent: :destroy
end
