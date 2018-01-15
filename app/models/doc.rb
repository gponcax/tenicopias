class Doc < ApplicationRecord
  has_attached_file :document
  validates_attachment :document, content_type: { content_type: "application/pdf" }

  belongs_to :course
  has_many :students, through: :claims
  has_many :claims
  # accepts_nested_attributes_for :claims
end
