class Robot < ActiveRecord::Base
  attr_accessible :report, :upload_comment
  attr_accessor :report, :upload_comment
  belongs_to :user
  has_many :robot_configs, dependent: :destroy, :autosave => true
  has_many :trades, dependent: :destroy, :autosave => true
  
  validates :user_id, presence: true
  
  default_scope order: 'robots.id'

  def for_equity_chart (robot_config)
    
    data = [["", "Money"]]
    balance = BigDecimal('100000.00')
    trades.each do |t|
      if !t.is_disabled(robot_config)
        profit = BigDecimal((balance * t.profit_percentage).to_s)
        balance += profit
        balance = balance.truncate(2)
        data += [["", balance.to_i]]
      end
    end
    data
  end

  def name
    symbol + timeframe
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
