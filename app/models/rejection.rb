class Rejection < ApplicationRecord
  belongs_to :user
  belongs_to :right
  has_many :rrs, dependent: :destroy
end
