class AddStartAndEndDatesToRobots < ActiveRecord::Migration
  def change
    add_column :robots, :start_date, :datetime
    add_column :robots, :end_date, :datetime
  end
end
