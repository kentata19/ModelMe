class Pz < ApplicationRecord
  belongs_to :user
  belongs_to :right
  belongs_to :zipfile
end
