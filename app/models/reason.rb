class Reason < ApplicationRecord
  has_many :rrs, dependent: :destroy
end
