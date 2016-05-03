class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :name,               type: String
  field :phone_num,               type: String
  field:password_digest, type:String

  validates :name, uniqueness: true, presence: true
  has_one :card
  has_many :messages
  has_secure_password
end