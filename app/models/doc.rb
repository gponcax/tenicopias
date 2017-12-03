class Doc < ApplicationRecord
  mount_uploader :document, DocUploader
  belongs_to :group
end
