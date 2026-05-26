class Equipment < ApplicationRecord
  belongs_to :category
  has_many :maintenance_records

  # Validations
  validates :name, presence: true
  validates :serial_number, presence: true, uniqueness: true
  validates :category_id, presence: true
  validates :status, presence: true, inclusion: { in: %w[operational in_maintenance], message: "%{value} is not a valid status" }
end
