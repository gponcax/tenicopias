class Doc < ApplicationRecord
  has_attached_file :document
  validates_attachment :document, content_type: { content_type: "application/pdf" }

  belongs_to :course
  has_many :students, through: :claim
  has_many :claims
end
