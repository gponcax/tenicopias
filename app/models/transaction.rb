class Transaction < ApplicationRecord
  belongs_to :wallet
  has_many :claims
end
