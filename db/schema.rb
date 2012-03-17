# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120317000930) do

  create_table "capitalrecoveries", :force => true do |t|
    t.integer  "recovery_year"
    t.integer  "interest_rate"
    t.decimal  "recovery_factor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contracts", :force => true do |t|
    t.integer  "party_id"
    t.integer  "cropplan_id"
    t.string   "contract_uom"
    t.decimal  "contract_price"
    t.datetime "contract_date"
    t.string   "notes"
    t.decimal  "min_qty"
    t.decimal  "max_qty"
    t.string   "payment_type"
    t.string   "payment_terms"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "contract_number"
  end

  add_index "contracts", ["cropplan_id"], :name => "index_contracts_on_cropplan_id"
  add_index "contracts", ["party_id"], :name => "index_contracts_on_party_id"
  add_index "contracts", ["user_id"], :name => "index_contracts_on_user_id"

  create_table "countries", :force => true do |t|
    t.string   "code2"
    t.string   "name"
    t.string   "nameLC"
    t.string   "code3"
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_id"
  end

  create_table "cropplans", :force => true do |t|
    t.integer  "crop_id"
    t.string   "plan_year"
    t.string   "plan_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "cropplanfull"
  end

  create_table "crops", :force => true do |t|
    t.string   "cropname"
    t.string   "croptype"
    t.string   "cropspecific"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "crop_uom"
    t.decimal  "price_per_uom"
    t.string   "crop_inventory_uom"
    t.decimal  "avg_yield_acre"
    t.decimal  "avg_moisture_percent"
    t.decimal  "avg_weight_uom"
    t.integer  "seed_company_id"
    t.string   "variety_hybrid"
    t.string   "lot_id"
    t.string   "seed_rate_uom"
    t.string   "seed_rate_land"
    t.decimal  "seed_rate"
    t.string   "plant_depth"
    t.string   "crop_purpose"
  end

  add_index "crops", ["user_id"], :name => "index_crops_on_user_id"

  create_table "equipment", :force => true do |t|
    t.string   "description"
    t.integer  "user_id"
    t.string   "category"
    t.string   "make"
    t.string   "model"
    t.string   "year"
    t.string   "serial_number"
    t.decimal  "cost_unit"
    t.decimal  "cost_unit_hour"
    t.decimal  "width"
    t.string   "photo_path"
    t.float    "frequency_hours"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "rate_per_hour"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "photo"
    t.decimal  "list_price"
    t.decimal  "purchase_price"
    t.decimal  "salvage_value"
    t.integer  "life_years"
    t.integer  "model_year"
    t.integer  "purchase_year"
    t.integer  "hours_usage_year"
    t.decimal  "loan_amount"
    t.decimal  "depreciation_year"
    t.decimal  "capital_recovery_year"
    t.decimal  "capital_recovery_factor"
    t.decimal  "tax_amount"
    t.decimal  "insurance_amount"
    t.decimal  "housing_cost"
    t.integer  "horsepower"
    t.string   "fuel_type"
    t.integer  "interest_rate"
  end

  create_table "equipmentactivities", :force => true do |t|
    t.integer  "equipment_id"
    t.integer  "user_id"
    t.string   "activity"
    t.date     "activity_date"
    t.decimal  "service_cost"
    t.string   "service_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_fullservice"
    t.string   "activity_type"
  end

  create_table "events", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.boolean  "all_day"
    t.string   "notes"
    t.integer  "farmjob_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "color"
  end

  add_index "events", ["farmjob_id"], :name => "index_events_on_farmjob_id"
  add_index "events", ["user_id"], :name => "index_events_on_user_id"

  create_table "farmexpenses", :force => true do |t|
    t.integer  "farm_id"
    t.string   "expense_type"
    t.string   "expense_name"
    t.decimal  "expense_amount"
    t.string   "expense_year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "farmexpenses", ["user_id"], :name => "index_farmexpenses_on_user_id"

  create_table "farmjobequipments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "farmjob_id"
    t.integer  "equipment_id"
    t.decimal  "qty_required"
    t.decimal  "additional_cost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "qty_actual"
    t.decimal  "cost_unit_hour"
    t.decimal  "rate_hour"
  end

  create_table "farmjoblabors", :force => true do |t|
    t.integer  "user_id"
    t.integer  "farmjob_id"
    t.integer  "party_id"
    t.decimal  "task_hours"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "rate"
  end

  create_table "farmjobs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "fieldtask_id"
    t.integer  "field_id"
    t.integer  "crop_id"
    t.float    "area_size"
    t.float    "total_hours"
    t.string   "notes"
    t.integer  "equipment_id"
    t.decimal  "applied_area"
    t.decimal  "plan_rate"
    t.decimal  "actual_rate"
    t.string   "growth_stage"
    t.string   "application_method"
    t.string   "soil_condition"
    t.string   "soil_type"
    t.string   "weather_segment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "job_status"
    t.string   "workorder"
    t.string   "eventname"
    t.date     "start_date"
    t.date     "stop_date"
    t.integer  "cropplan_id"
    t.datetime "start_time"
    t.datetime "stop_time"
    t.boolean  "isreplicate"
    t.integer  "from_farmjob_id"
    t.boolean  "has_been_completed"
    t.decimal  "supply_cost"
    t.decimal  "labor_cost"
    t.decimal  "equipment_cost"
    t.decimal  "total_cost"
    t.string   "wind_direction"
    t.string   "wind_speed"
    t.integer  "temperature"
    t.integer  "humidity"
    t.string   "sky_condition"
  end

  add_index "farmjobs", ["cropplan_id"], :name => "index_farmjobs_on_cropplan_id"
  add_index "farmjobs", ["user_id"], :name => "index_farmjobs_on_user_id"

  create_table "farmjobsupplies", :force => true do |t|
    t.integer  "user_id"
    t.integer  "farmjob_id"
    t.integer  "supply_id"
    t.decimal  "actual_qty"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "usage_uom"
  end

  create_table "farms", :force => true do |t|
    t.string   "farmname"
    t.decimal  "total_acres"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.float    "land_expense_year"
    t.string   "logo"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer  "party_id"
  end

  add_index "farms", ["user_id"], :name => "index_farms_on_user_id"

  create_table "fieldmappings", :force => true do |t|
    t.integer  "field_id"
    t.integer  "user_id"
    t.integer  "shape_id"
    t.string   "shape_description"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fields", :force => true do |t|
    t.integer  "user_id"
    t.string   "farmname"
    t.integer  "client_id"
    t.string   "location"
    t.decimal  "number_acres"
    t.string   "holding_status"
    t.integer  "owner_id"
    t.decimal  "area_mapped"
    t.decimal  "area_legal"
    t.decimal  "area_tillable"
    t.string   "current_state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_id"
    t.string   "fieldname"
    t.string   "start_row"
    t.string   "end_row"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.decimal  "land_expense_year"
    t.integer  "soil_testlab_id"
    t.string   "soil_testresults_file"
    t.integer  "farm_id"
    t.decimal  "percent_harvest_acre",    :precision => 9, :scale => 2
    t.decimal  "fixed_amount_acre",       :precision => 9, :scale => 2
    t.string   "fixed_uom"
    t.string   "soilreport_file_name"
    t.string   "soilreport_content_type"
    t.integer  "soilreport_file_size"
    t.datetime "soilreport_updated_at"
  end

  add_index "fields", ["farm_id"], :name => "index_fields_on_farm_id"
  add_index "fields", ["farmname"], :name => "index_fields_on_farmname"
  add_index "fields", ["user_id"], :name => "index_fields_on_user_id"

  create_table "fieldtasks", :force => true do |t|
    t.integer  "user_id"
    t.string   "task_type"
    t.string   "taskdescription"
    t.string   "task_notes"
    t.integer  "task_frequency_days"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "task_duration_days"
    t.string   "task_stage"
  end

  create_table "fieldtasksupplies", :force => true do |t|
    t.integer  "user_id"
    t.integer  "fieldtask_id"
    t.integer  "supply_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "usage_uom"
    t.decimal  "qty_required"
  end

  create_table "inventorylots", :force => true do |t|
    t.integer  "scaleticket_id"
    t.integer  "cropplan_id"
    t.string   "inventory_uom"
    t.string   "grade"
    t.string   "lab_report"
    t.integer  "storage_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.decimal  "qty_in"
    t.decimal  "qty_onhand"
    t.decimal  "transfer_amount"
    t.decimal  "qty_out_transfer"
    t.decimal  "qty_out_ship"
    t.string   "cropreport_file_name"
    t.string   "cropreport_content_type"
    t.integer  "cropreport_file_size"
    t.datetime "cropreport_updated_at"
  end

  add_index "inventorylots", ["cropplan_id"], :name => "index_inventorylots_on_cropplan_id"
  add_index "inventorylots", ["scaleticket_id"], :name => "index_inventorylots_on_scaleticket_id"
  add_index "inventorylots", ["storage_id"], :name => "index_inventorylots_on_storage_id"
  add_index "inventorylots", ["user_id"], :name => "index_inventorylots_on_user_id"

  create_table "inventorytickets", :force => true do |t|
    t.integer  "scaleticket_id"
    t.integer  "field_id"
    t.integer  "pack_qty"
    t.string   "inventory_uom"
    t.integer  "inventorylot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "inventorytickets", ["field_id"], :name => "index_inventorytickets_on_field_id"
  add_index "inventorytickets", ["inventorylot_id"], :name => "index_inventorytickets_on_inventorylot_id"
  add_index "inventorytickets", ["scaleticket_id"], :name => "index_inventorytickets_on_scaleticket_id"

  create_table "invoices", :force => true do |t|
    t.string   "invoice_number"
    t.integer  "shipment_id"
    t.decimal  "ship_amount"
    t.decimal  "ship_charge"
    t.decimal  "total_amount"
    t.date     "invoice_date"
    t.string   "invoice_terms"
    t.string   "invoice_status"
    t.string   "payment_reference"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id"], :name => "index_microposts_on_user_id"

  create_table "parties", :force => true do |t|
    t.integer  "user_id"
    t.string   "partyname"
    t.string   "partylastname"
    t.string   "partyfirstname"
    t.string   "partyaddress1"
    t.string   "partyaddress2"
    t.string   "partycity"
    t.string   "partystate"
    t.string   "partypostalcode"
    t.string   "partycountry"
    t.string   "partyphone"
    t.string   "partyemail"
    t.string   "partyjobtitle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_id"
    t.decimal  "rate_hour"
    t.decimal  "charge_hour"
    t.string   "ship_address1"
    t.string   "ship_address2"
    t.string   "ship_city"
    t.string   "ship_state"
    t.string   "ship_postalcode"
    t.string   "ship_phone"
    t.string   "partyweatherpostalcode"
    t.integer  "farm_id"
    t.integer  "system_user_id"
  end

  add_index "parties", ["country_id"], :name => "index_parties_on_country_id"
  add_index "parties", ["system_user_id"], :name => "index_parties_on_system_user_id"
  add_index "parties", ["user_id"], :name => "index_parties_on_user_id"

  create_table "partyroles", :force => true do |t|
    t.integer  "party_id"
    t.integer  "partytype_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "partyroles", ["party_id"], :name => "index_partyroles_on_party_id"
  add_index "partyroles", ["partytype_id"], :name => "index_partyroles_on_partytype_id"

  create_table "partytypes", :force => true do |t|
    t.string   "typedescription"
    t.string   "typecode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "podetails", :force => true do |t|
    t.integer  "po_id"
    t.integer  "user_id"
    t.integer  "supply_id"
    t.integer  "storage_id"
    t.decimal  "qty_ordered"
    t.decimal  "order_price"
    t.decimal  "ext_amount"
    t.string   "detail_status"
    t.decimal  "qty_received"
    t.decimal  "receipt_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "supply_uom"
  end

  create_table "pos", :force => true do |t|
    t.string   "ponumber"
    t.integer  "user_id"
    t.date     "orderdate"
    t.date     "duedate"
    t.string   "po_status"
    t.string   "payment_type"
    t.string   "payment_number"
    t.integer  "supplier_id"
    t.string   "notes"
    t.string   "po_type"
    t.decimal  "order_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "scaletickets", :force => true do |t|
    t.integer  "cropplan_id"
    t.float    "pack_qty"
    t.string   "weight_uom"
    t.float    "gross_weight"
    t.decimal  "tare_weight"
    t.decimal  "net_weight"
    t.decimal  "moisture_pct"
    t.integer  "party_id"
    t.datetime "tran_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "storage_id"
    t.integer  "field_id_1"
    t.integer  "field_pct_1"
    t.integer  "field_id_2"
    t.integer  "field_pct_2"
    t.integer  "field_id_3"
    t.integer  "field_pct_3"
    t.integer  "field_id_4"
    t.integer  "field_pct_4"
    t.string   "ticket_id"
    t.decimal  "weight_conversion"
    t.string   "inventory_uom"
    t.string   "inventory_update"
    t.string   "grade"
  end

  add_index "scaletickets", ["user_id"], :name => "index_scaletickets_on_user_id"

  create_table "shipmentdetails", :force => true do |t|
    t.integer  "inventorylot_id"
    t.float    "price"
    t.float    "qty"
    t.string   "qty_uom"
    t.string   "detail_status"
    t.integer  "cropplan_id"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "ext_amount"
    t.integer  "shipment_id"
    t.integer  "user_id"
    t.decimal  "original_inv_amount"
  end

  create_table "shipments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "customer_id"
    t.datetime "ship_date"
    t.integer  "contract_id"
    t.integer  "cropplan_id"
    t.integer  "trucker_id"
    t.string   "trucker_name"
    t.string   "manifest_id"
    t.string   "shipto_street"
    t.string   "shipto_city"
    t.string   "shipto_state"
    t.string   "shipto_postalcode"
    t.decimal  "shipping_charge"
    t.decimal  "commission_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "broker_id"
    t.decimal  "ship_amount"
    t.string   "ship_status"
    t.integer  "farm_id"
  end

  create_table "storages", :force => true do |t|
    t.string   "name"
    t.float    "size"
    t.string   "size_uom"
    t.string   "location"
    t.decimal  "capacity"
    t.string   "capacity_uom"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "storage_type"
    t.integer  "user_id"
    t.decimal  "yearly_cost"
    t.boolean  "is_supply_default"
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "user_id"
    t.string   "name_on_card"
    t.string   "card_last4"
    t.string   "card_exp_month"
    t.string   "card_exp_year"
    t.datetime "start_date"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stripe_card_token"
    t.string   "stripe_customer_token"
    t.string   "address_line_1"
    t.string   "address_zip"
  end

  create_table "supplies", :force => true do |t|
    t.integer  "user_id"
    t.string   "supplyname"
    t.string   "supply_type"
    t.string   "supply_uom"
    t.decimal  "supply_cost_uom"
    t.decimal  "rate_acre"
    t.string   "epa_id"
    t.string   "manufacturer"
    t.string   "formulation"
    t.string   "carrier"
    t.decimal  "carrier_rate_acre"
    t.string   "problem_target"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "item_number"
    t.string   "distribution_uom"
    t.decimal  "conversion_factor"
    t.decimal  "supply_charge_uom"
    t.decimal  "nitrogen_content",    :precision => 9, :scale => 2
    t.decimal  "phosphorous_content", :precision => 9, :scale => 2
    t.decimal  "potassium_content",   :precision => 9, :scale => 2
    t.decimal  "calcium_content",     :precision => 9, :scale => 2
    t.decimal  "manganese_content",   :precision => 9, :scale => 2
    t.decimal  "magnesium_content",   :precision => 9, :scale => 2
    t.string   "chemical_type"
    t.string   "active_ingredient"
    t.decimal  "chemical_rate_acre",  :precision => 9, :scale => 2
    t.string   "chemical_uom"
    t.string   "carrier_uom"
    t.decimal  "restricted_hours",    :precision => 9, :scale => 2
  end

  create_table "supplyinventories", :force => true do |t|
    t.integer  "supply_id"
    t.string   "supply_uom"
    t.integer  "user_id"
    t.integer  "storage_id"
    t.decimal  "qty_in"
    t.decimal  "qty_onhand"
    t.decimal  "qty_out"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "onhand_value"
    t.decimal  "avg_cost"
  end

  create_table "supplyinventory_trans", :force => true do |t|
    t.integer  "supplyinventory_id"
    t.string   "supply_tran_type"
    t.integer  "supply_tran_type_id"
    t.float    "supply_tran_qty"
    t.decimal  "supply_tran_cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", :force => true do |t|
    t.string   "typename"
    t.string   "type_value_string"
    t.integer  "type_value_integer"
    t.boolean  "type_boolean"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "type_isprotected"
  end

  add_index "types", ["typename"], :name => "index_types_on_typename"
  add_index "types", ["user_id"], :name => "index_types_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin",              :default => false
    t.string   "security_question"
    t.string   "security_answer"
    t.integer  "party_id"
    t.string   "stripe_customer_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "weathers", :force => true do |t|
    t.date     "weather_date"
    t.datetime "weather_time"
    t.string   "postalcode"
    t.string   "temperature_high"
    t.string   "temperature_low"
    t.string   "wind_speed"
    t.string   "wind_direction_degrees"
    t.string   "wind_direction_compass"
    t.string   "precipitation"
    t.string   "sky_condition"
    t.string   "weather_condition_1"
    t.string   "weather_condition_2"
    t.string   "weather_condition_3"
    t.string   "weather_condition_4"
    t.string   "weather_condition_5"
    t.string   "weather_condition_6"
    t.string   "weather_condition_7"
    t.string   "weather_condition_8"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "weathers", ["postalcode"], :name => "index_weathers_on_postalcode"
  add_index "weathers", ["weather_date"], :name => "index_weathers_on_weather_date"

  create_table "ztimes", :force => true do |t|
    t.string   "timekey"
    t.string   "timedisplay"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
