class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.integer  :robot_id
      t.datetime :open_time
      t.integer  :duration
      t.string   :direction
      t.integer  :order_id
      t.decimal  :profit_percentage
      t.boolean  :stopped_out

      t.timestamps
    end
    add_index :trades, [:robot_id, :created_at]
  end
end
