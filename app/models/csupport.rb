class Csupport < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :support
end
