class ChangeCurrencyPairToSymbolInRobots < ActiveRecord::Migration
  def change
    rename_column :robots, :currency_pair, :symbol
  end
end
