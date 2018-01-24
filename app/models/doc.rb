class Doc < ApplicationRecord
  belongs_to :course
  has_many :claims
  has_many :students, through: :claims
  has_many :purchases
  
  has_attached_file :document
  validates_attachment :document,
                        content_type: { content_type: "application/pdf" },
                        size: { in: 0..3.megabytes },
                        presence: true

  # .rtf, .doc, .docx, .xls, .xlsx, .ppt, .pptx, .pdf
end
