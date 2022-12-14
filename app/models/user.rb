require 'securerandom'
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::Denylist

  before_save :generate_uuid

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, :registerable, jwt_revocation_strategy: JwtDenylist

  has_many :contacts, dependent: :delete_all
  has_many :logs, through: :contacts

  validates :name, :username, presence: true, length: { minimum: 1 }

  def first_five_contacts
    contacts.order(created_at: :desc).limit(5)
  end

  private

  def generate_uuid
    self.jti = SecureRandom.uuid if jti.nil?
  end
end
