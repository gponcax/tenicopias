class Teacher < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  #
  # has_many :docs ,as: :Doctionable
  #
  # has_many :groups
  # has_many :courses, through: :groups
  has_many :courses
end
