class Teacher < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  has_many :courses

  has_many :tokens, class_name: 'Doorkeeper::AccessToken',
           foreign_key: :resource_owner_id

  has_one :token, -> { order 'created_at DESC' },
         class_name: 'Doorkeeper::AccessToken', foreign_key: :resource_owner_id
end
