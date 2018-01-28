class Course < ApplicationRecord
  belongs_to :teacher
  belongs_to :school

  has_many :docs
  has_many :groups
  has_many :students, through: :groups
end
