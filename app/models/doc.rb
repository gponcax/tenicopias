class Doc < ApplicationRecord
  has_attached_file :document, styles: { medium: "300x300>", thumb: "100x100>" },
                              default_url: "/images/:style/missing.png"

   validates_attachment :document, content_type: { content_type: "application/pdf" }
end
