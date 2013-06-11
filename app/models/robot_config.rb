class RobotConfig < ActiveRecord::Base
  belongs_to :robot
  belongs_to :user
  has_many :microposts, dependent: :destroy, :autosave => true
  validates :robot_id, presence: true  
  validates :user_id, presence: true  
  
  default_scope order: 'real_profit_factor DESC'

  def tokyo_selected
    hours_00_01_GMT and hours_01_02_GMT and hours_02_03_GMT and hours_03_04_GMT and hours_04_05_GMT and hours_05_06_GMT and hours_06_07_GMT and hours_23_00_GMT
  end

  def london_selected
    hours_07_08_GMT and hours_08_09_GMT and hours_09_10_GMT and hours_10_11_GMT and hours_11_12_GMT and hours_12_13_GMT and hours_13_14_GMT and hours_14_15_GMT and hours_15_16_GMT
  end

  def newyork_selected
    hours_12_13_GMT and hours_13_14_GMT and hours_14_15_GMT and hours_15_16_GMT and hours_16_17_GMT and hours_17_18_GMT and hours_18_19_GMT and hours_19_20_GMT 
  end

  def updated_date
    updated_at.strftime("%d.%m.%y %H:%M")
  end

  def created_date
    created_at.strftime("%d.%m.%y %H:%M")
  end

  def created_date_short
    created_at.strftime("%d.%m.%y")
  end
end
