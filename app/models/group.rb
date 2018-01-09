class Group < ApplicationRecord
  # has_many :students
  # belongs_to :course
  # belongs_to :teacher
  # has_many :docs
  belongs_to :student
  has_many :courses
end
