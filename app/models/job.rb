class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy

  def self.level_of_interest_by_job
    self.group(:level_of_interest)
    .order(:level_of_interest)
    .count
  end

  def self.level_of_interest_by_company
    companies = self.group(:company_id)
    .average(:level_of_interest)
    .sort_by { |k, v| v }
    .reverse
    companies[0..2]
  end

  def self.count_by_city
    self.group(:city)
    .order(:city)
    .count
  end



end
