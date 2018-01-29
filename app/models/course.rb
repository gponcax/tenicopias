class Course < ApplicationRecord
  # belongs_to :teacher
  # belongs_to :school
  belongs_to :group

  has_many :docs

  has_many :semesters
  has_many :students, through: :semesters

  has_many :course_classes
  has_many :teachers, through: :course_classes
end
