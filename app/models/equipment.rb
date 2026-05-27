class Equipment < ApplicationRecord
  belongs_to :category
  has_many :maintenance_records
  
  validates :serial_number, presence: true, uniqueness: { case_sensitive: false }
  validate :category_name_present
  validate :purchased_on_cannot_be_in_future
  validate :cannot_decommission_with_open_maintenance

  private

  def category_name_present
    if category.nil?
      errors.add(:category, "must exist")
    elsif category.name.blank?
      errors.add(:category, "must have a name")
    end
  end

  def purchased_on_cannot_be_in_future
    if purchased_on.present? && purchased_on > Date.current
      errors.add(:purchased_on, "can't be in the future")
    end
  end

  def cannot_decommission_with_open_maintenance
    if status == 'decommissioned' && maintenance_records.where(performed_on: nil).exists?
      errors.add(:status, "cannot be set to decommissioned while there are open maintenance records")
    end
  end
end