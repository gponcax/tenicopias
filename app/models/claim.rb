class Claim < ApplicationRecord
  belongs_to :student
  belongs_to :doc
  # belongs_to :transaction
  belongs_to :trans, foreign_key: "transaction_id", class_name: "trans"
end
