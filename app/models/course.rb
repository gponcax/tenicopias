class Course < ApplicationRecord
  has_many :docs
  belongs_to :group
  belongs_to :teacher
end
