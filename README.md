# lab-equipment-api

This Rails application manages lab equipment, categories, and maintenance records.

## New Equipment validation rules

The `Equipment` model now includes the following custom business rule validations:

- `serial_number` must be present and unique.
- `category` must exist and the category must have a name.
- `purchased_on` cannot be a future date.
- `status` cannot be set to `decommissioned` when the equipment has open maintenance records.

## Running the equipment tests

Use the following command from the project root:

```bash
bundle install
bin/rails test test/models/equipment_test.rb
```
