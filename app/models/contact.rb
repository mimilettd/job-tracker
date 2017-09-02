class Contact < ApplicationRecord
  belongs_to :company
  validates :name, :position, :email, presence: true
end
