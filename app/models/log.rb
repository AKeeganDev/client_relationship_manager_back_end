class Log < ApplicationRecord
  has_many :contacts
  belongs_to :contacts

  validates :subject, :body, presence: true
end
