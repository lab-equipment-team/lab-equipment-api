# Seed data for Lab Equipment API
# This creates realistic categories, equipment, and maintenance records

# Clear existing data
MaintenanceRecord.destroy_all
Equipment.destroy_all
Category.destroy_all

# Create Categories
puts "Creating categories..."
categories = {
  microscopy: Category.create!(
    name: "Microscopy",
    description: "Optical and electron microscopes for sample analysis"
  ),
  spectrometry: Category.create!(
    name: "Spectrometry",
    description: "Instruments for analyzing molecular composition and properties"
  ),
  chromatography: Category.create!(
    name: "Chromatography",
    description: "Equipment for separating and analyzing chemical components"
  ),
  thermal_analysis: Category.create!(
    name: "Thermal Analysis",
    description: "Instruments for measuring thermal properties of materials"
  ),
  centrifugation: Category.create!(
    name: "Centrifugation",
    description: "Centrifuges for sample separation"
  ),
  incubation: Category.create!(
    name: "Incubation & Culture",
    description: "Equipment for maintaining controlled growth environments"
  )
}

# Create Equipment
puts "Creating equipment..."
equipment_data = [
  # Microscopy
  {
    category: categories[:microscopy],
    name: "Inverted Microscope IX83",
    serial_number: "MIC-001-2021",
    purchased_on: "2021-03-15",
    status: "operational"
  },
  {
    category: categories[:microscopy],
    name: "Confocal Laser Scanning Microscope",
    serial_number: "MIC-002-2020",
    purchased_on: "2020-07-22",
    status: "operational"
  },
  {
    category: categories[:microscopy],
    name: "Transmission Electron Microscope",
    serial_number: "MIC-003-2019",
    purchased_on: "2019-11-10",
    status: "operational"
  },
  
  # Spectrometry
  {
    category: categories[:spectrometry],
    name: "UV-Vis Spectrophotometer",
    serial_number: "SPEC-001-2022",
    purchased_on: "2022-01-08",
    status: "operational"
  },
  {
    category: categories[:spectrometry],
    name: "FTIR Spectrometer",
    serial_number: "SPEC-002-2021",
    purchased_on: "2021-05-12",
    status: "operational"
  },
  {
    category: categories[:spectrometry],
    name: "Mass Spectrometer",
    serial_number: "SPEC-003-2020",
    purchased_on: "2020-09-30",
    status: "in_maintenance"
  },
  
  # Chromatography
  {
    category: categories[:chromatography],
    name: "High Performance Liquid Chromatograph",
    serial_number: "CHROM-001-2022",
    purchased_on: "2022-02-14",
    status: "operational"
  },
  {
    category: categories[:chromatography],
    name: "Gas Chromatograph with FID",
    serial_number: "CHROM-002-2021",
    purchased_on: "2021-08-19",
    status: "operational"
  },
  
  # Thermal Analysis
  {
    category: categories[:thermal_analysis],
    name: "Differential Scanning Calorimeter",
    serial_number: "THERM-001-2022",
    purchased_on: "2022-06-21",
    status: "operational"
  },
  {
    category: categories[:thermal_analysis],
    name: "Thermogravimetric Analyzer",
    serial_number: "THERM-002-2021",
    purchased_on: "2021-10-05",
    status: "operational"
  },
  
  # Centrifugation
  {
    category: categories[:centrifugation],
    name: "Ultracentrifuge Optima XE-90",
    serial_number: "CENT-001-2020",
    purchased_on: "2020-04-17",
    status: "operational"
  },
  {
    category: categories[:centrifugation],
    name: "Microcentrifuge 5424R",
    serial_number: "CENT-002-2023",
    purchased_on: "2023-01-10",
    status: "operational"
  },
  
  # Incubation & Culture
  {
    category: categories[:incubation],
    name: "CO2 Incubator 5400",
    serial_number: "INC-001-2021",
    purchased_on: "2021-02-28",
    status: "operational"
  },
  {
    category: categories[:incubation],
    name: "Shaking Incubator Innova 44",
    serial_number: "INC-002-2020",
    purchased_on: "2020-11-03",
    status: "operational"
  }
]

equipment_objects = equipment_data.map do |data|
  Equipment.create!(data)
end

# Create Maintenance Records
puts "Creating maintenance records..."
maintenance_data = [
  {
    equipment: equipment_objects[0],
    technician: "Dr. Sarah Johnson",
    performed_on: "2024-05-10",
    description: "Routine alignment and calibration",
    cost: 450.00
  },
  {
    equipment: equipment_objects[0],
    technician: "Dr. Sarah Johnson",
    performed_on: "2024-02-15",
    description: "Objective lens replacement",
    cost: 2800.00
  },
  {
    equipment: equipment_objects[1],
    technician: "Dr. Marcus Chen",
    performed_on: "2024-04-22",
    description: "Laser power check and adjustment",
    cost: 650.00
  },
  {
    equipment: equipment_objects[2],
    technician: "Dr. Sarah Johnson",
    performed_on: "2024-01-10",
    description: "Vacuum system servicing",
    cost: 3200.00
  },
  {
    equipment: equipment_objects[3],
    technician: "Dr. Marcus Chen",
    performed_on: "2024-05-05",
    description: "Lamp replacement and wavelength calibration",
    cost: 1200.00
  },
  {
    equipment: equipment_objects[5],
    technician: "Dr. Elena Rodriguez",
    performed_on: "2024-05-20",
    description: "Ionization chamber repair",
    cost: 4500.00
  },
  {
    equipment: equipment_objects[6],
    technician: "Dr. Marcus Chen",
    performed_on: "2024-03-18",
    description: "Column replacement and system flush",
    cost: 2100.00
  },
  {
    equipment: equipment_objects[8],
    technician: "Dr. Elena Rodriguez",
    performed_on: "2024-05-12",
    description: "Thermal sensor calibration",
    cost: 850.00
  },
  {
    equipment: equipment_objects[10],
    technician: "Dr. Sarah Johnson",
    performed_on: "2024-04-30",
    description: "Rotor inspection and balance",
    cost: 2200.00
  },
  {
    equipment: equipment_objects[12],
    technician: "Dr. Marcus Chen",
    performed_on: "2024-05-15",
    description: "CO2 sensor replacement",
    cost: 580.00
  },
  {
    equipment: equipment_objects[12],
    technician: "Dr. Marcus Chen",
    performed_on: "2023-11-20",
    description: "Temperature controller firmware update",
    cost: 320.00
  },
  {
    equipment: equipment_objects[13],
    technician: "Dr. Elena Rodriguez",
    performed_on: "2024-02-08",
    description: "Motor bearing replacement",
    cost: 1450.00
  }
]

maintenance_data.each { |data| MaintenanceRecord.create!(data) }

puts "✓ Seed data created successfully!"
puts "  - #{categories.count} categories"
puts "  - #{Equipment.count} equipment items"
puts "  - #{MaintenanceRecord.count} maintenance records"
