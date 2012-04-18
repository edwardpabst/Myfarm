class AddFinalIndexes < ActiveRecord::Migration
  def self.up


  add_index :comments, :user_id
  add_index :comments, :micropost_id
  add_index :cropplanfields, :user_id
  add_index :cropplanfields, :field_id
  add_index :cropplanfields, :cropplan_id
  add_index :cropplans, :user_id
  add_index :cropplans, :crop_id
  add_index :equipment, :user_id
  add_index :equipmentactivities, :user_id
  add_index :equipmentactivities, :equipment_id
  add_index :farmexpenses, :farm_id
  add_index :farmjobequipments, :user_id
  add_index :farmjobequipments, :farmjob_id
  add_index :farmjoblabors, :user_id
  add_index :farmjoblabors, :farmjob_id
  add_index :farmjobsupplies, :user_id
  add_index :farmjobsupplies, :farmjob_id
  add_index :farmjobs, :field_id
  add_index :farmjobs, :fieldtask_id
  add_index :fieldmappings, :user_id
  add_index :fieldmappings, :field_id
  add_index :fieldtasks, :user_id
  add_index :fieldtasksupplies, :user_id
  add_index :fieldtasksupplies, :fieldtask_id
  add_index :invoices, :user_id
  add_index :invoices, :shipment_id
  add_index :invoices, :invoice_number
  add_index :podetails, :po_id
  add_index :podetails, :storage_id
  add_index :podetails, :user_id
  add_index :pos, :user_id
  add_index :pos, :supplier_id
  add_index :scaletickets, :cropplan_id
  add_index :shipmentdetails, :shipment_id
  add_index :shipmentdetails, :inventorylot_id
  add_index :shipmentdetails, :cropplan_id
  add_index :shipmentdetails, :user_id
  add_index :shipments, :user_id
  add_index :shipments, :cropplan_id
  add_index :storages, :user_id
  add_index :subscriptions, :user_id
  add_index :supplies, :user_id
  add_index :supplies, :supplyname
  add_index :supplyinventories, :user_id
  add_index :supplyinventories, :supply_id
  add_index :supplyinventories, :storage_id
  add_index :supplyinventory_trans, :supplyinventory_id



  end

  def self.down

  remove_index :comments, :user_id
  remove_index :comments, :micropost_id
  remove_index :cropplanfields, :user_id
  remove_index :cropplanfields, :field_id
  remove_index :cropplanfields, :cropplan_id
  remove_index :cropplans, :user_id
  remove_index :cropplans, :crop_id
  remove_index :equipment, :user_id
  remove_index :equipmentactivities, :user_id
  remove_index :equipmentactivities, :equipment_id
  remove_index :farmexpenses, :farm_id
  remove_index :farmjobequipments, :user_id
  remove_index :farmjobequipments, :farmjob_id
  remove_index :farmjoblabors, :user_id
  remove_index :farmjoblabors, :farmjob_id
  remove_index :farmjobsupplies, :user_id
  remove_index :farmjobsupplies, :farmjob_id
  remove_index :farmjobs, :field_id
  remove_index :farmjobs, :fieldtask_id
  remove_index :fieldmappings, :user_id
  remove_index :fieldmappings, :field_id
  remove_index :fieldtasks, :user_id
  remove_index :fieldtasksupplies, :user_id
  remove_index :fieldtasksupplies, :fieldtask_id
  remove_index :invoices, :user_id
  remove_index :invoices, :shipment_id
  remove_index :invoices, :invoice_number
  remove_index :podetails, :po_id
  remove_index :podetails, :storage_id
  remove_index :podetails, :user_id
  remove_index :pos, :user_id
  remove_index :pos, :supplier_id
  remove_index :scaletickets, :cropplan_id
  remove_index :shipmentdetails, :shipment_id
  remove_index :shipmentdetails, :inventorylot_id
  remove_index :shipmentdetails, :cropplan_id
  remove_index :shipmentdetails, :user_id
  remove_index :shipments, :user_id
  remove_index :shipments, :cropplan_id
  remove_index :storages, :user_id
  remove_index :subscriptions, :user_id
  remove_index :supplies, :user_id
  remove_index :supplies, :supplyname
  remove_index :supplyinventories, :user_id
  remove_index :supplyinventories, :supply_id
  remove_index :supplyinventories, :storage_id
  remove_index supplyinventory_trans, :supplyinventory_id


  end

end
