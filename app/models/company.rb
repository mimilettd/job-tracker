class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts

  def self.print_name(id)
    print_name = find(id)
    print_name.name
  end
end
