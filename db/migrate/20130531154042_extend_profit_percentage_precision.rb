class ExtendProfitPercentagePrecision < ActiveRecord::Migration
  def change
    change_column :trades, :profit_percentage, :decimal, :precision => 10, :scale => 10
  end
end
