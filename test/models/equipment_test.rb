require "test_helper"

class EquipmentTest < ActiveSupport::TestCase
  test "serial_number presence and uniqueness" do
    e = Equipment.new(name: "X", category: categories(:one), purchased_on: Date.current, serial_number: nil)
    assert_not e.valid?
    e.serial_number = "UNIQUE-SN-1"
    assert e.valid?
    e.save!
    e2 = Equipment.new(name: "Y", category: categories(:one), purchased_on: Date.current, serial_number: "UNIQUE-SN-1")
    assert_not e2.valid?
  end

  test "purchased_on cannot be in the future" do
    e = equipment(:one)
    e.purchased_on = Date.tomorrow
    assert_not e.valid?
  end

  test "category must have a name" do
    cat = Category.create!(name: nil)
    e = Equipment.new(name: "X", category: cat, serial_number: "SNX", purchased_on: Date.current)
    assert_not e.valid?
  end

  test "cannot decommission with open maintenance" do
    e = equipment(:one)
    MaintenanceRecord.create!(equipment: e, description: "pending", performed_on: nil)
    e.status = 'decommissioned'
    assert_not e.valid?
  end
end
