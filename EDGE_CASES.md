# Task 7 — Edge Case Testing & Curl Documentation

## Base URL
http://localhost:3000

---

## Edge Case 1 — Get a record that does not exist
**Scenario:** Request a category, equipment, or maintenance record with an ID that does not exist.
**Expected:** 404 Not Found

curl -X GET http://localhost:3000/categories/9999

---

## Edge Case 2 — Create equipment with missing required field
**Scenario:** Create equipment without a serial number.
**Expected:** 422 Unprocessable Entity

curl -X POST http://localhost:3000/equipment \
  -H "Content-Type: application/json" \
  -d '{"equipment":{"name":"Microscope","category_id":1}}'

---

## Edge Case 3 — Create equipment with duplicate serial number
**Scenario:** Create two equipment records with the same serial number.
**Expected:** 422 Unprocessable Entity on second request

curl -X POST http://localhost:3000/equipment \
  -H "Content-Type: application/json" \
  -d '{"equipment":{"name":"Microscope","serial_number":"SN001","category_id":1}}'

curl -X POST http://localhost:3000/equipment \
  -H "Content-Type: application/json" \
  -d '{"equipment":{"name":"Centrifuge","serial_number":"SN001","category_id":1}}'

---

## Edge Case 4 — Create equipment with a future purchased_on date
**Scenario:** Create equipment with purchased_on set to a future date.
**Expected:** 422 Unprocessable Entity

curl -X POST http://localhost:3000/equipment \
  -H "Content-Type: application/json" \
  -d '{"equipment":{"name":"Microscope","serial_number":"SN002","category_id":1,"purchased_on":"2099-01-01"}}'

---

## Edge Case 5 — Create equipment with invalid category_id
**Scenario:** Create equipment with a category_id that does not exist.
**Expected:** 422 Unprocessable Entity

curl -X POST http://localhost:3000/equipment \
  -H "Content-Type: application/json" \
  -d '{"equipment":{"name":"Microscope","serial_number":"SN003","category_id":9999}}'

---

## Edge Case 6 — Delete a category that has equipment
**Scenario:** Try to delete a category that still has equipment linked to it.
**Expected:** 422 Unprocessable Entity or error message

curl -X DELETE http://localhost:3000/categories/1

---

## Edge Case 7 — Create a maintenance record with invalid equipment_id
**Scenario:** Create a maintenance record linked to equipment that does not exist.
**Expected:** 422 Unprocessable Entity

curl -X POST http://localhost:3000/maintenance_records \
  -H "Content-Type: application/json" \
  -d '{"maintenance_record":{"equipment_id":9999,"description":"Oil change","technician":"Tech A","cost":50}}'

---

## Edge Case 8 — Update equipment status to decommissioned with open maintenance records
**Scenario:** Try to decommission equipment that has open maintenance records.
**Expected:** 422 Unprocessable Entity

curl -X PATCH http://localhost:3000/equipment/1 \
  -H "Content-Type: application/json" \
  -d '{"equipment":{"status":"decommissioned"}}'

---

## Edge Case 9 — Create a category with missing name
**Scenario:** Create a category without providing a name.
**Expected:** 422 Unprocessable Entity

curl -X POST http://localhost:3000/categories \
  -H "Content-Type: application/json" \
  -d '{"category":{}}'

---

## Edge Case 10 — Filter maintenance records by non-existent equipment_id
**Scenario:** Filter maintenance records using an equipment_id that does not exist.
**Expected:** Empty array returned

curl -X GET "http://localhost:3000/maintenance_records?equipment_id=9999"

---

## All Endpoints Reference

### Categories
| Method | Path | Description |
|--------|------|-------------|
| GET | /categories | List all categories |
| GET | /categories/:id | Get one category |
| POST | /categories | Create a category |
| PATCH | /categories/:id | Update a category |
| DELETE | /categories/:id | Delete a category |

### Equipment
| Method | Path | Description |
|--------|------|-------------|
| GET | /equipment | List all equipment |
| GET | /equipment/:id | Get one equipment |
| POST | /equipment | Create equipment |
| PATCH | /equipment/:id | Update equipment |
| DELETE | /equipment/:id | Delete equipment |

### Maintenance Records
| Method | Path | Description |
|--------|------|-------------|
| GET | /maintenance_records | List all records |
| GET | /maintenance_records/:id | Get one record |
| POST | /maintenance_records | Create a record |
| PATCH | /maintenance_records/:id | Update a record |
| DELETE | /maintenance_records/:id | Delete a record |