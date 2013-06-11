class AddRobotIdToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :robot_id, :integer
  end
end
