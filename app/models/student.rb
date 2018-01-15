 class Student < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }

   validates_attachment_content_type :avatar, { content_type: ['image/jpeg', 'image/png'] },
                                     size: { in: 0..3.megabytes },
                                     presence: true

    has_many :groups
    has_many :docs, through: :claims

    has_many :claims
    accepts_nested_attributes_for :claims
end
