class DropStrategyFromRobots < ActiveRecord::Migration
  def up
  end

  def down
    remove_column :robots, :strategy
  end
end
