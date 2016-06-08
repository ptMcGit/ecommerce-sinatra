class SetColumnsToAppropriateTypes < ActiveRecord::Migration
  def change
    change_column :purchases, :item_id, :integer
    change_column :purchases, :user_id, :integer
  end
end
