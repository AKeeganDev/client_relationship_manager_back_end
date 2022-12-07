class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::Denylist

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_many :contacts, dependent: :delete_all
  has_many :logs, through: :contacts

  validates :name, :username, presence: true, length: { minimum: 1 }

  def first_five_contacts
    contacts.order(created_at: :desc).limit(5)
  end
end
