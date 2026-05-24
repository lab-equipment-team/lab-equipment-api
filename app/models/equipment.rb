class Equipment < ApplicationRecord
  belongs_to :category
  has_many :maintenance_records
end