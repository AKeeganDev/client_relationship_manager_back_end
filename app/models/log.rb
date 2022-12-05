class Log < ApplicationRecord
  belongs_to :contact

  validates :subject, :body, presence: true
end
