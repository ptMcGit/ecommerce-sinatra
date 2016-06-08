class ChangeQuantityColumnInPurchasesTable < ActiveRecord::Migration
  def change
    change_column :purchases, :quantity, :integer
  end
end
