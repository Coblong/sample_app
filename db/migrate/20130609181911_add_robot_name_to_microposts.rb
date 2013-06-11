class AddRobotNameToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :robot_name, :string
  end
end
