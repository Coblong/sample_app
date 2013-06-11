class CreateRobots < ActiveRecord::Migration
  def change
    create_table :robots do |t|
      t.integer :user_id
      t.string :currency_pair
      t.string :timeframe
      t.string :strategy

      t.timestamps
    end
    add_index :robots, [:user_id, :created_at]
  end
end
