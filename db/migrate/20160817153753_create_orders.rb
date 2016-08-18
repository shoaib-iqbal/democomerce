class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

   	t.decimal  "total",                             precision: 10, scale: 2, default: 0.0,     null: false
    t.string   "state"
    t.integer  "user_id"
    t.datetime "completed_at"
    t.decimal  "payment_total",                     precision: 10, scale: 2, default: 0.0
    t.string   "shipment_state"
    t.string   "payment_state"
    t.string   "email"
    t.text     "special_instructions"

      t.timestamps null: false
    end
  end
end
