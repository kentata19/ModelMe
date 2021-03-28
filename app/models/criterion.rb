class Criterion < ApplicationRecord
  belongs_to :user
  belongs_to :right
  validates :sp, presence: true
end
