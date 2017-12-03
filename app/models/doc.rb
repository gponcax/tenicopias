class Doc < ApplicationRecord
  mount_uploaders :docs, DocUploader
  belongs_to :group
end
