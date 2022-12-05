class Contact < ApplicationRecord
  has_many :logs, dependent: :delete_all
  belongs_to :user

  validates :name, presence: true
  validates_format_of :phone_number, with: /^(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}$/,
                                     multiline: true, allow_blank: true
end
