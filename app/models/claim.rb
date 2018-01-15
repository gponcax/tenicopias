class Claim < ApplicationRecord
  belongs_to :student
  belongs_to :doc

  accepts_nested_attributes_for :student 
end
