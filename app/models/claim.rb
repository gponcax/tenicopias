class Claim < ApplicationRecord
  belongs_to :student
  belongs_to :doc

end
