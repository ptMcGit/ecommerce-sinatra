class AddListedByColumnToItemsTable < ActiveRecord::Migration
  def change
    add_column :items, :listed_by, :integer
  end
end
