class Course < ApplicationRecord
  has_many :docs
  belongs_to :teacher

  has_many :groups
  has_many :students, through: :groups
end
