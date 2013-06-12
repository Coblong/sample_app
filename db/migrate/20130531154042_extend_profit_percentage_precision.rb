class ExtendProfitPercentagePrecision < ActiveRecord::Migration
  def change
    change_column :trades, :profit_percentage, :decimal
  end
end
