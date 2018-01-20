 class Student < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :wallet

  has_many :claims
  has_many :docs, through: :claims

  has_many :groups
  has_many :courses, through: :groups

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment  :avatar,
                        content_type: {content_type: ['image/jpeg', 'image/png'] },
                        size: { in: 0..3.megabytes }, presence: true

end
