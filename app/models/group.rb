class Group < ApplicationRecord
  # belongs_to :student
  # belongs_to :course
  has_many :courses

  # has_many :semesters
  # has_many :students, through: :semesters

  #
  # has_many :course_classes
  # has_many :courses, through: :course_classes

  belongs_to :school

end
