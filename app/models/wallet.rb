class Wallet < ApplicationRecord
  belongs_to :student
  has_many :transactions
end
