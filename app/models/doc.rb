class Doc < ApplicationRecord
  has_attached_file :document
  validates_attachment :document,
                        content_type: { content_type: "application/pdf" },
                        size: { in: 0..3.megabytes }, presence: true

  belongs_to :course

  has_many :claims
  has_many :students, through: :claims

  # has_many :students
end
