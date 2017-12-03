class Group < ApplicationRecord
  has_many :students
  belongs_to :course
  belongs_to :teacher
  has_many :docs
end