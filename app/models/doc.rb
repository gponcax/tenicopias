class Doc < ApplicationRecord
  belongs_to :doctionable, polymorphic: true, optional: true

end
