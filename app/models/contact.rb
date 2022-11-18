class Contact < ApplicationRecord
  has_many :logs
  belongs_to :user

  validates :name, presence: true
end
