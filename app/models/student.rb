class Student < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :docs ,as: :Doctionable

  has_many :study_courses
  has_many :courses, through: :study_courses
end
