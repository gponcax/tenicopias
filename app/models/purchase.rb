class Purchase < ApplicationRecord
  belongs_to :doc
  belongs_to :student
  belongs_to :balance
end
