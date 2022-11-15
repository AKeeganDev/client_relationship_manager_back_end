class User < ApplicationRecord
  has_many :contacts

  validates :name, :user_name, presence: true
end
