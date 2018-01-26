class Claim < ApplicationRecord
  belongs_to :student
  belongs_to :doc
  has_many :statuses

  before_create  :generate_token

  private

  def generate_token
    begin
      self.token = SecureRandom.hex(5)
      # .gsub('0','').gsub('l','').gsub('o', '').gsub('O', '').gsub('i','')
    end while !Claim.where(token: self.token).empty?
  end
end
