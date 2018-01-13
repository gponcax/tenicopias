class Group < ApplicationRecord
  belongs_to :student
  has_many :courses

  # has_many :docs
  # belongs_to :teacher
  # belongs_to :teacher
end
