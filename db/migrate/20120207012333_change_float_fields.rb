class ChangeFloatFields < ActiveRecord::Migration
  def self.up

        change_column :contracts, :contract_price, :decimal, { :scale => 2, :precision => 9 }
        change_column :contracts, :min_qty, :decimal, { :scale => 2, :precision => 9 }
        change_column :contracts, :max_qty, :decimal, { :scale => 2, :precision => 9 }
        change_column  :crops, :avg_yield_acre, :decimal, { :scale => 2, :precision => 9 }
        change_column  :crops, :avg_moisture_percent, :decimal, { :scale => 2, :precision => 9 }
        change_column  :crops, :avg_weight_uom, :decimal, { :scale => 2, :precision => 9 }
        change_column  :crops, :seed_rate, :decimal, { :scale => 2, :precision => 9 }
       # change_column  :crops, :price_per_uom, :decimal, { :scale => 2, :precision => 9 }
        change_column :equipment, :cost_unit_hour, :decimal, { :scale => 2, :precision => 9 }
        change_column :equipment, :width, :decimal, { :scale => 2, :precision => 9 }
        change_column :equipment, :cost_unit, :decimal, { :scale => 2, :precision => 9 }
        change_column :equipment, :rate_per_hour, :decimal, { :scale => 2, :precision => 9 }
        change_column :equipmentactivities, :service_cost, :decimal, { :scale => 2, :precision => 9 }
        change_column :farmexpenses, :expense_amount, :decimal, { :scale => 2, :precision => 9 }
        change_column :farmjobequipments, :qty_required, :decimal, { :scale => 2, :precision => 9 }
        change_column :farmjobequipments, :additional_cost, :decimal, { :scale => 2, :precision => 9 }
        change_column :farmjobequipments, :qty_actual, :decimal, { :scale => 2, :precision => 9 }
        change_column :farmjobequipments, :cost_unit_hour, :decimal, { :scale => 2, :precision => 9 }
        change_column :farmjobequipments, :rate_hour, :decimal, { :scale => 2, :precision => 9 }
        change_column :farmjoblabors, :task_hours, :decimal, { :scale => 2, :precision => 9 }
        change_column :farmjoblabors, :rate, :decimal, { :scale => 2, :precision => 9 }
        change_column :farmjobs, :applied_area, :decimal, { :scale => 2, :precision => 9 }
        change_column :farmjobs, :plan_rate, :decimal, { :scale => 2, :precision => 9 }
        change_column :farmjobs, :actual_rate, :decimal, { :scale => 2, :precision => 9 }
        change_column :farmjobs, :supply_cost, :decimal, { :scale => 2, :precision => 9 }
        change_column :farmjobs, :labor_cost, :decimal, { :scale => 2, :precision => 9 }
        change_column :farmjobs, :equipment_cost, :decimal, { :scale => 2, :precision => 9 }
        change_column :farmjobs, :total_cost, :decimal, { :scale => 2, :precision => 9 }
        change_column :farmjobsupplies,:actual_qty, :decimal, { :scale => 2, :precision => 9 }
        change_column :farms, :total_acres, :decimal, { :scale => 2, :precision => 9 }
        change_column :fields,  :number_acres, :decimal, { :scale => 2, :precision => 9 }
        change_column :fields,  :area_mapped, :decimal, { :scale => 2, :precision => 9 }
        change_column :fields, :area_legal, :decimal, { :scale => 2, :precision => 9 }
        change_column :fields, :area_tillable, :decimal, { :scale => 2, :precision => 9 }
        change_column :fields, :land_expense_year, :decimal, { :scale => 2, :precision => 9 }
        change_column :fieldtasksupplies, :qty_required, :decimal, { :scale => 2, :precision => 9 }
        change_column :inventorylots,  :qty_in, :decimal, { :scale => 2, :precision => 9 }
        change_column :inventorylots,  :qty_onhand, :decimal, { :scale => 2, :precision => 9 }
        change_column :inventorylots,  :transfer_amount, :decimal, { :scale => 2, :precision => 9 }
        change_column :inventorylots,  :qty_out_transfer, :decimal, { :scale => 2, :precision => 9 }
        change_column :inventorylots,  :qty_out_ship, :decimal, { :scale => 2, :precision => 9 }
        change_column :invoices, :ship_amount, :decimal, { :scale => 2, :precision => 9 }
        change_column :invoices, :ship_charge, :decimal, { :scale => 2, :precision => 9 }
        change_column :invoices, :total_amount, :decimal, { :scale => 2, :precision => 9 }
        change_column :parties, :rate_hour, :decimal, { :scale => 2, :precision => 9 }
        change_column :parties, :charge_hour, :decimal, { :scale => 2, :precision => 9 }
        change_column :podetails, :qty_ordered, :decimal, { :scale => 2, :precision => 9 }
        change_column :podetails, :order_price, :decimal, { :scale => 2, :precision => 9 }
        change_column :podetails, :ext_amount, :decimal, { :scale => 2, :precision => 9 }
        change_column :podetails, :qty_received, :decimal, { :scale => 2, :precision => 9 }
        change_column :podetails, :receipt_amount, :decimal, { :scale => 2, :precision => 9 }
        change_column :pos, :order_amount, :decimal, { :scale => 2, :precision => 9 }
        change_column :scaletickets, :tare_weight, :decimal, { :scale => 2, :precision => 9 }
        change_column :scaletickets, :net_weight, :decimal, { :scale => 2, :precision => 9 }
        change_column :scaletickets, :moisture_pct, :decimal, { :scale => 2, :precision => 9 }
        change_column :scaletickets, :weight_conversion, :decimal, { :scale => 2, :precision => 9 }
        change_column :shipmentdetails, :ext_amount, :decimal, { :scale => 2, :precision => 9 }
        change_column :shipmentdetails, :original_inv_amount, :decimal, { :scale => 2, :precision => 9 }
        change_column :shipments, :ship_amount, :decimal, { :scale => 2, :precision => 9 }
        change_column :shipments, :shipping_charge, :decimal, { :scale => 2, :precision => 9 }
        change_column :shipments, :commission_amount, :decimal, { :scale => 2, :precision => 9 }
        change_column :storages, :capacity, :decimal, { :scale => 2, :precision => 9 }
        change_column :storages, :yearly_cost, :decimal, { :scale => 2, :precision => 9 }
        change_column :supplies, :supply_cost_uom, :decimal, { :scale => 2, :precision => 9 }
        change_column :supplies, :rate_acre, :decimal, { :scale => 2, :precision => 9 }
        change_column :supplies, :carrier_rate_acre, :decimal, { :scale => 2, :precision => 9 }
        change_column :supplies, :conversion_factor, :decimal, { :scale => 2, :precision => 9 }
        change_column :supplies, :supply_charge_uom, :decimal, { :scale => 2, :precision => 9 }
        change_column :supplyinventories, :qty_in, :decimal, { :scale => 2, :precision => 9 }
        change_column :supplyinventories, :qty_onhand, :decimal, { :scale => 2, :precision => 9 }
        change_column :supplyinventories, :qty_out, :decimal, { :scale => 2, :precision => 9 }
        change_column :supplyinventories, :onhand_value, :decimal, { :scale => 2, :precision => 9 }
        change_column :supplyinventories, :avg_cost, :decimal, { :scale => 2, :precision => 9 }
        change_column :supplyinventory_trans, :supply_tran_cost, :decimal, { :scale => 2, :precision => 9 }




  end

  def self.down
  end
end
