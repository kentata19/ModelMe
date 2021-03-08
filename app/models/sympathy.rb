class Sympathy < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :right
end
