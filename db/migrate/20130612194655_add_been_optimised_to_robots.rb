class AddBeenOptimisedToRobots < ActiveRecord::Migration
  def change
    add_column :robots, :been_optimised, :boolean  
  end
end
