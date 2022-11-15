class Contact < ApplicationRecord
  has_many :logs
  belongs_to :users

  validates :name, presence: true
end
